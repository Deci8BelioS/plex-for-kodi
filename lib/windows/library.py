import os
import random
import urllib
import json
import threading

import xbmc
import xbmcgui
import kodigui

from lib import colors
from lib import util
from lib import backgroundthread

import busy
import subitems
import preplay
import search
import plexnet
import dropdown
import opener
import windowutils

from plexnet import playqueue

from lib.util import T

CHUNK_SIZE = 200
# CHUNK_SIZE = 30

KEYS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'

MOVE_SET = frozenset(
    (
        xbmcgui.ACTION_MOVE_LEFT,
        xbmcgui.ACTION_MOVE_RIGHT,
        xbmcgui.ACTION_MOVE_UP,
        xbmcgui.ACTION_MOVE_DOWN,
        xbmcgui.ACTION_MOUSE_MOVE,
        xbmcgui.ACTION_PAGE_UP,
        xbmcgui.ACTION_PAGE_DOWN,
        xbmcgui.ACTION_FIRST_PAGE,
        xbmcgui.ACTION_LAST_PAGE,
        xbmcgui.ACTION_MOUSE_WHEEL_DOWN,
        xbmcgui.ACTION_MOUSE_WHEEL_UP
    )
)

THUMB_POSTER_DIM = (268, 397)
THUMB_AR16X9_DIM = (619, 348)
THUMB_SQUARE_DIM = (355, 355)
ART_AR16X9_DIM = (630, 355)

TYPE_KEYS = {
    'episode': {
        'fallback': 'show',
        'thumb_dim': THUMB_POSTER_DIM,
    },
    'season': {
        'fallback': 'show',
        'thumb_dim': THUMB_POSTER_DIM
    },
    'movie': {
        'fallback': 'movie',
        'thumb_dim': THUMB_POSTER_DIM,
        'art_dim': ART_AR16X9_DIM
    },
    'show': {
        'fallback': 'show',
        'thumb_dim': THUMB_POSTER_DIM,
        'art_dim': ART_AR16X9_DIM
    },
    'album': {
        'fallback': 'music',
        'thumb_dim': THUMB_SQUARE_DIM
    },
    'artist': {
        'fallback': 'music',
        'thumb_dim': THUMB_SQUARE_DIM
    },
    'track': {
        'fallback': 'music',
        'thumb_dim': THUMB_SQUARE_DIM
    },
    'photo': {
        'fallback': 'photo',
        'thumb_dim': THUMB_SQUARE_DIM
    },
    'clip': {
        'fallback': 'movie16x9',
        'thumb_dim': THUMB_POSTER_DIM
    },
}

TYPE_PLURAL = {
    'artist': T(32347, 'artists'),
    'movie': T(32348, 'movies'),
    'photo': T(32349, 'photos'),
    'show': T(32350, 'Shows'),
    'episode': T(32458, 'Episodes')
}

SORT_KEYS = {
    'movie': {
        'addedAt': {'title': T(32351, 'By Date Added'), 'display': T(32352, 'Date Added')},
        'originallyAvailableAt': {'title': T(32353, 'By Release Date'), 'display': T(32354, 'Release Date')},
        'lastViewedAt': {'title': T(32355, 'By Date Viewed'), 'display': T(32356, 'Date Viewed')},
        'titleSort': {'title': T(32357, 'By Name'), 'display': T(32358, 'Name')},
        'rating': {'title': T(32359, 'By Rating'), 'display': T(32360, 'Rating')},
        'resolution': {'title': T(32361, 'By Resolution'), 'display': T(32362, 'Resolution')},
        'duration': {'title': T(32363, 'By Duration'), 'display': T(32364, 'Duration')},
        'unwatched': {'title': T(32367, 'By Unwatched'), 'display': T(32368, 'Unwatched')},
        'viewCount': {'title': T(32371, 'By Play Count'), 'display': T(32372, 'Play Count')}
    },
    'show': {
        'originallyAvailableAt': {'title': T(32365, 'By First Aired'), 'display': T(32366, 'First Aired')},
        'unviewedLeafCount': {'title': T(32367, 'By Unwatched'), 'display': T(32368, 'Unwatched')},
        'show.titleSort': {'title': T(32457, 'By Show'), 'display': T(32456, 'Show')},
    },
    'artist': {
        'lastViewedAt': {'title': T(32369, 'By Date Played'), 'display': T(32370, 'Date Played')}
    },
    'photo': {
        'originallyAvailableAt': {'title': T(32373, 'By Date Taken'), 'display': T(32374, 'Date Taken')}
    },
    'photodirectory': {}
}

ITEM_TYPE = None


def setItemType(type_=None):
    global ITEM_TYPE
    ITEM_TYPE = type_


class ChunkRequestTask(backgroundthread.Task):
    def setup(self, section, start, size, callback, filter_=None, sort=None, unwatched=False):
        self.section = section
        self.start = start
        self.size = size
        self.callback = callback
        self.filter = filter_
        self.sort = sort
        self.unwatched = unwatched
        return self

    def contains(self, pos):
        return self.start <= pos <= (self.start + self.size)

    def run(self):
        if self.isCanceled():
            return

        try:
            type_ = None
            if ITEM_TYPE == 'episode':
                type_ = 4
            items = self.section.all(self.start, self.size, self.filter, self.sort, self.unwatched, type_=type_)
            if self.isCanceled():
                return
            self.callback(items, self.start)
        except plexnet.exceptions.BadRequest:
            util.DEBUG_LOG('404 on section: {0}'.format(repr(self.section.title)))


class PhotoPropertiesTask(backgroundthread.Task):
    def setup(self, photo, callback):
        self.photo = photo
        self.callback = callback
        return self

    def run(self):
        if self.isCanceled():
            return

        try:
            self.photo.reload()
            self.callback(self.photo)
        except plexnet.exceptions.BadRequest:
            util.DEBUG_LOG('404 on photo reload: {0}'.format(self.photo))


class LibrarySettings(object):
    def __init__(self, section_or_server_id, item_type=None):
        if isinstance(section_or_server_id, basestring):
            self.serverID = section_or_server_id
            self.sectionID = None
        else:
            self.serverID = section_or_server_id.getServer().uuid
            self.sectionID = section_or_server_id.key

        if item_type:
            self._itemType = '.{0}'.format(item_type)
        else:
            self._itemType = ''

        self._loadSettings()

    def _loadSettings(self):
        jsonString = util.getSetting('library.settings.{0}{1}'.format(self.serverID, self._itemType), '')
        self._settings = {}
        try:
            self._settings = json.loads(jsonString)
        except ValueError:
            pass
        except:
            util.ERROR()

    def _saveSettings(self):
        jsonString = json.dumps(self._settings)
        util.setSetting('library.settings.{0}'.format(self.serverID), jsonString)

    def setSection(self, section_id):
        self.sectionID = section_id

    def getSetting(self, setting, default=None):
        if not self._settings or self.sectionID not in self._settings:
            return default

        return self._settings[self.sectionID].get(setting, default)

    def setSetting(self, setting, value):
        if self.sectionID not in self._settings:
            self._settings[self.sectionID] = {}
        self._settings[self.sectionID][setting] = value

        self._saveSettings()


class ChunkedWrapList(kodigui.ManagedControlList):
    LIST_MAX = CHUNK_SIZE * 3

    def __getitem__(self, idx):
        if isinstance(idx, slice):
            return self.items[idx]
        else:
            idx = idx % self.LIST_MAX
            return self.getListItem(idx)


class ChunkModeWrapped(object):
    def __init__(self):
        self.midStart = 0
        self.itemCount = 0
        self.keys = {}

    def addKeyRange(self, key, krange):
        self.keys[key] = krange

    def getKey(self, pos):
        for k, krange in self.keys.items():
            if krange[0] <= pos <= krange[1]:
                return k

    def isAtBeginning(self):
        return self.midStart == 0

    def posIsForward(self, pos):
        return pos >= self.midStart + CHUNK_SIZE

    def posIsBackward(self, pos):
        return pos < self.midStart

    def posIsValid(self, pos):
        return self.midStart - CHUNK_SIZE <= pos < self.midStart + (CHUNK_SIZE * 2)

    def shift(self, mod):
        if mod < 0 and self.midStart == 0:
            return None
        elif mod > 0 and self.midStart + CHUNK_SIZE >= self.itemCount:
            return None

        offset = CHUNK_SIZE * mod
        self.midStart += offset
        start = self.midStart + offset

        return start

    def shiftToKey(self, key):
        if key not in self.keys:
            util.DEBUG_LOG('CHUNK MODE: NO ITEMS FOR KEY')
            return

        keyStart = self.keys[key][0]
        self.midStart = keyStart - keyStart % CHUNK_SIZE
        return keyStart, max(self.midStart - CHUNK_SIZE, 0)

    def addObjects(self, pos, objects):
        if not self.posIsValid(pos):
            return

        if pos == self.midStart - CHUNK_SIZE:
            self.objects = objects + self.objects[CHUNK_SIZE:]
        elif pos == self.midStart:
            self.objects = self.objects[:CHUNK_SIZE] + objects + self.objects[CHUNK_SIZE * 2:]
        elif pos == self.midStart + CHUNK_SIZE:
            self.objects = self.objects[:CHUNK_SIZE * 2] + objects


class CustomScrollBar(object):
    def __init__(self, window, bar_group_id, bar_image_id, bar_image_focus_id, button_id, min_bar_height=20):
        self._barGroup = window.getControl(bar_group_id)
        self._barImage = window.getControl(bar_image_id)
        self._barImageFocus = window.getControl(bar_image_focus_id)
        self._button = window.getControl(button_id)
        self.height = self._button.getHeight()
        self.x, self.y = self._barGroup.getPosition()
        self._minBarHeight = min_bar_height
        self._barHeight = min_bar_height
        self.size = 0
        self.count = 0
        self.pos = 0

    def setSizeAndCount(self, size, count):
        self.size = size
        self.count = count
        self._barHeight = min(self.height, max(self._minBarHeight, int(self.height * (count / float(size)))))
        self._moveHeigt = self.height - self._barHeight
        self._barImage.setHeight(self._barHeight)
        self._barImageFocus.setHeight(self._barHeight)

    def setPosition(self, pos):
        self.pos = pos
        offset = int((pos / float(self.size - 1)) * self._moveHeigt)
        self._barGroup.setPosition(self.x, self.y + offset)


class LibraryWindow(kodigui.MultiWindow, windowutils.UtilMixin):
    bgXML = 'script-plex-blank.xml'
    path = util.ADDON.getAddonInfo('path')
    theme = 'Main'
    res = '1080i'

    def __init__(self, *args, **kwargs):
        kodigui.MultiWindow.__init__(self, *args, **kwargs)
        windowutils.UtilMixin.__init__(self)
        self.section = kwargs.get('section')
        self.filter = kwargs.get('filter_')
        self.setItemType()
        self.keyItems = {}
        self.firstOfKeyItems = {}
        self.tasks = backgroundthread.Tasks()
        self.backgroundSet = False
        self.showPanelControl = None
        self.keyListControl = None
        self.lastItem = None
        self.reset()

        self.lock = threading.Lock()

    def reset(self):
        self.librarySettings = LibrarySettings(self.section, ITEM_TYPE)
        self.filterUnwatched = self.librarySettings.getSetting('filter.unwatched', False)
        if ITEM_TYPE == 'episode':
            self.sort = self.librarySettings.getSetting('sort', 'show.titleSort')
        else:
            self.sort = self.librarySettings.getSetting('sort', 'titleSort')
        self.sortDesc = self.librarySettings.getSetting('sort.desc', False)

        self.chunkMode = None
        if ITEM_TYPE == 'episode':
            self.chunkMode = ChunkModeWrapped()

        if self.chunkMode:
            if self.section.TYPE in ('artist', 'photo', 'photodirectory'):
                self.setWindows(VIEWS_SQUARE_CHUNKED.get('all'))
            else:
                self.setWindows(VIEWS_POSTER_CHUNKED.get('all'))
        else:
            if self.section.TYPE in ('artist', 'photo', 'photodirectory'):
                self.setWindows(VIEWS_SQUARE.get('all'))
            else:
                self.setWindows(VIEWS_POSTER.get('all'))

    def setItemType(self, type_=None):
        setItemType(type_)
        util.setGlobalProperty('item.type', str(ITEM_TYPE))

    def doClose(self):
        self.tasks.cancel()
        kodigui.MultiWindow.doClose(self)

    def onFirstInit(self):
        self.scrollBar = None
        if ITEM_TYPE == 'episode':
            self.scrollBar = CustomScrollBar(self, 950, 952, 953, 951)

        if self.showPanelControl:
            self.showPanelControl.newControl(self)
            self.keyListControl.newControl(self)
            self.showPanelControl.selectItem(0)
            self.setFocusId(self.VIEWTYPE_BUTTON_ID)
        else:
            if self.chunkMode:
                self.showPanelControl = ChunkedWrapList(self, self.POSTERS_PANEL_ID, 5)
            else:
                self.showPanelControl = kodigui.ManagedControlList(self, self.POSTERS_PANEL_ID, 5)
            self.keyListControl = kodigui.ManagedControlList(self, self.KEY_LIST_ID, 27)
            self.setProperty('no.options', self.section.TYPE != 'photodirectory' and '1' or '')
            self.setProperty('unwatched.hascount', self.section.TYPE == 'show' and '1' or '')
            self.setProperty('sort', self.sort)
            self.setProperty('filter1.display', self.filterUnwatched and T(32368, 'UNWATCHED') or T(32345, 'All'))
            self.setProperty('sort.display', SORT_KEYS[self.section.TYPE].get(self.sort, SORT_KEYS['movie'].get(self.sort))['title'])
            self.setProperty('media.type', TYPE_PLURAL.get(ITEM_TYPE or self.section.TYPE, self.section.TYPE))
            self.setProperty('media', self.section.TYPE)
            self.setProperty('hide.filteroptions', self.section.TYPE == 'photodirectory' and '1' or '')

            self.setTitle()
            self.fill()
            if self.getProperty('no.content') or self.getProperty('no.content.filtered'):
                self.setFocusId(self.HOME_BUTTON_ID)
            else:
                self.setFocusId(self.POSTERS_PANEL_ID)

    def onAction(self, action):
        try:
            if action.getId() in MOVE_SET:
                controlID = self.getFocusId()
                if controlID == self.POSTERS_PANEL_ID or controlID == self.SCROLLBAR_ID:
                    self.updateKey()
                    self.checkChunkedNav(action)
                elif controlID == self.CUSTOM_SCOLLBAR_BUTTON_ID:
                    if action == xbmcgui.ACTION_MOVE_UP:
                        self.shiftSelection(-12)
                    elif action == xbmcgui.ACTION_MOVE_DOWN:
                        self.shiftSelection(12)
            elif action == xbmcgui.ACTION_CONTEXT_MENU:
                if not xbmc.getCondVisibility('ControlGroup({0}).HasFocus(0)'.format(self.OPTIONS_GROUP_ID)):
                    self.setFocusId(self.OPTIONS_GROUP_ID)
                    return
            elif action in(xbmcgui.ACTION_NAV_BACK, xbmcgui.ACTION_CONTEXT_MENU):
                if not xbmc.getCondVisibility('ControlGroup({0}).HasFocus(0)'.format(self.OPTIONS_GROUP_ID)):
                    if xbmc.getCondVisibility('IntegerGreaterThan(Container(101).ListItem.Property(index),5)'):
                        self.setFocusId(self.OPTIONS_GROUP_ID)
                        return

            self.updateItem()

        except:
            util.ERROR()

        kodigui.MultiWindow.onAction(self, action)

    def onClick(self, controlID):
        if controlID == self.HOME_BUTTON_ID:
            self.goHome()
        elif controlID == self.POSTERS_PANEL_ID:
            self.showPanelClicked()
        elif controlID == self.KEY_LIST_ID:
            self.keyClicked()
        elif controlID == self.PLAYER_STATUS_BUTTON_ID:
            self.showAudioPlayer()
        elif controlID == self.PLAY_BUTTON_ID:
            self.playButtonClicked()
        elif controlID == self.SHUFFLE_BUTTON_ID:
            self.shuffleButtonClicked()
        elif controlID == self.OPTIONS_BUTTON_ID:
            self.optionsButtonClicked()
        elif controlID == self.VIEWTYPE_BUTTON_ID:
            self.viewTypeButtonClicked()
        elif controlID == self.SORT_BUTTON_ID:
            self.sortButtonClicked()
        elif controlID == self.FILTER1_BUTTON_ID:
            self.filter1ButtonClicked()
        elif controlID == self.ITEM_TYPE_BUTTON_ID:
            self.itemTypeButtonClicked()
        elif controlID == self.SEARCH_BUTTON_ID:
            self.searchButtonClicked()

    def onFocus(self, controlID):
        if controlID == self.KEY_LIST_ID:
            self.selectKey()

    def onItemChanged(self, mli):
        if not mli:
            return

        if not mli.dataSource or not mli.dataSource.TYPE == 'photo':
            return

        self.showPhotoItemProperties(mli.dataSource)

    def shiftSelection(self, offset):
        pos = self.showPanelControl.getSelectedPosition()
        pos += offset
        if pos < 0 or pos >= self.showPanelControl.size():
            pos = pos % self.showPanelControl.size()

        self.showPanelControl.selectItem(pos)
        self.checkChunkedNav()

    def updateKey(self, mli=None):
        mli = mli or self.showPanelControl.getSelectedItem()
        if not mli:
            return

        if self.lastItem != mli:
            self.lastItem = mli
            self.onItemChanged(mli)

        self.setProperty('key', mli.getProperty('key'))

        self.selectKey(mli)

    def checkChunkedNav(self, action=None):
        if not self.chunkMode:
            return

        # if action == xbmcgui.ACTION_PAGE_DOWN:
        #     idx = self.showPanelControl.getSelectedPosition() - 5
        #     if idx < 0:
        #         idx += self.showPanelControl.size()
        #     mli = self.showPanelControl.getListItem(idx)
        #     self.showPanelControl.selectItem(idx)
        # elif action == xbmcgui.ACTION_PAGE_UP:
        #     idx = self.showPanelControl.getSelectedPosition() + 5
        #     if idx >= self.showPanelControl.size():
        #         idx %= self.showPanelControl.size()
        #     mli = self.showPanelControl.getListItem(idx)
        #     self.showPanelControl.selectItem(idx)
        # else:
        mli = self.showPanelControl.getSelectedItem()

        try:
            pos = int(mli.getProperty('index'))
            if pos >= self.chunkMode.itemCount:
                raise ValueError
        except ValueError:
            if self.chunkMode.isAtBeginning():
                idx = 0
            else:
                idx = (self.chunkMode.itemCount % self.showPanelControl.LIST_MAX) - 1

            self.showPanelControl.selectItem(idx)
            self.updateKey(self.showPanelControl[idx])
            self.scrollBar.setPosition(idx)
            return

        if self.scrollBar:
            self.scrollBar.setPosition(pos)

        if self.chunkMode.posIsForward(pos):
            self.shiftChunks()
        elif self.chunkMode.posIsBackward(pos):
            self.shiftChunks(-1)

    def shiftChunks(self, mod=1):
        start = self.chunkMode.shift(mod)
        if start is None:
            return

        if start < 0:
            self.chunkCallback([None] * CHUNK_SIZE, -CHUNK_SIZE)
        else:
            self.chunkCallback([False] * CHUNK_SIZE, start)
            task = ChunkRequestTask().setup(
                self.section, start, CHUNK_SIZE, self.chunkCallback, filter_=self.getFilterOpts(), sort=self.getSortOpts(), unwatched=self.filterUnwatched
            )

            self.tasks.add(task)
            backgroundthread.BGThreader.addTasksToFront([task])

    def selectKey(self, mli=None):
        if not mli:
            mli = self.showPanelControl.getSelectedItem()
            if not mli:
                return

        li = self.keyItems.get(mli.getProperty('key'))
        if not li:
            return
        self.keyListControl.selectItem(li.pos())

    def searchButtonClicked(self):
        self.processCommand(search.dialog(self, section_id=self.section.key))

    def keyClicked(self):
        li = self.keyListControl.getSelectedItem()
        if not li:
            return

        if self.chunkMode:
            keyStart_start = self.chunkMode.shiftToKey(li.dataSource)
            if not keyStart_start:
                return
            keyStart, start = keyStart_start

            pos = keyStart % self.showPanelControl.LIST_MAX
            self.chunkCallback([None] * self.showPanelControl.LIST_MAX, 0)
            mul = 3
            if not start:
                mul = 2

            task = ChunkRequestTask().setup(
                self.section, start, CHUNK_SIZE * mul, self.chunkCallback, filter_=self.getFilterOpts(), sort=self.getSortOpts(), unwatched=self.filterUnwatched
            )

            self.tasks.add(task)
            backgroundthread.BGThreader.addTasksToFront([task])
        else:
            mli = self.firstOfKeyItems.get(li.dataSource)
            if not mli:
                return
            pos = mli.pos()

        self.showPanelControl.selectItem(pos)
        self.setFocusId(self.POSTERS_PANEL_ID)
        self.setProperty('key', li.dataSource)

    def playButtonClicked(self, shuffle=False):
        filter_ = self.getFilterOpts()
        sort = self.getSortOpts()
        args = {}
        if filter_:
            args[filter_[0]] = filter_[1]

        if sort:
            args['sort'] = '{0}:{1}'.format(*sort)

        if self.section.TYPE == 'movie':
            args['sourceType'] = '1'
        elif self.section.TYPE == 'show':
            args['sourceType'] = '2'
        else:
            args['sourceType'] = '8'

        pq = playqueue.createPlayQueueForItem(self.section, options={'shuffle': shuffle}, args=args)
        opener.open(pq)

    def shuffleButtonClicked(self):
        self.playButtonClicked(shuffle=True)

    def optionsButtonClicked(self):
        options = []
        if xbmc.getCondVisibility('Player.HasAudio + MusicPlayer.HasNext'):
            options.append({'key': 'play_next', 'display': T(32325, 'Play Next')})

        # if self.section.TYPE not in ('artist', 'photo', 'photodirectory'):
        #     options.append({'key': 'mark_watched', 'display': 'Mark All Watched'})
        #     options.append({'key': 'mark_unwatched', 'display': 'Mark All Unwatched'})

        # if xbmc.getCondVisibility('Player.HasAudio') and self.section.TYPE == 'artist':
        #     options.append({'key': 'add_to_queue', 'display': 'Add To Queue'})

        # if False:
        #     options.append({'key': 'add_to_playlist', 'display': 'Add To Playlist'})

        if self.section.TYPE == 'photodirectory':
            if options:
                options.append(dropdown.SEPARATOR)
            options.append({'key': 'to_section', 'display': T(32324, u'Go to {0}').format(self.section.getLibrarySectionTitle())})

        choice = dropdown.showDropdown(options, (255, 205))
        if not choice:
            return

        if choice['key'] == 'play_next':
            xbmc.executebuiltin('PlayerControl(Next)')
        elif choice['key'] == 'to_section':
            self.goHome(self.section.getLibrarySectionId())

    def itemTypeButtonClicked(self):
        options = []

        if self.section.TYPE == 'show':
            for t in ('show', 'episode'):
                options.append({'type': t, 'display': TYPE_PLURAL.get(t, t)})
        else:
            return

        result = dropdown.showDropdown(options, (1280, 106), with_indicator=True)
        if not result:
            return

        choice = result['type']

        if choice == 'show':
            choice = None

        if choice == ITEM_TYPE:
            return

        self.tasks.cancel()

        self.showPanelControl = None  # TODO: Need to do some check here I think

        self.setItemType(choice)

        self.reset()
        if not self.nextWindow(False):
            self.setProperty('media.type', TYPE_PLURAL.get(ITEM_TYPE or self.section.TYPE, self.section.TYPE))
            self.setProperty('sort.display', SORT_KEYS[self.section.TYPE].get(self.sort, SORT_KEYS['movie'].get(self.sort))['title'])
            self.fill()

    def sortButtonClicked(self):
        desc = 'script.plex/indicators/arrow-down.png'
        asc = 'script.plex/indicators/arrow-up.png'
        ind = self.sortDesc and desc or asc

        options = []

        if self.section.TYPE == 'movie':
            for stype in ('addedAt', 'originallyAvailableAt', 'lastViewedAt', 'titleSort', 'rating', 'resolution', 'duration'):
                option = SORT_KEYS['movie'].get(stype).copy()
                option['type'] = stype
                option['indicator'] = self.sort == stype and ind or ''
                options.append(option)
        elif self.section.TYPE == 'show':
            if ITEM_TYPE == 'episode':
                for stype in ('addedAt', 'originallyAvailableAt', 'lastViewedAt', 'show.titleSort', 'rating'):
                    option = SORT_KEYS['show'].get(stype, SORT_KEYS['movie'].get(stype)).copy()
                    option['type'] = stype
                    option['indicator'] = self.sort == stype and ind or ''
                    options.append(option)
            else:
                for stype in ('addedAt', 'lastViewedAt', 'originallyAvailableAt', 'titleSort', 'rating', 'unviewedLeafCount'):
                    option = SORT_KEYS['show'].get(stype, SORT_KEYS['movie'].get(stype)).copy()
                    option['type'] = stype
                    option['indicator'] = self.sort == stype and ind or ''
                    options.append(option)
        elif self.section.TYPE == 'artist':
            for stype in ('addedAt', 'lastViewedAt', 'viewCount', 'titleSort'):
                option = SORT_KEYS['artist'].get(stype, SORT_KEYS['movie'].get(stype)).copy()
                option['type'] = stype
                option['indicator'] = self.sort == stype and ind or ''
                options.append(option)
        elif self.section.TYPE == 'photo':
            for stype in ('addedAt', 'originallyAvailableAt', 'titleSort', 'rating'):
                option = SORT_KEYS['photo'].get(stype, SORT_KEYS['movie'].get(stype)).copy()
                option['type'] = stype
                option['indicator'] = self.sort == stype and ind or ''
                options.append(option)
        else:
            return

        result = dropdown.showDropdown(options, (1280, 106), with_indicator=True)
        if not result:
            return

        choice = result['type']

        if choice == self.sort:
            self.sortDesc = not self.sortDesc
        else:
            self.sortDesc = False

        self.sort = choice

        self.librarySettings.setSetting('sort', self.sort)
        self.librarySettings.setSetting('sort.desc', self.sortDesc)

        self.setProperty('sort', choice)
        self.setProperty('sort.display', result['title'])

        self.sortShowPanel(choice)

    def viewTypeButtonClicked(self):
        with self.lock:
            self.showPanelControl.invalidate()
            win = self.nextWindow()

        key = self.section.key
        if not key.isdigit():
            key = self.section.getLibrarySectionId()
        util.setSetting('viewtype.{0}.{1}'.format(self.section.server.uuid, key), win.VIEWTYPE)

    def sortShowPanel(self, choice):
        if self.chunkMode:
            self.fillShows()
            return

        if choice == 'addedAt':
            self.showPanelControl.sort(lambda i: i.dataSource.addedAt, reverse=self.sortDesc)
        elif choice == 'originallyAvailableAt':
            self.showPanelControl.sort(lambda i: i.dataSource.get('originallyAvailableAt'), reverse=self.sortDesc)
        elif choice == 'lastViewedAt':
            self.showPanelControl.sort(lambda i: i.dataSource.get('lastViewedAt'), reverse=self.sortDesc)
        elif choice == 'viewCount':
            self.showPanelControl.sort(lambda i: i.dataSource.get('titleSort') or i.dataSource.title)
            self.showPanelControl.sort(lambda i: i.dataSource.get('viewCount').asInt(), reverse=self.sortDesc)
        elif choice == 'titleSort':
            self.showPanelControl.sort(lambda i: i.dataSource.get('titleSort') or i.dataSource.title, reverse=self.sortDesc)
            self.keyListControl.sort(lambda i: i.getProperty('original'), reverse=self.sortDesc)
        elif choice == 'rating':
            self.showPanelControl.sort(lambda i: i.dataSource.get('titleSort') or i.dataSource.title)
            self.showPanelControl.sort(lambda i: i.dataSource.get('rating').asFloat(), reverse=self.sortDesc)
        elif choice == 'resolution':
            self.showPanelControl.sort(lambda i: i.dataSource.maxHeight, reverse=self.sortDesc)
        elif choice == 'duration':
            self.showPanelControl.sort(lambda i: i.dataSource.duration.asInt(), reverse=self.sortDesc)
        elif choice == 'unviewedLeafCount':
            self.showPanelControl.sort(lambda i: i.dataSource.unViewedLeafCount, reverse=self.sortDesc)

        for i, mli in enumerate(self.showPanelControl):
            mli.setProperty('index', str(i))

    def subOptionCallback(self, option):
        check = 'script.plex/home/device/check.png'
        options = None
        subKey = None
        if self.filter:
            if self.filter.get('sub'):
                subKey = self.filter['sub']['val']

        if option['type'] in (
            'year', 'decade', 'genre', 'contentRating', 'collection', 'director', 'actor', 'country', 'studio', 'resolution', 'labels',
            'make', 'model', 'aperture', 'exposure', 'iso', 'lens'
        ):
            options = [{'val': o.key, 'display': o.title, 'indicator': o.key == subKey and check or ''} for o in self.section.listChoices(option['type'])]
            if not options:
                options = [{'val': None, 'display': T(32375, 'No filters available'), 'ignore': True}]

        return options

    def hasFilter(self, ftype):
        if not self.filter:
            return False

        return self.filter['type'] == ftype

    def filter1ButtonClicked(self):
        check = 'script.plex/home/device/check.png'

        options = []

        if self.section.TYPE in ('movie', 'show'):
            options.append({'type': 'unwatched', 'display': T(32368, 'UNWATCHED').upper(), 'indicator': self.filterUnwatched and check or ''})

        if self.filter:
            options.append({'type': 'clear_filter', 'display': T(32376, 'CLEAR FILTER').upper(), 'indicator': 'script.plex/indicators/remove.png'})

        if options:
            options.append(None)  # Separator

        optionsMap = {
            'year': {'type': 'year', 'display': T(32377, 'Year'), 'indicator': self.hasFilter('year') and check or ''},
            'decade': {'type': 'decade', 'display': T(32378, 'Decade'), 'indicator': self.hasFilter('decade') and check or ''},
            'genre': {'type': 'genre', 'display': T(32379, 'Genre'), 'indicator': self.hasFilter('genre') and check or ''},
            'contentRating': {'type': 'contentRating', 'display': T(32380, 'Content Rating'), 'indicator': self.hasFilter('contentRating') and check or ''},
            'network': {'type': 'studio', 'display': T(32381, 'Network'), 'indicator': self.hasFilter('studio') and check or ''},
            'collection': {'type': 'collection', 'display': T(32382, 'Collection'), 'indicator': self.hasFilter('collection') and check or ''},
            'director': {'type': 'director', 'display': T(32383, 'Director'), 'indicator': self.hasFilter('director') and check or ''},
            'actor': {'type': 'actor', 'display': T(32384, 'Actor'), 'indicator': self.hasFilter('actor') and check or ''},
            'country': {'type': 'country', 'display': T(32385, 'Country'), 'indicator': self.hasFilter('country') and check or ''},
            'studio': {'type': 'studio', 'display': T(32386, 'Studio'), 'indicator': self.hasFilter('studio') and check or ''},
            'resolution': {'type': 'resolution', 'display': T(32362, 'Resolution'), 'indicator': self.hasFilter('resolution') and check or ''},
            'labels': {'type': 'labels', 'display': T(32387, 'Labels'), 'indicator': self.hasFilter('labels') and check or ''},

            'make': {'type': 'make', 'display': T(32388, 'Camera Make'), 'indicator': self.hasFilter('make') and check or ''},
            'model': {'type': 'model', 'display': T(32389, 'Camera Model'), 'indicator': self.hasFilter('model') and check or ''},
            'aperture': {'type': 'aperture', 'display': T(32390, 'Aperture'), 'indicator': self.hasFilter('aperture') and check or ''},
            'exposure': {'type': 'exposure', 'display': T(32391, 'Shutter Speed'), 'indicator': self.hasFilter('exposure') and check or ''},
            'iso': {'type': 'iso', 'display': 'ISO', 'indicator': self.hasFilter('iso') and check or ''},
            'lens': {'type': 'lens', 'display': T(32392, 'Lens'), 'indicator': self.hasFilter('lens') and check or ''}
        }

        if self.section.TYPE == 'movie':
            for k in ('year', 'decade', 'genre', 'contentRating', 'collection', 'director', 'actor', 'country', 'studio', 'resolution', 'labels'):
                options.append(optionsMap[k])
        elif self.section.TYPE == 'show':
            if ITEM_TYPE == 'episode':
                for k in ('year', 'collection', 'resolution'):
                    options.append(optionsMap[k])
            else:
                for k in ('year', 'genre', 'contentRating', 'network', 'collection', 'actor', 'labels'):
                    options.append(optionsMap[k])
        elif self.section.TYPE == 'artist':
            for k in ('genre', 'country', 'collection'):
                options.append(optionsMap[k])
        elif self.section.TYPE == 'photo':
            for k in ('year', 'make', 'model', 'aperture', 'exposure', 'iso', 'lens', 'labels'):
                options.append(optionsMap[k])

        result = dropdown.showDropdown(options, (980, 106), with_indicator=True, suboption_callback=self.subOptionCallback)
        if not result:
            return

        choice = result['type']

        if choice == 'clear_filter':
            self.filter = None
        elif choice == 'unwatched':
            self.filterUnwatched = not self.filterUnwatched
            self.librarySettings.setSetting('filter.unwatched', self.filterUnwatched)
        else:
            self.filter = result

        self.updateFilterDisplay()

        if self.filter or choice in ('clear_filter', 'unwatched'):
            self.fill()

    def updateFilterDisplay(self):
        if self.filter:
            disp = self.filter['display']
            if self.filter.get('sub'):
                disp = u'{0}: {1}'.format(disp, self.filter['sub']['display'])
            self.setProperty('filter1.display', disp)
            self.setProperty('filter2.display', self.filterUnwatched and 'unwatched' or '')
        else:
            self.setProperty('filter2.display', '')
            self.setProperty('filter1.display', self.filterUnwatched and 'unwatched' or 'all')

    def showPanelClicked(self):
        mli = self.showPanelControl.getSelectedItem()
        if not mli or not mli.dataSource:
            return

        updateWatched = False
        if self.section.TYPE == 'show':
            if ITEM_TYPE == 'episode':
                self.openItem(mli.dataSource)
            else:
                self.processCommand(opener.handleOpen(subitems.ShowWindow, media_item=mli.dataSource, parent_list=self.showPanelControl))
            updateWatched = True
        elif self.section.TYPE == 'movie':
            self.processCommand(opener.handleOpen(preplay.PrePlayWindow, video=mli.dataSource, parent_list=self.showPanelControl))
            updateWatched = True
        elif self.section.TYPE == 'artist':
            self.processCommand(opener.handleOpen(subitems.ArtistWindow, media_item=mli.dataSource, parent_list=self.showPanelControl))
        elif self.section.TYPE in ('photo', 'photodirectory'):
            self.showPhoto(mli.dataSource)

        if not mli.dataSource.exists():
            self.showPanelControl.removeItem(mli.pos())
            return

        if updateWatched:
            self.updateUnwatched(mli)

    def showPhoto(self, photo):
        if isinstance(photo, plexnet.photo.Photo) or photo.TYPE == 'clip':
            self.processCommand(opener.open(photo))
        else:
            self.processCommand(opener.sectionClicked(photo))

    def updateUnwatched(self, mli):
        mli.dataSource.reload()
        if mli.dataSource.isWatched:
            mli.setProperty('unwatched', '')
            mli.setProperty('unwatched.count', '')
        else:
            if self.section.TYPE == 'show':
                mli.setProperty('unwatched.count', str(mli.dataSource.unViewedLeafCount))
            else:
                mli.setProperty('unwatched', '1')

    def setTitle(self):
        if self.section.TYPE == 'artist':
            self.setProperty('screen.title', T(32394, 'MUSIC').upper())
        elif self.section.TYPE in ('photo', 'photodirectory'):
            self.setProperty('screen.title', T(32349, 'photos').upper())
        else:
            self.setProperty('screen.title', self.section.TYPE == 'show' and T(32393, 'TV SHOWS').upper() or T(32348, 'movies').upper())

        self.updateFilterDisplay()

    def updateItem(self, mli=None):
        mli = mli or self.showPanelControl.getSelectedItem()
        if not mli or mli.dataSource:
            return

        for task in self.tasks:
            if task.contains(mli.pos()):
                util.DEBUG_LOG('Moving task to front: {0}'.format(task))
                backgroundthread.BGThreader.moveToFront(task)
                break

    def setBackground(self, items):
        if self.backgroundSet:
            return
        self.backgroundSet = True

        item = random.choice(items)
        self.setProperty('background', item.art.asTranscodedImageURL(self.width, self.height, blur=128, opacity=60, background=colors.noAlpha.Background))

    def fill(self):
        if self.section.TYPE in ('photo', 'photodirectory'):
            self.fillPhotos()
        else:
            self.fillShows()

    def getFilterOpts(self):
        if not self.filter:
            return None

        if not self.filter.get('sub'):
            util.DEBUG_LOG('Filter missing sub-filter data')
            return None

        return (self.filter['type'], urllib.unquote_plus(self.filter['sub']['val']))

    def getSortOpts(self):
        if not self.sort:
            return None

        return (self.sort, self.sortDesc and 'desc' or 'asc')

    @busy.dialog()
    def fillShows(self):
        self.setBoolProperty('no.content', False)
        self.setBoolProperty('no.content.filtered', False)
        items = []
        jitems = []
        self.keyItems = {}
        self.firstOfKeyItems = {}
        totalSize = 0

        type_ = None
        if ITEM_TYPE == 'episode':
            type_ = 4

        idx = 0
        fallback = 'script.plex/thumb_fallbacks/{0}.png'.format(TYPE_KEYS.get(self.section.type, TYPE_KEYS['movie'])['fallback'])

        if self.filter:
            sectionAll = self.section.all(0, 0, filter_=self.getFilterOpts(), sort=self.getSortOpts(), unwatched=self.filterUnwatched, type_=type_)
            totalSize = sectionAll.totalSize.asInt()
            if not self.chunkMode:
                for x in range(totalSize):
                    mli = kodigui.ManagedListItem('')
                    mli.setProperty('thumb.fallback', fallback)
                    mli.setProperty('index', str(x))
                    items.append(mli)
        else:
            jumpList = self.section.jumpList(filter_=self.getFilterOpts(), sort=self.getSortOpts(), unwatched=self.filterUnwatched, type_=type_)

            if not jumpList:
                if self.filter or self.filterUnwatched:
                    self.setBoolProperty('no.content.filtered', True)
                else:
                    self.setBoolProperty('no.content', True)
                return

            for kidx, ji in enumerate(jumpList):
                mli = kodigui.ManagedListItem(ji.title, data_source=ji.key)
                mli.setProperty('key', ji.key)
                mli.setProperty('original', '{0:02d}'.format(kidx))
                self.keyItems[ji.key] = mli
                jitems.append(mli)
                totalSize += ji.size.asInt()

                if self.chunkMode:
                    self.chunkMode.addKeyRange(ji.key, (idx, (idx + ji.size.asInt()) - 1))
                    idx += ji.size.asInt()
                else:
                    for x in range(ji.size.asInt()):
                        mli = kodigui.ManagedListItem('')
                        mli.setProperty('key', ji.key)
                        mli.setProperty('thumb.fallback', fallback)
                        mli.setProperty('index', str(idx))
                        items.append(mli)
                        if not x:  # i.e. first item
                            self.firstOfKeyItems[ji.key] = mli
                        idx += 1

            self.setProperty('key', jumpList[0].key)

        if self.scrollBar:
            self.scrollBar.setSizeAndCount(totalSize, 12)

        if self.chunkMode:
            self.chunkMode.itemCount = totalSize
            items = [
                kodigui.ManagedListItem('', properties={'index': str(i)}) for i in range(CHUNK_SIZE * 2)
            ] + [
                kodigui.ManagedListItem('') for i in range(CHUNK_SIZE)
            ]

        self.showPanelControl.reset()
        self.keyListControl.reset()

        self.showPanelControl.addItems(items)
        self.keyListControl.addItems(jitems)

        tasks = []
        ct = 0
        for start in range(0, totalSize, CHUNK_SIZE):
            tasks.append(
                ChunkRequestTask().setup(
                    self.section, start, CHUNK_SIZE, self.chunkCallback, filter_=self.getFilterOpts(), sort=self.getSortOpts(), unwatched=self.filterUnwatched
                )
            )
            ct += 1

            if self.chunkMode and ct > 1:
                break

        self.tasks.add(tasks)
        backgroundthread.BGThreader.addTasksToFront(tasks)

    def showPhotoItemProperties(self, photo):
        if photo.isFullObject():
            return

        task = PhotoPropertiesTask().setup(photo, self._showPhotoItemProperties)
        self.tasks.add(task)
        backgroundthread.BGThreader.addTasksToFront([task])

    def _showPhotoItemProperties(self, photo):
        mli = self.showPanelControl.getSelectedItem()
        if not mli or not mli.dataSource.TYPE == 'photo':
            for mli in self.showPanelControl:
                if mli.dataSource == photo:
                    break
            else:
                return

        mli.setProperty('camera.model', photo.media[0].model)
        mli.setProperty('camera.lens', photo.media[0].lens)

        attrib = []
        if photo.media[0].height:
            attrib.append(u'{0} x {1}'.format(photo.media[0].width, photo.media[0].height))

        orientation = photo.media[0].parts[0].orientation
        if orientation:
            attrib.append(u'{0} Mo'.format(orientation))

        container = photo.media[0].container_ or os.path.splitext(photo.media[0].parts[0].file)[-1][1:].lower()
        if container == 'jpg':
            container = 'jpeg'
        attrib.append(container.upper())
        if attrib:
            mli.setProperty('photo.dims', u' \u2022 '.join(attrib))

        settings = []
        if photo.media[0].iso:
            settings.append('ISO {0}'.format(photo.media[0].iso))
        if photo.media[0].aperture:
            settings.append('{0}'.format(photo.media[0].aperture))
        if photo.media[0].exposure:
            settings.append('{0}'.format(photo.media[0].exposure))
        mli.setProperty('camera.settings', u' \u2022 '.join(settings))
        mli.setProperty('photo.summary', photo.get('summary'))

    @busy.dialog()
    def fillPhotos(self):
        self.setBoolProperty('no.content', False)
        self.setBoolProperty('no.content.filtered', False)
        items = []
        keys = []
        self.firstOfKeyItems = {}
        idx = 0

        if self.section.TYPE == 'photodirectory':
            photos = self.section.all()
        else:
            photos = self.section.all(filter_=self.getFilterOpts(), sort=self.getSortOpts(), unwatched=self.filterUnwatched)

        if not photos:
            return

        photo = random.choice(photos)
        self.setProperty('background', photo.art.asTranscodedImageURL(self.width, self.height, blur=128, opacity=60, background=colors.noAlpha.Background))
        thumbDim = TYPE_KEYS.get(self.section.type, TYPE_KEYS['movie'])['thumb_dim']
        fallback = 'script.plex/thumb_fallbacks/{0}.png'.format(TYPE_KEYS.get(self.section.type, TYPE_KEYS['movie'])['fallback'])

        if not photos:
            if self.filter or self.filterUnwatched:
                self.setBoolProperty('no.content.filtered', True)
            else:
                self.setBoolProperty('no.content', True)
            return

        for photo in photos:
            title = photo.title
            if photo.TYPE == 'photodirectory':
                thumb = photo.composite.asTranscodedImageURL(*thumbDim)
                mli = kodigui.ManagedListItem(title, thumbnailImage=thumb, data_source=photo)
                mli.setProperty('is.folder', '1')
            else:
                thumb = photo.defaultThumb.asTranscodedImageURL(*thumbDim)
                label2 = util.cleanLeadingZeros(photo.originallyAvailableAt.asDatetime('%d %B %Y'))
                mli = kodigui.ManagedListItem(title, label2, thumbnailImage=thumb, data_source=photo)

            mli.setProperty('thumb.fallback', fallback)
            mli.setProperty('index', str(idx))

            key = title[0].upper()
            if key not in KEYS:
                key = '#'
            if key not in keys:
                self.firstOfKeyItems[key] = mli
                keys.append(key)
            mli.setProperty('key', str(key))
            items.append(mli)
            idx += 1

        litems = []
        self.keyItems = {}
        for i, key in enumerate(keys):
            mli = kodigui.ManagedListItem(key, data_source=key)
            mli.setProperty('key', key)
            mli.setProperty('original', '{0:02d}'.format(i))
            self.keyItems[key] = mli
            litems.append(mli)

        self.showPanelControl.reset()
        self.keyListControl.reset()

        self.showPanelControl.addItems(items)
        self.keyListControl.addItems(litems)

        if keys:
            self.setProperty('key', keys[0])

    def chunkCallback(self, items, start):
        if self.chunkMode and not self.chunkMode.posIsValid(start):
            return

        with self.lock:
            pos = start
            self.setBackground(items)
            thumbDim = TYPE_KEYS.get(self.section.type, TYPE_KEYS['movie'])['thumb_dim']
            artDim = TYPE_KEYS.get(self.section.type, TYPE_KEYS['movie']).get('art_dim', (256, 256))

            showUnwatched = True if self.section.TYPE in ('movie', 'show') else False

            if self.chunkMode and len(items) < CHUNK_SIZE:
                items += [None] * (CHUNK_SIZE - len(items))

            if ITEM_TYPE == 'episode':
                for offset, obj in enumerate(items):
                    mli = self.showPanelControl[pos]
                    if obj:
                        mli.dataSource = obj
                        mli.setProperty('index', str(pos))
                        if obj.index:
                            subtitle = u' - {0}{1} \u2022 {2}{3}'.format(T(32310, 'S'), obj.parentIndex, T(32311, 'E'), obj.index)
                        else:
                            subtitle = ' - ' + obj.originallyAvailableAt.asDatetime('%m/%d/%y')
                        mli.setLabel((obj.defaultTitle or '') + subtitle)

                        mli.setThumbnailImage(obj.defaultThumb.asTranscodedImageURL(*thumbDim))

                        mli.setProperty('summary', obj.summary)

                        mli.setProperty('key', self.chunkMode.getKey(pos))

                        mli.setLabel2(util.durationToText(obj.fixedDuration()))
                        mli.setProperty('art', obj.defaultArt.asTranscodedImageURL(*artDim))
                        if not obj.isWatched:
                            mli.setProperty('unwatched', '1')
                    else:
                        mli.clear()
                        if obj is False:
                            mli.setProperty('index', str(pos))
                        else:
                            mli.setProperty('index', '')

                    pos += 1
            else:
                for offset, obj in enumerate(items):
                    mli = self.showPanelControl[pos]
                    if obj:
                        mli.setProperty('index', str(pos))
                        mli.setLabel(obj.defaultTitle or '')
                        mli.setThumbnailImage(obj.defaultThumb.asTranscodedImageURL(*thumbDim))
                        mli.dataSource = obj
                        mli.setProperty('summary', obj.get('summary'))

                        if self.chunkMode:
                            mli.setProperty('key', self.chunkMode.getKey(pos))

                        if showUnwatched:
                            mli.setLabel2(util.durationToText(obj.fixedDuration()))
                            mli.setProperty('art', obj.defaultArt.asTranscodedImageURL(*artDim))
                            if not obj.isWatched:
                                if self.section.TYPE == 'show':
                                    mli.setProperty('unwatched.count', str(obj.unViewedLeafCount))
                                else:
                                    mli.setProperty('unwatched', '1')
                    else:
                        mli.clear()
                        if obj is False:
                            mli.setProperty('index', str(pos))
                        else:
                            mli.setProperty('index', '')

                    pos += 1


class PostersWindow(kodigui.ControlledWindow):
    xmlFile = 'script-plex-posters.xml'
    path = util.ADDON.getAddonInfo('path')
    theme = 'Main'
    res = '1080i'
    width = 1920
    height = 1080

    POSTERS_PANEL_ID = 101
    KEY_LIST_ID = 151
    SCROLLBAR_ID = 152

    OPTIONS_GROUP_ID = 200

    HOME_BUTTON_ID = 201
    SEARCH_BUTTON_ID = 202
    PLAYER_STATUS_BUTTON_ID = 204

    SORT_BUTTON_ID = 210
    FILTER1_BUTTON_ID = 211
    FILTER2_BUTTON_ID = 212
    ITEM_TYPE_BUTTON_ID = 312

    PLAY_BUTTON_ID = 301
    SHUFFLE_BUTTON_ID = 302
    OPTIONS_BUTTON_ID = 303
    VIEWTYPE_BUTTON_ID = 304

    VIEWTYPE = 'panel'
    MULTI_WINDOW_ID = 0

    CUSTOM_SCOLLBAR_BUTTON_ID = 951


class PostersChunkedWindow(PostersWindow):
    xmlFile = 'script-plex-listview-16x9-chunked.xml'
    VIEWTYPE = 'list'
    MULTI_WINDOW_ID = 0


class ListView16x9Window(PostersWindow):
    xmlFile = 'script-plex-listview-16x9.xml'
    VIEWTYPE = 'list'
    MULTI_WINDOW_ID = 1


class ListView16x9ChunkedWindow(PostersWindow):
    xmlFile = 'script-plex-listview-16x9-chunked.xml'
    VIEWTYPE = 'list'
    MULTI_WINDOW_ID = 1


class SquaresWindow(PostersWindow):
    xmlFile = 'script-plex-squares.xml'
    VIEWTYPE = 'panel'
    MULTI_WINDOW_ID = 0


class SquaresChunkedWindow(PostersWindow):
    xmlFile = 'script-plex-listview-16x9-chunked.xml'
    VIEWTYPE = 'list'
    MULTI_WINDOW_ID = 0


class ListViewSquareWindow(PostersWindow):
    xmlFile = 'script-plex-listview-square.xml'
    VIEWTYPE = 'list'
    MULTI_WINDOW_ID = 1


class ListViewSquareChunkedWindow(PostersWindow):
    xmlFile = 'script-plex-listview-16x9-chunked.xml'
    VIEWTYPE = 'list'
    MULTI_WINDOW_ID = 1


VIEWS_POSTER = {
    'panel': PostersWindow,
    'list': ListView16x9Window,
    'all': (PostersWindow, ListView16x9Window)
}

VIEWS_POSTER_CHUNKED = {
    'panel': PostersWindow,
    'list': ListView16x9ChunkedWindow,
    'all': (PostersChunkedWindow, ListView16x9ChunkedWindow)
}

VIEWS_SQUARE = {
    'panel': SquaresWindow,
    'list': ListViewSquareWindow,
    'all': (SquaresWindow, ListViewSquareWindow)
}

VIEWS_SQUARE_CHUNKED = {
    'panel': SquaresWindow,
    'list': ListViewSquareWindow,
    'all': (SquaresChunkedWindow, ListViewSquareChunkedWindow)
}

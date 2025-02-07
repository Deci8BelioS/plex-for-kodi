from __future__ import absolute_import

from kodi_six import xbmc
from kodi_six import xbmcgui
from plexnet import plexapp

from lib import util
from . import busy
from . import kodigui
from . import playlist
from . import search
from . import windowutils


class PlaylistsWindow(kodigui.ControlledWindow, windowutils.UtilMixin):
    xmlFile = 'script-plex-playlists.xml'
    path = util.ADDON.getAddonInfo('path')
    theme = 'Main'
    res = '1080i'
    width = 1920
    height = 1080

    THUMB_DIMS = {
        'audio': {
            'item.thumb': util.scaleResolution(270, 270)
        },
        'video': {
            'item.thumb': util.scaleResolution(610, 344)
        }
    }

    AUDIO_PL_LIST_ID = 101
    VIDEO_PL_LIST_ID = 301

    OPTIONS_GROUP_ID = 200

    HOME_BUTTON_ID = 201
    SEARCH_BUTTON_ID = 202
    PLAYER_STATUS_BUTTON_ID = 204

    def __init__(self, *args, **kwargs):
        kodigui.ControlledWindow.__init__(self, *args, **kwargs)
        self.exitCommand = None

    def onFirstInit(self):
        self.audioPLListControl = kodigui.ManagedControlList(self, self.AUDIO_PL_LIST_ID, 5)
        self.videoPLListControl = kodigui.ManagedControlList(self, self.VIDEO_PL_LIST_ID, 5)

        self.fill()
        if self.audioPLListControl.size():
            self.setFocusId(self.AUDIO_PL_LIST_ID)
        else:
            self.setFocusId(self.VIDEO_PL_LIST_ID)

    def onAction(self, action):
        if kodigui.XMLBase.goHomeAction(self, action):
            return
        try:
            if action == xbmcgui.ACTION_CONTEXT_MENU:
                if not xbmc.getCondVisibility('ControlGroup({0}).HasFocus(0)'.format(self.OPTIONS_GROUP_ID)):
                    self.setFocusId(self.OPTIONS_GROUP_ID)
                    return
            # elif action in(xbmcgui.ACTION_NAV_BACK, xbmcgui.ACTION_CONTEXT_MENU):
            #     if not xbmc.getCondVisibility('ControlGroup({0}).HasFocus(0)'.format(self.OPTIONS_GROUP_ID)):
            #         self.setFocusId(self.OPTIONS_GROUP_ID)
            #         return

        except:
            util.ERROR()

        kodigui.ControlledWindow.onAction(self, action)

    def onClick(self, controlID):
        if controlID == self.HOME_BUTTON_ID:
            self.goHome()
        elif controlID == self.AUDIO_PL_LIST_ID:
            self.playlistListClicked(self.audioPLListControl)
        elif controlID == self.VIDEO_PL_LIST_ID:
            self.playlistListClicked(self.videoPLListControl)
        elif controlID == self.PLAYER_STATUS_BUTTON_ID:
            self.showAudioPlayer()
        elif controlID == self.SEARCH_BUTTON_ID:
            self.searchButtonClicked()

    def searchButtonClicked(self):
        self.processCommand(search.dialog(self))

    def playlistListClicked(self, list_control):
        mli = list_control.getSelectedItem()
        if not mli:
            return

        self.openWindow(playlist.PlaylistWindow, playlist=mli.dataSource)

    def createListItem(self, obj):
        dimensions = self.THUMB_DIMS.get(obj.playlistType)

        if not dimensions:
            return

        w, h = dimensions['item.thumb']

        if obj.playlistType == 'audio':
            thumb = obj.buildComposite(width=w, height=h, media='thumb')
        else:
            thumb = obj.buildComposite(width=w, height=h, media='art')

        mli = kodigui.ManagedListItem(
            obj.title or '',
            util.durationToText(obj.duration.asInt()),
            # thumbnailImage=obj.composite.asTranscodedImageURL(*self.THUMB_DIMS[obj.playlistType]['item.thumb']),
            thumbnailImage=thumb,
            data_source=obj
        )
        mli.setProperty('thumb.fallback', 'script.plex/thumb_fallbacks/{0}.png'.format(obj.playlistType == 'audio' and 'music' or 'movie'))

        return mli

    @busy.dialog()
    def fill(self):
        items = {
            'audio': [],
            'video': []
        }
        playlists = plexapp.SERVERMANAGER.selectedServer.playlists()

        self.setProperty(
            'background',
            util.backgroundFromArt(playlists[0].composite, width=self.width, height=self.height)
        )

        for pl in playlists:
            mli = self.createListItem(pl)
            if mli:
                items[pl.playlistType].append(mli)

        self.audioPLListControl.addItems(items['audio'])
        self.videoPLListControl.addItems(items['video'])

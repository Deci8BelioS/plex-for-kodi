{% extends "base.xml.tpl" %}
{% block headers %}
    <defaultcontrol>250</defaultcontrol>
    <zorder>100</zorder>
{% endblock %}

{% block controls %}
<control type="group">
    <visible>String.IsEmpty(Window.Property(use_solid_background))</visible>
    <control type="image">
        <visible>String.IsEmpty(Window.Property(use_solid_background)) + String.IsEmpty(Window.Property(use_bg_fallback)) + String.IsEmpty(Window.Property(background_static))</visible>
        <posx>0</posx>
        <posy>0</posy>
        <width>1920</width>
        <height>1080</height>
        <texture>script.plex/home/background-fallback_black.png</texture>
    </control>
    <control type="image">
        <visible>!String.IsEmpty(Window.Property(use_bg_fallback))</visible>
        <posx>0</posx>
        <posy>0</posy>
        <width>1920</width>
        <height>1080</height>
        <texture>script.plex/home/background-fallback.png</texture>
    </control>
    <control type="image">
        <visible>String.IsEmpty(Window.Property(use_bg_fallback))</visible>
        <posx>0</posx>
        <posy>0</posy>
        <width>1920</width>
        <height>1080</height>
        <texture background="true">$INFO[Window.Property(background_static)]</texture>
    </control>
    <control type="image">
        <visible>String.IsEmpty(Window.Property(use_bg_fallback))</visible>
        <posx>0</posx>
        <posy>0</posy>
        <width>1920</width>
        <height>1080</height>
        <fadetime>1000</fadetime>
        <texture background="true">$INFO[Window.Property(background)]</texture>
    </control>
    <control type="image" id="600">
        <!-- Doesn't work for all aspects -->
        <!-- <animation effect="zoom" start="56" end="100" time="200" center="960,540" reversible="false" condition="String.IsEqual(Window.Property(rotate),90) | String.IsEqual(Window.Property(rotate),270)">Conditional</animation>
        <animation effect="zoom" start="178" end="100" time="200" center="960,540" reversible="false" condition="String.IsEqual(Window.Property(rotate),0) | String.IsEqual(Window.Property(rotate),180)">Conditional</animation> -->
        <animation effect="rotate" time="200" start="0" end="90" center="960,540" reversible="false" condition="Integer.IsGreater(Window.Property(rotate),89)">Conditional</animation>
        <animation effect="rotate" time="200" start="0" end="90" center="960,540" reversible="false" condition="Integer.IsGreater(Window.Property(rotate),179)">Conditional</animation>
        <animation effect="rotate" time="200" start="0" end="90" center="960,540" reversible="false" condition="Integer.IsGreater(Window.Property(rotate),269)">Conditional</animation>
        <animation effect="rotate" time="200" start="270" end="360" center="960,540" reversible="false" condition="!Integer.IsGreater(Window.Property(rotate),89)">Conditional</animation>
        <posx>0</posx>
        <posy>0</posy>
        <width>1920</width>
        <height>1080</height>
        <fadetime>1000</fadetime>
        <texture background="true">$INFO[Window.Property(photo)]</texture>
        <aspectratio>keep</aspectratio>
    </control>
    <control type="group">
        <visible>!String.IsEmpty(Window.Property(is.updating))</visible>
        <animation effect="fade" time="500" delay="500">VisibleChange</animation>
        <control type="image">
            <posx>840</posx>
            <posy>465</posy>
            <width>240</width>
            <height>150</height>
            <texture>script.plex/busy-back.png</texture>
            <colordiffuse>A0FFFFFF</colordiffuse>
        </control>
        <control type="image">
            <posx>915</posx>
            <posy>521</posy>
            <width>90</width>
            <height>38</height>
            <texture diffuse="script.plex/busy-diffuse.png">script.plex/busy.gif</texture>
        </control>
    </control>
</control>
<control type="togglebutton" id="250">
    <posx>0</posx>
    <posy>0</posy>
    <width>1920</width>
    <height>1080</height>
    <texturefocus>-</texturefocus>
    <texturenofocus>-</texturenofocus>
    <usealttexture>!String.IsEmpty(Window.Property(OSD))</usealttexture>
    <alttexturefocus>-</alttexturefocus>
    <alttexturenofocus>-</alttexturenofocus>
    <label> </label>
    <onclick>SetProperty(OSD,1)</onclick>
    <onclick>SetFocus(406)</onclick>
    <altclick>SetProperty(OSD,)</altclick>
    <ondown>SetProperty(OSD,1)</ondown>
    <ondown>SetFocus(400)</ondown>
    <ondown>SetFocus(406)</ondown>
    <onfocus condition="!String.IsEmpty(Window.Property(show.pqueue))">SetFocus(501)</onfocus>
    <onfocus condition="!String.IsEmpty(Window.Property(OSD))">SetFocus(400)</onfocus>
</control>
<control type="group" id="200">
    <animation effect="slide" start="0,0" end="0,-135" time="100" condition="!String.IsEmpty(Window.Property(show.pqueue))">Conditional</animation>
    <posx>0</posx>
    <posy>0</posy>
    <control type="group">
        <visible allowhiddenfocus="true">!String.IsEmpty(Window.Property(OSD))</visible>
        <control type="image">
            <posx>0</posx>
            <posy>940</posy>
            <width>1920</width>
            <height>140</height>
            <texture>script.plex/white-square.png</texture>
            <colordiffuse>A0000000</colordiffuse>
        </control>
        <control type="grouplist" id="400">
            <defaultcontrol>406</defaultcontrol>
            <hitrect x="460" y="998" w="1000" h="55" />
            <posx>360</posx>
            <posy>964</posy>
            <width>1200</width>

            <height>124</height>
            <align>center</align>
            <onup>250</onup>
            <onup>SetProperty(OSD,)</onup>
            <ondown>250</ondown>
            <onup>SetProperty(OSD,)</onup>
            <itemgap>-40</itemgap>
            <orientation>horizontal</orientation>
            <scrolltime tween="quadratic" easing="out">200</scrolltime>
            <usecontrolcoords>true</usecontrolcoords>

            <control type="togglebutton" id="401">
                <visible>String.IsEmpty(Window.Property(no.playlist))</visible>
                <hitrect x="28" y="28" w="69" h="45" />
                <posx>0</posx>
                <posy>0</posy>
                <width>125</width>
                <height>101</height>
                <font>font12</font>
                <texturefocus{% if theme.buttons.useFocusColor %} colordiffuse="{{ theme.buttons.focusColor|default("FFE5A00D") }}"{% endif %}>{{ theme.assets.buttons.base }}repeat{{ theme.assets.buttons.focusSuffix }}.png</texturefocus>
                <texturenofocus{% if theme.buttons.useNoFocusColor %} colordiffuse="{{ theme.buttons.noFocusColor|default('99FFFFFF') }}"{% endif %}>{{ theme.assets.buttons.base }}repeat.png</texturenofocus>
                <usealttexture>!String.IsEmpty(Window.Property(pq.repeat))</usealttexture>
                <alttexturefocus{% if theme.buttons.useFocusColor %} colordiffuse="{{ theme.buttons.focusColor|default("FFE5A00D") }}"{% endif %}>{{ theme.assets.buttons.base }}repeat{{ theme.assets.buttons.focusSuffix }}.png</alttexturefocus>
                <alttexturenofocus colordiffuse="FFCC7B19">{{ theme.assets.buttons.base }}repeat.png</alttexturenofocus>
                <label> </label>
            </control>
            <control type="button" id="421">
                <enable>false</enable>
                <visible>!String.IsEmpty(Window.Property(no.playlist))</visible>
                <posx>0</posx>
                <posy>0</posy>
                <width>125</width>
                <height>101</height>
                <font>font12</font>
                <texturefocus colordiffuse="40FFFFFF">{{ theme.assets.buttons.base }}shuffle{{ theme.assets.buttons.focusSuffix }}.png</texturefocus>
                <texturenofocus colordiffuse="40FFFFFF">{{ theme.assets.buttons.base }}shuffle.png</texturenofocus>
                <label> </label>
            </control>

            <control type="togglebutton" id="402">
                <visible>String.IsEmpty(Window.Property(no.playlist))</visible>
                <hitrect x="28" y="28" w="69" h="45" />
                <posx>0</posx>
                <posy>0</posy>
                <width>125</width>
                <height>101</height>
                <font>font12</font>
                <texturefocus{% if theme.buttons.useFocusColor %} colordiffuse="{{ theme.buttons.focusColor|default("FFE5A00D") }}"{% endif %}>{{ theme.assets.buttons.base }}shuffle{{ theme.assets.buttons.focusSuffix }}.png</texturefocus>
                <texturenofocus{% if theme.buttons.useNoFocusColor %} colordiffuse="{{ theme.buttons.noFocusColor|default('99FFFFFF') }}"{% endif %}>{{ theme.assets.buttons.base }}shuffle.png</texturenofocus>
                <usealttexture>!String.IsEmpty(Window.Property(pq.shuffled))</usealttexture>
                <alttexturefocus{% if theme.buttons.useFocusColor %} colordiffuse="{{ theme.buttons.focusColor|default("FFE5A00D") }}"{% endif %}>{{ theme.assets.buttons.base }}shuffle{{ theme.assets.buttons.focusSuffix }}.png</alttexturefocus>
                <alttexturenofocus colordiffuse="FFCC7B19">{{ theme.assets.buttons.base }}shuffle.png</alttexturenofocus>
                <label> </label>
            </control>
            <control type="button" id="422">
                <enable>false</enable>
                <visible>!String.IsEmpty(Window.Property(no.playlist))</visible>
                <posx>0</posx>
                <posy>0</posy>
                <width>125</width>
                <height>101</height>
                <font>font12</font>
                <texturefocus colordiffuse="40FFFFFF">{{ theme.assets.buttons.base }}shuffle{{ theme.assets.buttons.focusSuffix }}.png</texturefocus>
                <texturenofocus colordiffuse="40FFFFFF">{{ theme.assets.buttons.base }}shuffle.png</texturenofocus>
                <label> </label>
            </control>

            <control type="button" id="403">
                <hitrect x="28" y="28" w="69" h="45" />
                <posx>0</posx>
                <posy>0</posy>
                <width>125</width>
                <height>101</height>
                <font>font12</font>
                <texturefocus{% if theme.buttons.useFocusColor %} colordiffuse="{{ theme.buttons.focusColor|default("FFE5A00D") }}"{% endif %}>{{ theme.assets.buttons.base }}rotate{{ theme.assets.buttons.focusSuffix }}.png</texturefocus>
                <texturenofocus{% if theme.buttons.useNoFocusColor %} colordiffuse="{{ theme.buttons.noFocusColor|default('99FFFFFF') }}"{% endif %}>{{ theme.assets.buttons.base }}rotate.png</texturenofocus>
                <label> </label>
            </control>


            <control type="button" id="404">
                <visible>String.IsEmpty(Window.Property(hide.prev))</visible>
                <hitrect x="58" y="28" w="69" h="45" />
                <posx>30</posx>
                <posy>0</posy>
                <width>125</width>
                <height>101</height>
                <font>font12</font>
                <texturefocus flipx="true"{% if theme.buttons.useFocusColor %} colordiffuse="{{ theme.buttons.focusColor|default("FFE5A00D") }}"{% endif %}>{{ theme.assets.buttons.base }}next{{ theme.assets.buttons.focusSuffix }}.png</texturefocus>
                <texturenofocus flipx="true"{% if theme.buttons.useNoFocusColor %} colordiffuse="{{ theme.buttons.noFocusColor|default('99FFFFFF') }}"{% endif %}>{{ theme.assets.buttons.base }}next.png</texturenofocus>
                <label> </label>
            </control>
            <control type="button" id="424">
                <enable>false</enable>
                <visible>!String.IsEmpty(Window.Property(hide.prev))</visible>
                <posx>30</posx>
                <posy>0</posy>
                <width>125</width>
                <height>101</height>
                <font>font12</font>
                <texturefocus flipx="true" colordiffuse="40FFFFFF">{{ theme.assets.buttons.base }}next{{ theme.assets.buttons.focusSuffix }}.png</texturefocus>
                <texturenofocus flipx="true" colordiffuse="40FFFFFF">{{ theme.assets.buttons.base }}next.png</texturenofocus>
                <label> </label>
            </control>
            <control type="togglebutton" id="406">
                {% if theme.buttons.zoomPlayButton %}
                    <animation effect="zoom" start="100" end="124" time="100" center="63,50" reversible="false" condition="Control.HasFocus(406)">Conditional</animation>
                    <animation effect="zoom" start="124" end="100" time="100" center="63,50" reversible="false" condition="!Control.HasFocus(406)">Conditional</animation>
                {% endif %}
                <hitrect x="28" y="28" w="69" h="45" />
                <posx>0</posx>
                <posy>0</posy>
                <width>125</width>
                <height>101</height>
                <font>font12</font>
                <texturefocus{% if theme.buttons.useFocusColor %} colordiffuse="{{ theme.buttons.focusColor|default("FFE5A00D") }}"{% endif %}>{{ theme.assets.buttons.base }}play{{ theme.assets.buttons.focusSuffix }}.png</texturefocus>
                <texturenofocus{% if theme.buttons.useNoFocusColor %} colordiffuse="{{ theme.buttons.noFocusColor|default('99FFFFFF') }}"{% endif %}>{{ theme.assets.buttons.base }}play.png</texturenofocus>
                <usealttexture>!String.IsEmpty(Window.Property(playing))</usealttexture>
                <alttexturefocus{% if theme.buttons.useFocusColor %} colordiffuse="{{ theme.buttons.focusColor|default("FFE5A00D") }}"{% endif %}>{{ theme.assets.buttons.base }}pause{{ theme.assets.buttons.focusSuffix }}.png</alttexturefocus>
                <alttexturenofocus{% if theme.buttons.useNoFocusColor %} colordiffuse="{{ theme.buttons.noFocusColor|default('99FFFFFF') }}"{% endif %}>{{ theme.assets.buttons.base }}pause.png</alttexturenofocus>
                <label> </label>
            </control>
            <control type="button" id="407">
                <hitrect x="28" y="28" w="69" h="45" />
                <posx>0</posx>
                <posy>0</posy>
                <width>125</width>
                <height>101</height>
                <font>font12</font>
                <texturefocus{% if theme.buttons.useFocusColor %} colordiffuse="{{ theme.buttons.focusColor|default("FFE5A00D") }}"{% endif %}>{{ theme.assets.buttons.base }}stop{{ theme.assets.buttons.focusSuffix }}.png</texturefocus>
                <texturenofocus{% if theme.buttons.useNoFocusColor %} colordiffuse="{{ theme.buttons.noFocusColor|default('99FFFFFF') }}"{% endif %}>{{ theme.assets.buttons.base }}stop.png</texturenofocus>
                <label> </label>
            </control>
            <control type="button" id="409">
                <visible>String.IsEmpty(Window.Property(hide.next))</visible>
                <hitrect x="28" y="28" w="69" h="45" />
                <posx>0</posx>
                <posy>0</posy>
                <width>125</width>
                <height>101</height>
                <font>font12</font>
                <texturefocus{% if theme.buttons.useFocusColor %} colordiffuse="{{ theme.buttons.focusColor|default("FFE5A00D") }}"{% endif %}>{{ theme.assets.buttons.base }}next{{ theme.assets.buttons.focusSuffix }}.png</texturefocus>
                <texturenofocus{% if theme.buttons.useNoFocusColor %} colordiffuse="{{ theme.buttons.noFocusColor|default('99FFFFFF') }}"{% endif %}>{{ theme.assets.buttons.base }}next.png</texturenofocus>
                <label> </label>
            </control>
            <control type="button" id="419">
                <enable>false</enable>
                <visible>!String.IsEmpty(Window.Property(hide.next))</visible>
                <posx>0</posx>
                <posy>0</posy>
                <width>125</width>
                <height>101</height>
                <texturefocus colordiffuse="40FFFFFF">{{ theme.assets.buttons.base }}next{{ theme.assets.buttons.focusSuffix }}.png</texturefocus>
                <texturenofocus colordiffuse="40FFFFFF">{{ theme.assets.buttons.base }}next.png</texturenofocus>
                <label> </label>
            </control>


            <control type="togglebutton" id="412">
                <hitrect x="58" y="28" w="69" h="45" />
                <posx>30</posx>
                <posy>0</posy>
                <width>125</width>
                <height>101</height>
                <font>font12</font>
                <texturefocus{% if theme.buttons.useFocusColor %} colordiffuse="{{ theme.buttons.focusColor|default("FFE5A00D") }}"{% endif %}>{{ theme.assets.buttons.base }}square2x2{{ theme.assets.buttons.focusSuffix }}.png</texturefocus>
                <texturenofocus{% if theme.buttons.useNoFocusColor %} colordiffuse="{{ theme.buttons.noFocusColor|default('99FFFFFF') }}"{% endif %}>{{ theme.assets.buttons.base }}square2x2.png</texturenofocus>
                <usealttexture>!String.IsEmpty(Window.Property(show.pqueue))</usealttexture>
                <alttexturefocus{% if theme.buttons.useFocusColor %} colordiffuse="{{ theme.buttons.focusColor|default("FFE5A00D") }}"{% endif %}>{{ theme.assets.buttons.base }}square2x2{{ theme.assets.buttons.focusSuffix }}.png</alttexturefocus>
                <alttexturenofocus colordiffuse="FFCC7B19">{{ theme.assets.buttons.base }}square2x2{{ theme.assets.buttons.focusSuffix }}.png</alttexturenofocus>
                <onclick>SetProperty(show.pqueue,1)</onclick>
                <altclick>SetProperty(show.pqueue,)</altclick>
                <label> </label>
            </control>
            <control type="togglebutton" id="413">
                <hitrect x="28" y="28" w="69" h="45" />
                <posx>0</posx>
                <posy>0</posy>
                <width>125</width>
                <height>101</height>
                <font>font12</font>
                <texturefocus{% if theme.buttons.useFocusColor %} colordiffuse="{{ theme.buttons.focusColor|default("FFE5A00D") }}"{% endif %}>{{ theme.assets.buttons.base }}info{{ theme.assets.buttons.focusSuffix }}.png</texturefocus>
                <texturenofocus{% if theme.buttons.useNoFocusColor %} colordiffuse="{{ theme.buttons.noFocusColor|default('99FFFFFF') }}"{% endif %}>{{ theme.assets.buttons.base }}info.png</texturenofocus>
                <usealttexture>!String.IsEmpty(Window.Property(show.info))</usealttexture>
                <alttexturefocus{% if theme.buttons.useFocusColor %} colordiffuse="{{ theme.buttons.focusColor|default("FFE5A00D") }}"{% endif %}>{{ theme.assets.buttons.base }}info{{ theme.assets.buttons.focusSuffix }}.png</alttexturefocus>
                <alttexturenofocus colordiffuse="FFCC7B19">{{ theme.assets.buttons.base }}info{{ theme.assets.buttons.focusSuffix }}.png</alttexturenofocus>
                <onclick>SetProperty(show.info,1)</onclick>
                <altclick>SetProperty(show.info,)</altclick>
                <label> </label>
            </control>
            <control type="button" id="414">
                <visible>false</visible>
                <hitrect x="28" y="28" w="69" h="45" />
                <posx>0</posx>
                <posy>0</posy>
                <width>125</width>
                <height>101</height>
                <font>font12</font>
                <texturefocus{% if theme.buttons.useFocusColor %} colordiffuse="{{ theme.buttons.focusColor|default("FFE5A00D") }}"{% endif %}>{{ theme.assets.buttons.base }}tags{{ theme.assets.buttons.focusSuffix }}.png</texturefocus>
                <texturenofocus{% if theme.buttons.useNoFocusColor %} colordiffuse="{{ theme.buttons.noFocusColor|default('99FFFFFF') }}"{% endif %}>{{ theme.assets.buttons.base }}tags.png</texturenofocus>
                <label> </label>
            </control>
            <control type="button" id="411">
                <visible>false</visible>
                <hitrect x="28" y="28" w="69" h="45" />
                <posx>0</posx>
                <posy>0</posy>
                <width>125</width>
                <height>101</height>
                <font>font12</font>
                <texturefocus{% if theme.buttons.useFocusColor %} colordiffuse="{{ theme.buttons.focusColor|default("FFE5A00D") }}"{% endif %}>{{ theme.assets.buttons.base }}more{{ theme.assets.buttons.focusSuffix }}.png</texturefocus>
                <texturenofocus{% if theme.buttons.useNoFocusColor %} colordiffuse="{{ theme.buttons.noFocusColor|default('99FFFFFF') }}"{% endif %}>{{ theme.assets.buttons.base }}more.png</texturenofocus>
                <label> </label>
            </control>
        </control>
    </control>

    <control type="button" id="501">
        <posx>0</posx>
        <posy>1080</posy>
        <width>1920</width>
        <height>135</height>
        <onup>SetProperty(OSD,1)</onup>
        <onup>400</onup>
        <font>font12</font>
        <texturefocus>-</texturefocus>
        <texturenofocus>-</texturenofocus>
        <label> </label>
        <onclick>SetProperty(OSD,1)</onclick>
        <onclick>SetFocus(400)</onclick>
    </control>

    <control type="image">
        <posx>0</posx>
        <posy>1080</posy>
        <width>1920</width>
        <height>135</height>
        <texture>script.plex/white-square.png</texture>
        <colordiffuse>FF000000</colordiffuse>
    </control>
    <control type="fixedlist" id="500">
        <posx>0</posx>
        <posy>1080</posy>
        <width>1920</width>
        <height>135</height>
        <hitrect x="28" y="28" w="69" h="45" />

        <scrolltime>0</scrolltime>
        <orientation>horizontal</orientation>
        <preloaditems>4</preloaditems>
        <focusposition>7</focusposition>
        <!-- ITEM LAYOUT ########################################## -->
        <itemlayout width="128">
            <control type="group">
                <posx>0</posx>
                <posy>0</posy>
                <control type="group">
                    <posx>2.5</posx>
                    <posy>6</posy>
                    <control type="image">
                        <posx>0</posx>
                        <posy>0</posy>
                        <width>123</width>
                        <height>123</height>
                        <texture>script.plex/thumb_fallbacks/photo.png</texture>
                    </control>
                    <control type="image">
                        <posx>0</posx>
                        <posy>0</posy>
                        <width>123</width>
                        <height>123</height>
                        <texture fallback="script.plex/thumb_fallbacks/broken-photo-thumb.png" background="true">$INFO[ListItem.Thumb]</texture>
                        <aspectratio>scale</aspectratio>
                    </control>
                </control>
            </control>
        </itemlayout>

        <!-- FOCUSED LAYOUT ####################################### -->
        <focusedlayout width="128">
            <control type="group">
                <posx>0</posx>
                <posy>0</posy>
                <control type="group">
                    <posx>2.5</posx>
                    <posy>6</posy>
                    <control type="image">
                        <posx>0</posx>
                        <posy>0</posy>
                        <width>123</width>
                        <height>123</height>
                        <texture>script.plex/thumb_fallbacks/photo.png</texture>
                    </control>
                    <control type="image">
                        <posx>0</posx>
                        <posy>0</posy>
                        <width>123</width>
                        <height>123</height>
                        <texture fallback="script.plex/thumb_fallbacks/broken-photo-thumb.png" background="true">$INFO[ListItem.Thumb]</texture>
                        <aspectratio>scale</aspectratio>
                    </control>
                </control>
            </control>
        </focusedlayout>
    </control>
    <control type="image">
        <posx>892.5</posx>
        <posy>1080</posy>
        <width>135</width>
        <height>135</height>
        <texture border="10">script.plex/home/selected.png</texture>
    </control>

</control>

<control type="group">
    <visible>!String.IsEmpty(Window.Property(show.info))</visible>
    <posx>1470</posx>
    <posy>0</posy>
    <width>450</width>
    <height>1080</height>
    <control type="image">
        <posx>0</posx>
        <posy>0</posy>
        <width>450</width>
        <height>1080</height>
        <texture>script.plex/white-square.png</texture>
        <colordiffuse>4C000000</colordiffuse>
    </control>
    <control type="grouplist">
        <posx>0</posx>
        <posy>0</posy>
        <width>450</width>
        <height>1080</height>
        <itemgap>0</itemgap>
        <orientation>vertical</orientation>

        <control type="button">
            <!-- margin -->
            <width>450</width>
            <height>21</height>
            <texturefocus>-</texturefocus>
            <texturenofocus>-</texturenofocus>
            <colordiffuse>00000000</colordiffuse>
            <label> </label>
        </control>
        <control type="button" id="650">
            <width>450</width>
            <height>37</height>
            <texturefocus>script.plex/white-square.png</texturefocus>
            <texturenofocus>script.plex/white-square.png</texturenofocus>
            <colordiffuse>00000000</colordiffuse>
            <align>left</align>
            <align>center</align>
            <textoffsetx>28</textoffsetx>
            <font>font12</font>
            <label>[B]$INFO[Window.Property(photo.title)][/B]</label>
        </control>
        <control type="button" id="659">
            <width>450</width>
            <height>37</height>
            <texturefocus>script.plex/white-square.png</texturefocus>
            <texturenofocus>script.plex/white-square.png</texturenofocus>
            <colordiffuse>00000000</colordiffuse>
            <align>left</align>
            <align>center</align>
            <textoffsetx>28</textoffsetx>
            <font>font12</font>
            <label>$INFO[Window.Property(photo.date)]</label>
        </control>
        <control type="button">
            <!-- margin -->
            <width>450</width>
            <height>21</height>
            <texturefocus>-</texturefocus>
            <texturenofocus>-</texturenofocus>
            <colordiffuse>00000000</colordiffuse>
            <label> </label>
        </control>

        <control type="button">
            <!-- margin -->
            <width>450</width>
            <height>21</height>
            <texturefocus>script.plex/white-square.png</texturefocus>
            <texturenofocus>script.plex/white-square.png</texturenofocus>
            <colordiffuse>99000000</colordiffuse>
            <label> </label>
        </control>
        <control type="group">
            <visible>!String.IsEmpty(Window.Property(camera.model))</visible>
            <width>450</width>
            <height>37</height>
            <control type="button">
                <posx>0</posx>
                <posy>0</posy>
                <width>450</width>
                <height>37</height>
                <texturefocus>script.plex/white-square.png</texturefocus>
                <texturenofocus>script.plex/white-square.png</texturenofocus>
                <colordiffuse>99000000</colordiffuse>
                <align>left</align>
                <align>center</align>
                <textoffsetx>28</textoffsetx>
                <font>font12</font>
                <label>$INFO[Window.Property(camera.model)]</label>
            </control>
            <control type="image">
                <posx>393</posx>
                <posy>6</posy>
                <width>29</width>
                <height>24</height>
                <texture>script.plex/indicators/camera.png</texture>
                <colordiffuse>A0FFFFFF</colordiffuse>
            </control>
        </control>
        <control type="button">
            <visible>!String.IsEmpty(Window.Property(camera.lens))</visible>
            <width>450</width>
            <height>37</height>
            <texturefocus>script.plex/white-square.png</texturefocus>
            <texturenofocus>script.plex/white-square.png</texturenofocus>
            <colordiffuse>99000000</colordiffuse>
            <align>left</align>
            <align>center</align>
            <textoffsetx>28</textoffsetx>
            <font>font12</font>
            <label>$INFO[Window.Property(camera.lens)]</label>
        </control>
        <control type="group">
            <visible>!String.IsEmpty(Window.Property(photo.container))</visible>
            <posx>0</posx>
            <posy>0</posy>
            <width>450</width>
            <height>37</height>
            <control type="button">
                <posx>0</posx>
                <posy>0</posy>
                <width>450</width>
                <height>37</height>
                <texturefocus>script.plex/white-square.png</texturefocus>
                <texturenofocus>script.plex/white-square.png</texturenofocus>
                <colordiffuse>99000000</colordiffuse>
                <align>left</align>
                <align>center</align>
                <textoffsetx>28</textoffsetx>
                <font>font12</font>
                <label>$INFO[Window.Property(photo.dims)]</label>
            </control>
            <control type="grouplist">
                <right>28</right>
                <posy>5</posy>
                <width>200</width>
                <height>26</height>
                <itemgap>0</itemgap>
                <orientation>horizontal</orientation>
                <align>right</align>
                <control type="button">
                    <width>auto</width>
                    <height>26</height>
                    <font>font10</font>
                    <align>center</align>
                    <aligny>top</aligny>
                    <focusedcolor>FF000000</focusedcolor>
                    <textcolor>FF000000</textcolor>
                    <textoffsetx>5</textoffsetx>
                    <textoffsety>-3</textoffsety>
                    <texturefocus colordiffuse="A0FFFFFF" border="12">script.plex/white-square-rounded.png</texturefocus>
                    <texturenofocus colordiffuse="A0FFFFFF" border="12">script.plex/white-square-rounded.png</texturenofocus>
                    <label>[UPPERCASE]$INFO[Window.Property(photo.container)][/UPPERCASE]</label>
                </control>
                </control>
        </control>
        <control type="button">
            <!-- margin -->
            <width>450</width>
            <height>21</height>
            <texturefocus>script.plex/white-square.png</texturefocus>
            <texturenofocus>script.plex/white-square.png</texturenofocus>
            <colordiffuse>99000000</colordiffuse>
            <label> </label>
        </control>
        <control type="group">
            <visible>!String.IsEmpty(Window.Property(camera.settings))</visible>
            <width>450</width>
            <height>80</height>
            <!-- sep -->
            <control type="image">
                <posx>0</posx>
                <posy>0</posy>
                <width>450</width>
                <height>1</height>
                <texture border="30,0,30,0">script.plex/indicators/info-sep.png</texture>
                <colordiffuse>99000000</colordiffuse>
            </control>
            <control type="image">
                <posx>28</posx>
                <posy>0</posy>
                <width>394</width>
                <height>1</height>
                <texture>script.plex/white-square.png</texture>
                <colordiffuse>999B9B9B</colordiffuse>
            </control>
            <control type="button">
                <!-- margin -->
                <posx>0</posx>
                <posy>1</posy>
                <width>450</width>
                <height>21</height>
                <texturefocus>script.plex/white-square.png</texturefocus>
                <texturenofocus>script.plex/white-square.png</texturenofocus>
                <colordiffuse>99000000</colordiffuse>
                <label> </label>
            </control>
            <control type="button">
                <posx>0</posx>
                <posy>22</posy>
                <width>450</width>
                <height>37</height>
                <texturefocus>script.plex/white-square.png</texturefocus>
                <texturenofocus>script.plex/white-square.png</texturenofocus>
                <colordiffuse>99000000</colordiffuse>
                <align>left</align>
                <align>center</align>
                <textoffsetx>28</textoffsetx>
                <font>font12</font>
                <label>$INFO[Window.Property(camera.settings)]</label>
            </control>
            <control type="button">
                <!-- margin -->
                <posx>0</posx>
                <posy>59</posy>
                <width>450</width>
                <height>21</height>
                <texturefocus>script.plex/white-square.png</texturefocus>
                <texturenofocus>script.plex/white-square.png</texturenofocus>
                <colordiffuse>99000000</colordiffuse>
                <label> </label>
            </control>
        </control>

        <control type="group">
            <visible>!String.IsEmpty(Window.Property(photo.summary))</visible>
            <width>450</width>
            <height>152</height>
            <control type="image">
                <posx>0</posx>
                <posy>0</posy>
                <width>450</width>
                <height>152</height>
                <texture>script.plex/white-square.png</texture>
                <colordiffuse>661F1F1F</colordiffuse>
            </control>
            <control type="textbox">
                <posx>28</posx>
                <posy>24</posy>
                <width>394</width>
                <height>100</height>
                <font>font12</font>
                <align>left</align>
                <aligny>center</aligny>
                <label>$INFO[Window.Property(photo.summary)]</label>
            </control>
        </control>

        <!-- <control type="button">
            <width>450</width>
            <height>147</height>
            <texturefocus>script.plex/white-square.png</texturefocus>
            <texturenofocus>script.plex/white-square.png</texturenofocus>
            <colordiffuse>66000000</colordiffuse>
            <font>font12</font>
        </control>
        <control type="button">
            <width>450</width>
            <height>150</height>
            <texturefocus>script.plex/white-square.png</texturefocus>
            <texturenofocus>script.plex/white-square.png</texturenofocus>
            <colordiffuse>661F1F1F</colordiffuse>
            <font>font12</font>
        </control> -->
    </control>
</control>
{% endblock %}
{% extends "base.xml.tpl" %}
{% block headers %}<defaultcontrol>406</defaultcontrol>{% endblock %}
{% block controls %}
<control type="group">
    <visible>String.IsEmpty(Window.Property(use_solid_background))</visible>
    <control type="image">
        <visible>String.IsEmpty(Window.Property(use_bg_fallback))</visible>
        <posx>0</posx>
        <posy>0</posy>
        <width>1920</width>
        <height>1080</height>
        <texture background="true">script.plex/home/background-fallback_black.png</texture>
    </control>
    <control type="image">
        <visible>!String.IsEmpty(Window.Property(use_bg_fallback))</visible>
        <posx>0</posx>
        <posy>0</posy>
        <width>1920</width>
        <height>1080</height>
        <texture background="true">script.plex/home/background-fallback.png</texture>
    </control>
    <control type="image">
        <visible>!String.IsEmpty(Window.Property(dynamic_backgrounds))</visible>
        <posx>0</posx>
        <posy>0</posy>
        <width>1920</width>
        <height>1080</height>
        <texture background="true" fallback="script.plex/home/background-fallback_black.png">$INFO[Window.Property(background_static)]</texture>
    </control>
    <control type="image">
        <visible>!String.IsEmpty(Window.Property(dynamic_backgrounds))</visible>
        <posx>0</posx>
        <posy>0</posy>
        <width>1920</width>
        <height>1080</height>
        <fadetime>1000</fadetime>
        <texture background="true">$INFO[Player.Art(landscape)]</texture>
    </control>
</control>

<control type="image">
    <posx>75</posx>
    <posy>75</posy>
    <width>786</width>
    <height>786</height>
    <texture>script.plex/white-square.png</texture>
    <colordiffuse>20FFFFFF</colordiffuse>
</control>
<control type="image">
    <posx>90</posx>
    <posy>90</posy>
    <width>756</width>
    <height>756</height>
    <texture>$INFO[Player.Art(thumb)]</texture>
</control>

<control type="group">
    <posx>939</posx>
    <posy>0</posy>
    <control type="label">
        <posx>0</posx>
        <posy>305</posy>
        <width>1000</width>
        <height>54</height>
        <font>font13</font>
        <align>left</align>
        <aligny>center</aligny>
        <textcolor>FFFFFFFF</textcolor>
        <label>$INFO[MusicPlayer.Artist]</label>
    </control>
    <control type="label">
        <posx>0</posx>
        <posy>359</posy>
        <width>1000</width>
        <height>54</height>
        <font>font13</font>
        <align>left</align>
        <aligny>center</aligny>
        <textcolor>FFFFFFFF</textcolor>
        <label>$INFO[MusicPlayer.Album]</label>
    </control>
    <control type="label">
        <posx>0</posx>
        <posy>470</posy>
        <width>1000</width>
        <height>54</height>
        <font>font13</font>
        <align>left</align>
        <aligny>center</aligny>
        <textcolor>FFFFFFFF</textcolor>
        <label>[B]$INFO[MusicPlayer.Title][/B]</label>
    </control>
    <control type="label">
        <posx>0</posx>
        <posy>580</posy>
        <width>1000</width>
        <height>54</height>
        <font>font13</font>
        <align>left</align>
        <aligny>center</aligny>
        <textcolor>FFFFFFFF</textcolor>
        <label>$INFO[Player.Time]$INFO[MusicPlayer.Duration, / ]</label>
    </control>
</control>

<control type="group">
    <posx>1845</posx>
    <posy>0</posy>
    <control type="label">
        <posx>0</posx>
        <posy>738</posy>
        <width>1000</width>
        <height>54</height>
        <font>font13</font>
        <align>right</align>
        <aligny>center</aligny>
        <textcolor>80FFFFFF</textcolor>
        <label>$INFO[MusicPlayer.offset(1).Artist]</label>
    </control>
    <control type="label">
        <posx>0</posx>
        <posy>794</posy>
        <width>1000</width>
        <height>54</height>
        <font>font13</font>
        <align>right</align>
        <aligny>center</aligny>
        <textcolor>80FFFFFF</textcolor>
        <label>$INFO[MusicPlayer.offset(1).Title]</label>
    </control>
</control>

<!-- <control type="image">
    <posx>0</posx>
    <posy>0</posy>
    <width>1920</width>
    <height>140</height>
    <texture>script.plex/white-square.png</texture>
    <colordiffuse>A0000000</colordiffuse>
</control>

<control type="group">
    <posx>0</posx>
    <posy>940</posy>
    <control type="image">
        <posx>0</posx>
        <posy>0</posy>
        <width>1920</width>
        <height>140</height>
        <texture>script.plex/white-square.png</texture>
        <colordiffuse>A0000000</colordiffuse>
    </control>
</control>

<control type="group">
    <posx>0</posx>
    <posy>965</posy>
    <control type="label">
        <posx>60</posx>
        <posy>0</posy>
        <width>1000</width>
        <height>60</height>
        <font>font13</font>
        <align>left</align>
        <aligny>center</aligny>
        <textcolor>FFFFFFFF</textcolor>
        <label>$INFO[Window.Property(time.current)]</label>
    </control>
    <control type="label">
        <posx>1860</posx>
        <posy>0</posy>
        <width>800</width>
        <height>60</height>
        <font>font13</font>
        <align>right</align>
        <aligny>center</aligny>
        <textcolor>FFFFFFFF</textcolor>
        <label>$INFO[Window.Property(time.duration)]</label>
    </control>
    <control type="label">
        <posx>1860</posx>
        <posy>40</posy>
        <width>800</width>
        <height>60</height>
        <font>font13</font>
        <align>right</align>
        <aligny>center</aligny>
        <textcolor>A0FFFFFF</textcolor>
        <label>$INFO[Window.Property(time.end)]</label>
    </control>
</control> -->

<control type="grouplist" id="400">
    <defaultcontrol>406</defaultcontrol>
    <hitrect x="460" y="998" w="1000" h="55" />
    <posx>360</posx>
    <posy>964</posy>
    <width>1200</width>

    <height>124</height>
    <align>center</align>
    <onup>100</onup>
    <itemgap>-40</itemgap>
    <orientation>horizontal</orientation>
    <scrolltime tween="quadratic" easing="out">200</scrolltime>
    <usecontrolcoords>true</usecontrolcoords>

    {% include "includes/music_player_buttons.xml.tpl" %}

</control>

<control type="group">
    <posx>0</posx>
    <posy>940</posy>
    <control type="button" id="100">
        <enable>Player.HasAudio</enable>
        <hitrect x="0" y="-19" w="1920" h="48" />
        <posx>0</posx>
        <posy>0</posy>
        <width>1920</width>
        <height>10</height>
        <ondown>400</ondown>
        <texturefocus>script.plex/white-square.png</texturefocus>
        <texturenofocus>script.plex/white-square.png</texturenofocus>
        <colordiffuse>A0000000</colordiffuse>
    </control>
    <control type="image" id="200">
        <visible>Control.HasFocus(100)</visible>
        <animation effect="fade" time="100" delay="100" end="100">Visible</animation>
        <posx>0</posx>
        <posy>1</posy>
        <width>1</width>
        <height>8</height>
        <texture>script.plex/white-square.png</texture>
        <colordiffuse>FFE5A00D</colordiffuse>
    </control>
    <control type="progress">
        <visible>!Control.HasFocus(100)</visible>
        <description>Progressbar</description>
        <posx>0</posx>
        <posy>2</posy>
        <width>1920</width>
        <height>6</height>
        <texturebg>script.plex/transparent-6px.png</texturebg>
        <lefttexture>-</lefttexture>
        <midtexture colordiffuse="FFCC7B19">script.plex/white-square-6px.png</midtexture>
        <righttexture>-</righttexture>
        <overlaytexture>-</overlaytexture>
        <info>Player.Progress</info>
    </control>
    <control type="progress">
        <visible>Control.HasFocus(100)</visible>
        <description>Progressbar</description>
        <posx>0</posx>
        <posy>2</posy>
        <width>1920</width>
        <height>6</height>
        <texturebg>script.plex/transparent-6px.png</texturebg>
        <lefttexture>-</lefttexture>
        <midtexture colordiffuse="FFAC5B00">script.plex/white-square-6px.png</midtexture>
        <righttexture>-</righttexture>
        <overlaytexture>-</overlaytexture>
        <info>Player.Progress</info>
    </control>
</control>

<!-- <control type="slider">
    <posx>0</posx>
    <posy>942</posy>
    <width>1920</width>
    <height>6</height>
    <visible>true</visible>
    <texturesliderbar>-</texturesliderbar>
    <textureslidernib colordiffuse="FFE5A00D">script.plex/white-square-6px.png</textureslidernib>
    <textureslidernibfocus>-</textureslidernibfocus>
    <action>seek</action>
</control> -->

<!-- <control type="image" id="201">
    <visible>!Control.HasFocus(100) + !Control.HasFocus(500)</visible>
    <animation effect="fade" time="100" delay="100" end="0">Hidden</animation>
    <posx>0</posx>
    <posy>942</posy>
    <width>1</width>
    <height>6</height>
    <texture>script.plex/white-square.png</texture>
    <colordiffuse>FFCC7B19</colordiffuse>
</control> -->

<control type="group" id="202">
    <visible>Control.HasFocus(100)</visible>
    <posx>0</posx>
    <posy>896</posy>
    <control type="group" id="203">
        <posx>-50</posx>
        <posy>0</posy>
        <control type="image">
            <animation effect="fade" time="100" delay="100" end="100">Visible</animation>
            <posx>0</posx>
            <posy>0</posy>
            <width>101</width>
            <height>39</height>
            <texture>script.plex/indicators/player-selection-time_box.png</texture>
            <colordiffuse>D0000000</colordiffuse>
        </control>
        <control type="label">
            <posx>0</posx>
            <posy>0</posy>
            <width>101</width>
            <height>40</height>
            <font>font10</font>
            <align>center</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <label>$INFO[Window.Property(time.selection)]</label>
        </control>
    </control>
    <control type="image">
        <animation effect="fade" time="100" delay="100" end="100">Visible</animation>
        <posx>-6</posx>
        <posy>39</posy>
        <width>15</width>
        <height>7</height>
        <texture>script.plex/indicators/player-selection-time_arrow.png</texture>
        <colordiffuse>D0000000</colordiffuse>
    </control>
</control>
{% endblock controls %}
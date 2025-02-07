{% extends "base.xml.tpl" %}
{% block headers %}<defaultcontrol>100</defaultcontrol>{% endblock %}
{% block controls %}
<control type="image">
    <posx>0</posx>
    <posy>0</posy>
    <width>1920</width>
    <height>1080</height>
    <texture>script.plex/sign_in/back.jpg</texture>
</control>

<control type="textbox">
    <posx>210</posx>
    <posy>375</posy>
    <width>1502</width>
    <height>530</height>
    <font>font13</font>
    <textcolor>FFFFFFFF</textcolor>
    <align>left</align>
    <label>[B]$INFO[Window.Property(message)][/B]</label>
</control>

<control type="button" id="100">
    <posx>0</posx>
    <posy>0</posy>
    <width>1920</width>
    <height>1080</height>
    <font>font20</font>
    <textcolor>FFFFFFFF</textcolor>
    <focusedcolor>FFFFFFFF</focusedcolor>
    <align>center</align>
    <aligny>center</aligny>
    <texturefocus>-</texturefocus>
    <texturenofocus>-</texturenofocus>
    <textoffsetx>0</textoffsetx>
    <textoffsety>0</textoffsety>
    <label> </label>
</control>
{% endblock %}

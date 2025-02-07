{% extends "base.xml.tpl" %}
{% block headers %}<defaultcontrol>100</defaultcontrol>{% endblock %}
{% block controls %}
<control type="image">
    <posx>0</posx>
    <posy>0</posy>
    <width>1920</width>
    <height>1080</height>
    <texture background="true" fallback="script.plex/home/background-fallback.png">$INFO[Window.Property(background)]</texture>
</control>

<control type="image">
    <posx>236</posx>
    <posy>131</posy>
    <width>638</width>
    <height>638</height>
    <texture>$INFO[Window.Property(track.thumb)]</texture>
</control>

<control type="textbox">
    <posx>236</posx>
    <posy>131</posy>
    <width>1502</width>
    <height>530</height>
    <font>font13</font>
    <textcolor>FFFFFFFF</textcolor>
    <align>left</align>
    <label>[B]$INFO[Window.Property(message)][/B]</label>
</control>

<control type="grouplist" id="300">
        <animation effect="fade" start="0" end="100" time="200" reversible="true">VisibleChange</animation>
        <defaultcontrol>301</defaultcontrol>
        <posx>965</posx>
        <posy>131</posy>
        <width>750</width>
        <height>638</height>
        <itemgap>30</itemgap>
        <orientation>vertical</orientation>
        <scrolltime tween="quadratic" easing="out">200</scrolltime>
        <control type="button" id="100">
            <posx>30</posx>
            <posy>30</posy>
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
</control>
{% endblock controls %}
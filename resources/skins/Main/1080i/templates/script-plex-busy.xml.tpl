{% extends "base.xml.tpl" %}
{% block backgroundcolor %}{% endblock %}
{% block controls %}
<control type="group">
    <animation effect="fade" start="0" end="100">WindowOpen</animation>
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
{% endblock controls %}
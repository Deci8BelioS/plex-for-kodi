{% extends "library_posters.xml.tpl" %}
{% block content %}
<control type="group" id="50">
    <animation effect="slide" time="200" end="0,-115" tween="quadratic" easing="out" condition="Integer.IsGreater(Container(101).ListItem.Property(index),5)">Conditional</animation>
    <posx>0</posx>
    <posy>135</posy>
    <defaultcontrol>101</defaultcontrol>

    {% block buttons %}
        <control type="grouplist" id="300">
            <animation effect="fade" start="0" end="100" time="200" reversible="true">VisibleChange</animation>
            <visible>!Integer.IsGreater(Container(101).ListItem.Property(index),5) + String.IsEmpty(Window.Property(no.content)) + String.IsEmpty(Window.Property(no.content.filtered)) + !String.IsEmpty(Window.Property(initialized))</visible>
            <defaultcontrol>301</defaultcontrol>
            <posx>30</posx>
            <posy>-25</posy>
            <width>1000</width>
            <height>145</height>
            <onup>200</onup>
            <ondown>101</ondown>
            <itemgap>-20</itemgap>
            <orientation>horizontal</orientation>
            <scrolltime tween="quadratic" easing="out">200</scrolltime>
            <usecontrolcoords>true</usecontrolcoords>

            {% with attr = {"width": 126, "height": 100} & template = "includes/themed_button.xml.tpl" & hitrect = {"x": 20, "y": 20, "w": 86, "h": 60} %}
                {% include template with name="play" & id=301 & visible="!String.IsEqual(Window(10000).Property(script.plex.item.type),collection) | String.IsEqual(Window.Property(media),collection)" %}
                {% include template with name="shuffle" & id=302 & visible="!String.IsEqual(Window(10000).Property(script.plex.item.type),collection) | String.IsEqual(Window.Property(media),collection)" %}
                {% include template with name="more" & id=303 & visible="String.IsEmpty(Window.Property(no.options)) | Player.HasAudio" %}
                {% include template with name="chapters" & id=304 %}
            {% endwith %}

        </control>
    {% endblock %}

    <control type="group" id="100">
        <visible>Integer.IsGreater(Container(101).NumItems,0) + String.IsEmpty(Window.Property(drawing))</visible>
        <defaultcontrol>101</defaultcontrol>
        <posx>0</posx>
        <posy>-35</posy>
        <width>1920</width>
        <height>1080</height>
        <control type="panel" id="101">
            <hitrect x="0" y="95" w="1780" h="1185" />
            <posx>0</posx>
            <posy>0</posy>
            <width>1800</width>
            <height>1190</height>
            <onup>300</onup>
            <onright>151</onright>
            <scrolltime>200</scrolltime>
            <orientation>vertical</orientation>
            <preloaditems>2</preloaditems>
            <pagecontrol>152</pagecontrol>
            <!-- ITEM LAYOUT ########################################## -->
            <itemlayout width="287" height="460">
                <control type="group">
                    <posx>55</posx>
                    <posy>137</posy>
                    <control type="group">
                        <posx>5</posx>
                        <posy>5</posy>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>244</width>
                            <height>361</height>
                            <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                        </control>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>244</width>
                            <height>361</height>
                            <texture background="true">$INFO[ListItem.Thumb]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="group">
                            <visible>!String.IsEmpty(ListItem.Property(progress))</visible>
                            <posx>0</posx>
                            <posy>351</posy>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>244</width>
                                <height>10</height>
                                <texture>script.plex/white-square.png</texture>
                                <colordiffuse>C0000000</colordiffuse>
                            </control>
                            <control type="image">
                                <posx>0</posx>
                                <posy>1</posy>
                                <width>244</width>
                                <height>8</height>
                                <texture>$INFO[ListItem.Property(progress)]</texture>
                                <colordiffuse>FFCC7B19</colordiffuse>
                            </control>
                        </control>
                        {% include "includes/watched_indicator.xml.tpl" with xoff=244 & uw_size=45 & with_count=True & scale="medium" %}
                        <control type="label">
                            <scroll>false</scroll>
                            <posx>0</posx>
                            <posy>371</posy>
                            <width>244</width>
                            <height>72</height>
                            <font>font10</font>
                            <align>center</align>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label]</label>
                        </control>
                        <control type="label">
                            <visible>!String.IsEmpty(ListItem.Property(year))</visible>
                            <scroll>false</scroll>
                            <posx>0</posx>
                            <posy>396</posy>
                            <width>244</width>
                            <height>72</height>
                            <font>font10</font>
                            <align>center</align>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Property(year)]</label>
                        </control>
                    </control>
                </control>
            </itemlayout>

            <!-- FOCUSED LAYOUT ####################################### -->
            <focusedlayout width="287" height="460">
                <control type="group">
                    <posx>55</posx>
                    <posy>137</posy>
                    <control type="group">
                        <animation effect="zoom" start="100" end="110" time="100" center="127,185" reversible="false">Focus</animation>
                        <animation effect="zoom" start="110" end="100" time="100" center="127,185" reversible="false">UnFocus</animation>
                        <posx>0</posx>
                        <posy>0</posy>
                        <control type="image">
                            <visible>Control.HasFocus(101)</visible>
                            <posx>-40</posx>
                            <posy>-40</posy>
                            <width>334</width>
                            <height>451</height>
                            <texture border="42">script.plex/drop-shadow.png</texture>
                        </control>
                        <control type="group">
                            <posx>5</posx>
                            <posy>5</posy>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>244</width>
                                <height>361</height>
                                <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                            </control>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>244</width>
                                <height>361</height>
                                <texture background="true">$INFO[ListItem.Thumb]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="group">
                                <visible>!String.IsEmpty(ListItem.Property(progress))</visible>
                                <posx>0</posx>
                                <posy>351</posy>
                                <control type="image">
                                    <posx>0</posx>
                                    <posy>0</posy>
                                    <width>244</width>
                                    <height>10</height>
                                    <texture>script.plex/white-square.png</texture>
                                    <colordiffuse>C0000000</colordiffuse>
                                </control>
                                <control type="image">
                                    <posx>0</posx>
                                    <posy>1</posy>
                                    <width>244</width>
                                    <height>8</height>
                                    <texture>$INFO[ListItem.Property(progress)]</texture>
                                    <colordiffuse>FFCC7B19</colordiffuse>
                                </control>
                            </control>
                            {% include "includes/watched_indicator.xml.tpl" with xoff=244 & uw_size=45 & with_count=True & scale="medium" %}
                            <control type="label">
                                <scroll>true</scroll>
                                <posx>0</posx>
                                <posy>371</posy>
                                <width>244</width>
                                <height>72</height>
                                <font>font10</font>
                                <align>center</align>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label]</label>
                            </control>
                            <control type="label">
                                <visible>!String.IsEmpty(ListItem.Property(year))</visible>
                                <scroll>false</scroll>
                                <posx>0</posx>
                                <posy>396</posy>
                                <width>244</width>
                                <height>72</height>
                                <font>font10</font>
                                <align>center</align>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Property(year)]</label>
                            </control>
                        </control>
                        <control type="image">
                            <visible>Control.HasFocus(101)</visible>
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>254</width>
                            <height>371</height>
                            <texture border="10">script.plex/home/selected.png</texture>
                        </control>
                    </control>
                </control>
            </focusedlayout>
        </control>
    </control>

</control>

<control type="group" id="150">
    <visible>String.IsEqual(Window(10000).Property(script.plex.sort),titleSort) + Integer.IsGreater(Container(101).NumItems,0) + String.IsEmpty(Window.Property(drawing))</visible>
    <defaultcontrol>151</defaultcontrol>
    <posx>1780</posx>
    <posy>150</posy>
    <width>20</width>
    <height>920</height>
    <control type="list" id="151">
        <posx>0</posx>
        <posy>0</posy>
        <width>34</width>
        <height>1050</height>
        <onleft>100</onleft>
        <onright>152</onright>
        <scrolltime>200</scrolltime>
        <orientation>vertical</orientation>
        <!-- ITEM LAYOUT ########################################## -->
        <itemlayout height="34">
            <control type="group">
                <posx>0</posx>
                <posy>0</posy>
                <control type="group">
                    <posx>0</posx>
                    <posy>0</posy>
                    <control type="label">
                        <visible>!String.IsEqual(Window(10000).Property(script.plex.key), ListItem.Property(letter))</visible>
                        <posx>0</posx>
                        <posy>0</posy>
                        <width>34</width>
                        <height>32</height>
                        <font>font10</font>
                        <align>center</align>
                        <aligny>center</aligny>
                        <textcolor>99FFFFFF</textcolor>
                        <label>$INFO[ListItem.Label]</label>
                    </control>
                    <control type="label">
                        <visible>String.IsEqual(Window(10000).Property(script.plex.key), ListItem.Property(key))</visible>
                        <posx>0</posx>
                        <posy>0</posy>
                        <width>34</width>
                        <height>32</height>
                        <font>font10</font>
                        <align>center</align>
                        <aligny>center</aligny>
                        <textcolor>FFE5A00D</textcolor>
                        <label>$INFO[ListItem.Label]</label>
                    </control>
                </control>
            </control>
        </itemlayout>

        <!-- FOCUSED LAYOUT ####################################### -->
        <focusedlayout height="34">
            <control type="group">
                <posx>0</posx>
                <posy>0</posy>
                <control type="group">
                    <posx>0</posx>
                    <posy>0</posy>
                    <control type="label">
                        <visible>!String.IsEqual(Window(10000).Property(script.plex.key), ListItem.Property(letter))</visible>
                        <posx>0</posx>
                        <posy>0</posy>
                        <width>34</width>
                        <height>32</height>
                        <font>font10</font>
                        <align>center</align>
                        <aligny>center</aligny>
                        <textcolor>99FFFFFF</textcolor>
                        <label>$INFO[ListItem.Label]</label>
                    </control>
                    <control type="label">
                        <visible>String.IsEqual(Window(10000).Property(script.plex.key), ListItem.Property(key))</visible>
                        <posx>0</posx>
                        <posy>0</posy>
                        <width>34</width>
                        <height>32</height>
                        <font>font10</font>
                        <align>center</align>
                        <aligny>center</aligny>
                        <textcolor>FFE5A00D</textcolor>
                        <label>$INFO[ListItem.Label]</label>
                    </control>
                </control>

                <control type="group">
                    <visible>Control.HasFocus(151)</visible>
                    <posx>0</posx>
                    <posy>0</posy>
                    <control type="image">
                        <visible>Control.HasFocus(151)</visible>
                        <posx>0</posx>
                        <posy>0</posy>
                        <width>34</width>
                        <height>34</height>
                        <colordiffuse>FFE5A00D</colordiffuse>
                        <texture border="12">script.plex/white-outline-rounded.png</texture>
                    </control>
                </control>
            </control>
        </focusedlayout>
    </control>
</control>

<control type="scrollbar" id="152">
    <hitrect x="1820" y="150" w="100" h="910" />
    <left>1860</left>
    <top>150</top>
    <width>12</width>
    <height>910</height>
    <visible>true</visible>
    <texturesliderbackground colordiffuse="40000000" border="5">script.plex/white-square-rounded.png</texturesliderbackground>
    <texturesliderbar colordiffuse="77FFFFFF" border="5">script.plex/white-square-rounded.png</texturesliderbar>
    <texturesliderbarfocus colordiffuse="FFE5A00D" border="5">script.plex/white-square-rounded.png</texturesliderbarfocus>
    <textureslidernib>-</textureslidernib>
    <textureslidernibfocus>-</textureslidernibfocus>
    <pulseonselect>false</pulseonselect>
    <orientation>vertical</orientation>
    <showonepage>false</showonepage>
    <onleft>151</onleft>
</control>
{% endblock content %}
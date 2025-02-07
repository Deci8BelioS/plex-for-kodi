{% extends "base.xml.tpl" %}
{% block headers %}<onload>SetProperty(dropdown,1)</onload>{% endblock %}
{% block backgroundcolor %}{% endblock %}
{% block controls %}
<!-- BACKGROUNDS -->
<control type="group">
    <control type="image">
        <posx>0</posx>
        <posy>0</posy>
        <width>564</width>
        <height>1080</height>
        <texture colordiffuse="4C000000">script.plex/white-square.png</texture>
    </control>
    <control type="image">
        <posx>0</posx>
        <posy>135</posy>
        <width>564</width>
        <height>810</height>
        <visible>String.IsEmpty(Window.Property(hide.kbd))</visible>
        <texture colordiffuse="FF2D2D2D">script.plex/white-square.png</texture>
    </control>
    <control type="image">
        <posx>0</posx>
        <posy>135</posy>
        <width>564</width>
        <height>248</height>
        <visible>!String.IsEmpty(Window.Property(hide.kbd))</visible>
        <texture colordiffuse="FF2D2D2D">script.plex/white-square.png</texture>
    </control>
    <control type="image">
        <posx>0</posx>
        <posy>945</posy>
        <width>564</width>
        <height>135</height>
        <visible>String.IsEmpty(Window.Property(hide.kbd))</visible>
        <texture colordiffuse="66000000">script.plex/white-square.png</texture>
    </control>
    <control type="image">
        <posx>0</posx>
        <posy>383</posy>
        <width>564</width>
        <height>697</height>
        <visible>!String.IsEmpty(Window.Property(hide.kbd))</visible>
        <texture colordiffuse="66000000">script.plex/white-square.png</texture>
    </control>
</control>

<control type="button" id="999">
    <animation effect="zoom" start="100" end="177" time="100" center="80,67.5" reversible="false">Focus</animation>
    <animation effect="zoom" start="177" end="100" time="100" center="80,67.5" reversible="false">UnFocus</animation>
    <posx>60</posx>
    <posy>47.5</posy>
    <width>40</width>
    <height>40</height>
    <ondown>900</ondown>
    <font>font12</font>
    <focusedcolor>FF000000</focusedcolor>
    <texturefocus colordiffuse="FFE5A00D">script.plex/buttons/search-focus.png</texturefocus>
    <texturenofocus colordiffuse="FFCC7B19">script.plex/buttons/search.png</texturenofocus>
    <onclick>Close</onclick>
    <label> </label>
</control>
<control type="label">
    <scroll>false</scroll>
    <posx>160</posx>
    <posy>35</posy>
    <width>500</width>
    <height>65</height>
    <font>font12</font>
    <align>left</align>
    <aligny>center</aligny>
    <textcolor>FFFFFFFF</textcolor>
    <label>[UPPERCASE]$ADDON[script.plexmod 32431][/UPPERCASE]</label>
</control>

<control type="group" id="899">
    <!-- SECTIONS -->
    <control type="group">
        <posx>60</posx>
        <posy>186</posy>
        <width>459</width>
        <height>60</height>

        <control type="group">
            <posx>0</posx>
            <posy>0</posy>
            <control type="image">
                <posx>0</posx>
                <posy>0</posy>
                <width>151</width>
                <height>60</height>
                <texture colordiffuse="FF1F1F1F">script.plex/white-square.png</texture>
            </control>
            <control type="group">
                <visible>String.IsEqual(Window.Property(search.section),all)</visible>
                <control type="image">
                    <posx>0</posx>
                    <posy>0</posy>
                    <width>151</width>
                    <height>60</height>
                    <texture colordiffuse="FFCC7B19">script.plex/white-square.png</texture>
                </control>
                <control type="label">
                    <scroll>false</scroll>
                    <posx>0</posx>
                    <posy>0</posy>
                    <width>151</width>
                    <height>60</height>
                    <font>font12</font>
                    <align>center</align>
                    <aligny>center</aligny>
                    <textcolor>FF000000</textcolor>
                    <label>All</label>
                </control>
            </control>
            <control type="label">
                <scroll>false</scroll>
                <visible>!String.IsEqual(Window.Property(search.section),all)</visible>
                <posx>0</posx>
                <posy>0</posy>
                <width>151</width>
                <height>60</height>
                <font>font12</font>
                <align>center</align>
                <aligny>center</aligny>
                <textcolor>FFFFFFFF</textcolor>
                <label>$ADDON[script.plexmod 32345]</label>
            </control>
        </control>
        <control type="group">
            <posx>154</posx>
            <posy>0</posy>
            <control type="image">
                <posx>0</posx>
                <posy>0</posy>
                <width>74</width>
                <height>60</height>
                <texture colordiffuse="FF1F1F1F">script.plex/white-square.png</texture>
            </control>
            <control type="image">
                <visible>String.IsEqual(Window.Property(search.section),movie)</visible>
                <posx>0</posx>
                <posy>0</posy>
                <width>74</width>
                <height>60</height>
                <texture colordiffuse="FFCC7B19">script.plex/white-square.png</texture>
            </control>
        </control>
        <control type="group">
            <posx>231</posx>
            <posy>0</posy>
            <control type="image">
                <posx>0</posx>
                <posy>0</posy>
                <width>74</width>
                <height>60</height>
                <texture colordiffuse="FF1F1F1F">script.plex/white-square.png</texture>
            </control>
            <control type="image">
                <visible>String.IsEqual(Window.Property(search.section),show)</visible>
                <posx>0</posx>
                <posy>0</posy>
                <width>74</width>
                <height>60</height>
                <texture colordiffuse="FFCC7B19">script.plex/white-square.png</texture>
            </control>
        </control>
        <control type="group">
            <posx>308</posx>
            <posy>0</posy>
            <control type="image">
                <posx>0</posx>
                <posy>0</posy>
                <width>74</width>
                <height>60</height>
                <texture colordiffuse="FF1F1F1F">script.plex/white-square.png</texture>
            </control>
            <control type="image">
                <visible>String.IsEqual(Window.Property(search.section),artist)</visible>
                <posx>0</posx>
                <posy>0</posy>
                <width>74</width>
                <height>60</height>
                <texture colordiffuse="FFCC7B19">script.plex/white-square.png</texture>
            </control>
        </control>
        <control type="group">
            <posx>384</posx>
            <posy>0</posy>
            <control type="image">
                <posx>0</posx>
                <posy>0</posy>
                <width>74</width>
                <height>60</height>
                <texture colordiffuse="FF1F1F1F">script.plex/white-square.png</texture>
            </control>
            <control type="image">
                <visible>String.IsEqual(Window.Property(search.section),photo)</visible>
                <posx>0</posx>
                <posy>0</posy>
                <width>74</width>
                <height>60</height>
                <texture colordiffuse="FFCC7B19">script.plex/white-square.png</texture>
            </control>
        </control>

        <control type="group" id="900">
            <defaultcontrol>901</defaultcontrol>
            <control type="group">
                <posx>0</posx>
                <posy>0</posy>
                <control type="button" id="901">
                    <animation effect="zoom" start="100" end="120" time="100" center="75.5,30" reversible="false">Focus</animation>
                    <animation effect="zoom" start="120" end="100" time="100" center="75.5,30" reversible="false">UnFocus</animation>
                    <hitrect x="0" y="0" w="151" h="60" />
                    <posx>-40</posx>
                    <posy>-40</posy>
                    <width>231</width>
                    <height>140</height>
                    <onright>902</onright>
                    <onup>999</onup>
                    <ondown>650</ondown>
                    <font>font12</font>
                    <align>center</align>
                    <aligny>center</aligny>
                    <focusedcolor>FF000000</focusedcolor>
                    <textcolor>00000000</textcolor>
                    <texturefocus colordiffuse="FFE5A00D" border="50">script.plex/white-square-rounded-with-shadow.png</texturefocus>
                    <texturenofocus>-</texturenofocus>
                    <label>$ADDON[script.plexmod 32345]</label>
                </control>
            </control>
            <control type="group">
                <posx>154</posx>
                <posy>0</posy>
                <control type="button" id="902">
                    <animation effect="zoom" start="100" end="120" time="100" center="37,30" reversible="false">Focus</animation>
                    <animation effect="zoom" start="120" end="100" time="100" center="37,30" reversible="false">UnFocus</animation>
                    <hitrect x="0" y="0" w="74" h="60" />
                    <posx>-40</posx>
                    <posy>-40</posy>
                    <width>154</width>
                    <height>140</height>
                    <onleft>901</onleft>
                    <onright>903</onright>
                    <onup>999</onup>
                    <ondown>650</ondown>
                    <font>font12</font>
                    <align>center</align>
                    <aligny>center</aligny>
                    <focusedcolor>FF000000</focusedcolor>
                    <texturefocus colordiffuse="FFE5A00D" border="50">script.plex/white-square-rounded-with-shadow.png</texturefocus>
                    <texturenofocus>-</texturenofocus>
                    <label> </label>
                </control>
            </control>
            <control type="group">
                <posx>231</posx>
                <posy>0</posy>
                <control type="button" id="903">
                    <animation effect="zoom" start="100" end="120" time="100" center="37,30" reversible="false">Focus</animation>
                    <animation effect="zoom" start="120" end="100" time="100" center="37,30" reversible="false">UnFocus</animation>
                    <hitrect x="0" y="0" w="74" h="60" />
                    <posx>-40</posx>
                    <posy>-40</posy>
                    <width>154</width>
                    <height>140</height>
                    <onleft>902</onleft>
                    <onright>904</onright>
                    <onup>999</onup>
                    <ondown>650</ondown>
                    <font>font12</font>
                    <align>center</align>
                    <aligny>center</aligny>
                    <focusedcolor>FF000000</focusedcolor>
                    <texturefocus colordiffuse="FFE5A00D" border="50">script.plex/white-square-rounded-with-shadow.png</texturefocus>
                    <texturenofocus>-</texturenofocus>
                    <label> </label>
                </control>
            </control>
            <control type="group">
                <posx>308</posx>
                <posy>0</posy>
                <control type="button" id="904">
                    <animation effect="zoom" start="100" end="120" time="100" center="37,30" reversible="false">Focus</animation>
                    <animation effect="zoom" start="120" end="100" time="100" center="37,30" reversible="false">UnFocus</animation>
                    <hitrect x="0" y="0" w="74" h="60" />
                    <posx>-40</posx>
                    <posy>-40</posy>
                    <width>154</width>
                    <height>140</height>
                    <onleft>903</onleft>
                    <onright>905</onright>
                    <onup>999</onup>
                    <ondown>650</ondown>
                    <font>font12</font>
                    <align>center</align>
                    <aligny>center</aligny>
                    <focusedcolor>FF000000</focusedcolor>
                    <texturefocus colordiffuse="FFE5A00D" border="50">script.plex/white-square-rounded-with-shadow.png</texturefocus>
                    <texturenofocus>-</texturenofocus>
                    <label> </label>
                </control>
            </control>
            <control type="group">
                <posx>385</posx>
                <posy>0</posy>
                <control type="button" id="905">
                    <animation effect="zoom" start="100" end="120" time="100" center="37,30" reversible="false">Focus</animation>
                    <animation effect="zoom" start="120" end="100" time="100" center="37,30" reversible="false">UnFocus</animation>
                    <hitrect x="0" y="0" w="74" h="60" />
                    <posx>-40</posx>
                    <posy>-40</posy>
                    <width>154</width>
                    <height>140</height>
                    <onleft>904</onleft>
                    <onright>3000</onright>
                    <onup>999</onup>
                    <ondown>650</ondown>
                    <font>font12</font>
                    <align>center</align>
                    <aligny>center</aligny>
                    <focusedcolor>FF000000</focusedcolor>
                    <texturefocus colordiffuse="FFE5A00D" border="50">script.plex/white-square-rounded-with-shadow.png</texturefocus>
                    <texturenofocus>-</texturenofocus>
                    <label> </label>
                </control>
            </control>
        </control>

        <control type="group">
            <posx>154</posx>
            <posy>0</posy>
            <control type="group">
                <animation effect="zoom" start="100" end="120" time="100" center="37,30" reversible="true" condition="Control.HasFocus(902)">Conditional</animation>
                <posx>0</posx>
                <posy>0</posy>
                <width>74</width>
                <height>60</height>
                <control type="image">
                    <posx>26</posx>
                    <posy>20</posy>
                    <width>22</width>
                    <height>20</height>
                    <texture colordiffuse="FFFFFFFF">script.plex/home/type/movie.png</texture>
                </control>
            </control>
        </control>
        <control type="group">
            <posx>231</posx>
            <posy>0</posy>
            <control type="group">
                <animation effect="zoom" start="100" end="120" time="100" center="37,30" reversible="true" condition="Control.HasFocus(903)">Conditional</animation>
                <posx>0</posx>
                <posy>0</posy>
                <width>74</width>
                <height>60</height>
                <control type="image">
                    <posx>26</posx>
                    <posy>20</posy>
                    <width>24</width>
                    <height>20</height>
                    <texture colordiffuse="FFFFFFFF">script.plex/home/type/show.png</texture>
                </control>
            </control>
        </control>
        <control type="group">
            <posx>308</posx>
            <posy>0</posy>
            <control type="group">
                <animation effect="zoom" start="100" end="120" time="100" center="37,30" reversible="true" condition="Control.HasFocus(904)">Conditional</animation>
                <posx>0</posx>
                <posy>0</posy>
                <width>74</width>
                <height>60</height>
                <control type="image">
                    <posx>26</posx>
                    <posy>20</posy>
                    <width>18</width>
                    <height>20</height>
                    <texture colordiffuse="FFFFFFFF">script.plex/home/type/artist.png</texture>
                </control>
            </control>
        </control>
        <control type="group">
            <posx>385</posx>
            <posy>0</posy>
            <control type="group">
                <animation effect="zoom" start="100" end="120" time="100" center="37,30" reversible="true" condition="Control.HasFocus(905)">Conditional</animation>
                <posx>0</posx>
                <posy>0</posy>
                <width>74</width>
                <height>60</height>
                <control type="image">
                    <posx>26</posx>
                    <posy>20</posy>
                    <width>22</width>
                    <height>20</height>
                    <texture colordiffuse="FFFFFFFF">script.plex/home/type/photo.png</texture>
                </control>
            </control>
        </control>
    </control>

    <!-- ENTRY -->
    <control type="group">
        <posx>60</posx>
        <posy>276</posy>
        <width>459</width>
        <height>60</height>
        <control type="image">
            <posx>0</posx>
            <posy>0</posy>
            <width>459</width>
            <height>60</height>
            <texture colordiffuse="FF000000">script.plex/white-square.png</texture>
        </control>
        <control type="edit" id="650">
            <posx>0</posx>
            <posy>0</posy>
            <width>459</width>
            <height>60</height>
            <align>left</align>
            <aligny>center</aligny>
            <onup>900</onup>
            <ondown>1001</ondown>
            <onright>3000</onright>
            <textcolor>00000000</textcolor>
            <label> </label>
            <hinttext> </hinttext>
            <font>font13</font>
            <textoffsetx>30</textoffsetx>
            <texturefocus border="10">script.plex/home/selected.png</texturefocus>
            <texturenofocus>-</texturenofocus>
            <pulseonselect>no</pulseonselect>
        </control>
        <control type="label" id="651">
            <scroll>false</scroll>
            <posx>30</posx>
            <posy>0</posy>
            <width>399</width>
            <height>60</height>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <font>font13</font>
            <label> </label>
        </control>
    </control>

    <!-- KEYBOARD -->
    <control type="group">
        <posx>60</posx>
        <posy>360</posy>
        <width>459</width>
        <height>439</height>
        <visible>String.IsEmpty(Window.Property(hide.kbd))</visible>

        <!-- IMAGES ROW 1 -->
        <control type="group">
            <posx>0</posx>
            <posy>0</posy>
            <control type="image">
                <posx>0</posx>
                <posy>0</posy>
                <width>74</width>
                <height>74</height>
                <texture colordiffuse="FF1F1F1F">script.plex/white-square.png</texture>
            </control>
            <control type="image">
                <posx>77</posx>
                <posy>0</posy>
                <width>74</width>
                <height>74</height>
                <texture colordiffuse="FF1F1F1F">script.plex/white-square.png</texture>
            </control>
            <control type="image">
                <posx>154</posx>
                <posy>0</posy>
                <width>74</width>
                <height>74</height>
                <texture colordiffuse="FF1F1F1F">script.plex/white-square.png</texture>
            </control>
            <control type="image">
                <posx>231</posx>
                <posy>0</posy>
                <width>74</width>
                <height>74</height>
                <texture colordiffuse="FF1F1F1F">script.plex/white-square.png</texture>
            </control>
            <control type="image">
                <posx>308</posx>
                <posy>0</posy>
                <width>74</width>
                <height>74</height>
                <texture colordiffuse="FF1F1F1F">script.plex/white-square.png</texture>
            </control>
            <control type="image">
                <posx>385</posx>
                <posy>0</posy>
                <width>74</width>
                <height>74</height>
                <texture colordiffuse="FF1F1F1F">script.plex/white-square.png</texture>
            </control>
        </control>
        <!-- IMAGES ROW 2 -->
        <control type="group">
            <posx>0</posx>
            <posy>77</posy>
            <control type="image">
                <posx>0</posx>
                <posy>0</posy>
                <width>74</width>
                <height>74</height>
                <texture colordiffuse="FF1F1F1F">script.plex/white-square.png</texture>
            </control>
            <control type="image">
                <posx>77</posx>
                <posy>0</posy>
                <width>74</width>
                <height>74</height>
                <texture colordiffuse="FF1F1F1F">script.plex/white-square.png</texture>
            </control>
            <control type="image">
                <posx>154</posx>
                <posy>0</posy>
                <width>74</width>
                <height>74</height>
                <texture colordiffuse="FF1F1F1F">script.plex/white-square.png</texture>
            </control>
            <control type="image">
                <posx>231</posx>
                <posy>0</posy>
                <width>74</width>
                <height>74</height>
                <texture colordiffuse="FF1F1F1F">script.plex/white-square.png</texture>
            </control>
            <control type="image">
                <posx>308</posx>
                <posy>0</posy>
                <width>74</width>
                <height>74</height>
                <texture colordiffuse="FF1F1F1F">script.plex/white-square.png</texture>
            </control>
            <control type="image">
                <posx>385</posx>
                <posy>0</posy>
                <width>74</width>
                <height>74</height>
                <texture colordiffuse="FF1F1F1F">script.plex/white-square.png</texture>
            </control>
        </control>
        <!-- IMAGES ROW 3 -->
        <control type="group">
            <posx>0</posx>
            <posy>154</posy>
            <control type="image">
                <posx>0</posx>
                <posy>0</posy>
                <width>74</width>
                <height>74</height>
                <texture colordiffuse="FF1F1F1F">script.plex/white-square.png</texture>
            </control>
            <control type="image">
                <posx>77</posx>
                <posy>0</posy>
                <width>74</width>
                <height>74</height>
                <texture colordiffuse="FF1F1F1F">script.plex/white-square.png</texture>
            </control>
            <control type="image">
                <posx>154</posx>
                <posy>0</posy>
                <width>74</width>
                <height>74</height>
                <texture colordiffuse="FF1F1F1F">script.plex/white-square.png</texture>
            </control>
            <control type="image">
                <posx>231</posx>
                <posy>0</posy>
                <width>74</width>
                <height>74</height>
                <texture colordiffuse="FF1F1F1F">script.plex/white-square.png</texture>
            </control>
            <control type="image">
                <posx>308</posx>
                <posy>0</posy>
                <width>74</width>
                <height>74</height>
                <texture colordiffuse="FF1F1F1F">script.plex/white-square.png</texture>
            </control>
            <control type="image">
                <posx>385</posx>
                <posy>0</posy>
                <width>74</width>
                <height>74</height>
                <texture colordiffuse="FF1F1F1F">script.plex/white-square.png</texture>
            </control>
        </control>
        <!-- IMAGES ROW 4 -->
        <control type="group">
            <posx>0</posx>
            <posy>231</posy>
            <control type="image">
                <posx>0</posx>
                <posy>0</posy>
                <width>74</width>
                <height>74</height>
                <texture colordiffuse="FF1F1F1F">script.plex/white-square.png</texture>
            </control>
            <control type="image">
                <posx>77</posx>
                <posy>0</posy>
                <width>74</width>
                <height>74</height>
                <texture colordiffuse="FF1F1F1F">script.plex/white-square.png</texture>
            </control>
            <control type="image">
                <posx>154</posx>
                <posy>0</posy>
                <width>74</width>
                <height>74</height>
                <texture colordiffuse="FF1F1F1F">script.plex/white-square.png</texture>
            </control>
            <control type="image">
                <posx>231</posx>
                <posy>0</posy>
                <width>74</width>
                <height>74</height>
                <texture colordiffuse="FF1F1F1F">script.plex/white-square.png</texture>
            </control>
            <control type="image">
                <posx>308</posx>
                <posy>0</posy>
                <width>74</width>
                <height>74</height>
                <texture colordiffuse="FF1F1F1F">script.plex/white-square.png</texture>
            </control>
            <control type="image">
                <posx>385</posx>
                <posy>0</posy>
                <width>74</width>
                <height>74</height>
                <texture colordiffuse="FF1F1F1F">script.plex/white-square.png</texture>
            </control>
        </control>
        <!-- IMAGES ROW 5 -->
        <control type="group">
            <posx>0</posx>
            <posy>308</posy>
            <control type="image">
                <posx>0</posx>
                <posy>0</posy>
                <width>74</width>
                <height>74</height>
                <texture colordiffuse="FF1F1F1F">script.plex/white-square.png</texture>
            </control>
            <control type="image">
                <posx>77</posx>
                <posy>0</posy>
                <width>74</width>
                <height>74</height>
                <texture colordiffuse="FF1F1F1F">script.plex/white-square.png</texture>
            </control>
            <control type="image">
                <posx>154</posx>
                <posy>0</posy>
                <width>74</width>
                <height>74</height>
                <texture colordiffuse="FF000000">script.plex/white-square.png</texture>
            </control>
            <control type="image">
                <posx>231</posx>
                <posy>0</posy>
                <width>74</width>
                <height>74</height>
                <texture colordiffuse="FF000000">script.plex/white-square.png</texture>
            </control>
            <control type="image">
                <posx>308</posx>
                <posy>0</posy>
                <width>74</width>
                <height>74</height>
                <texture colordiffuse="FF000000">script.plex/white-square.png</texture>
            </control>
            <control type="image">
                <posx>385</posx>
                <posy>0</posy>
                <width>74</width>
                <height>74</height>
                <texture colordiffuse="FF000000">script.plex/white-square.png</texture>
            </control>
        </control>
        <!-- IMAGES ROW 6 -->
        <control type="group">
            <posx>0</posx>
            <posy>385</posy>
            <control type="image">
                <posx>0</posx>
                <posy>0</posy>
                <width>74</width>
                <height>74</height>
                <texture colordiffuse="FF000000">script.plex/white-square.png</texture>
            </control>
            <control type="image">
                <posx>77</posx>
                <posy>0</posy>
                <width>74</width>
                <height>74</height>
                <texture colordiffuse="FF000000">script.plex/white-square.png</texture>
            </control>
            <control type="image">
                <posx>154</posx>
                <posy>0</posy>
                <width>74</width>
                <height>74</height>
                <texture colordiffuse="FF000000">script.plex/white-square.png</texture>
            </control>
            <control type="image">
                <posx>231</posx>
                <posy>0</posy>
                <width>74</width>
                <height>74</height>
                <texture colordiffuse="FF000000">script.plex/white-square.png</texture>
            </control>
            <control type="image">
                <posx>308</posx>
                <posy>0</posy>
                <width>74</width>
                <height>74</height>
                <texture colordiffuse="FF000000">script.plex/white-square.png</texture>
            </control>
            <control type="image">
                <posx>385</posx>
                <posy>0</posy>
                <width>74</width>
                <height>74</height>
                <texture colordiffuse="FF000000">script.plex/white-square.png</texture>
            </control>
        </control>

        <!-- BUTTONS ROW 1 -->
        <control type="group">
            <posx>0</posx>
            <posy>0</posy>
            <control type="group">
                <posx>0</posx>
                <posy>0</posy>
                <control type="button" id="1001">
                    <visible allowhiddenfocus="true">true</visible>
                    <animation effect="zoom" start="100" end="120" time="100" center="37,37" reversible="false">Focus</animation>
                    <animation effect="zoom" start="120" end="100" time="100" center="37,37" reversible="false">UnFocus</animation>
                    <hitrect x="0" y="0" w="75" h="75" />
                    <posx>-40</posx>
                    <posy>-40</posy>
                    <width>154</width>
                    <height>154</height>
                    <onup>650</onup>
                    <ondown>1007</ondown>
                    <onright>1002</onright>
                    <onleft>1006</onleft>
                    <font>font12</font>
                    <align>center</align>
                    <aligny>center</aligny>
                    <focusedcolor>FF000000</focusedcolor>
                    <texturefocus colordiffuse="FFE5A00D" border="50">script.plex/white-square-rounded-with-shadow.png</texturefocus>
                    <texturenofocus>-</texturenofocus>
                    <label>A</label>
                </control>
            </control>
            <control type="group">
                <posx>77</posx>
                <posy>0</posy>
                <control type="button" id="1002">
                    <animation effect="zoom" start="100" end="120" time="100" center="37,37" reversible="false">Focus</animation>
                    <animation effect="zoom" start="120" end="100" time="100" center="37,37" reversible="false">UnFocus</animation>
                    <hitrect x="0" y="0" w="75" h="75" />
                    <posx>-40</posx>
                    <posy>-40</posy>
                    <width>154</width>
                    <height>154</height>
                    <onup>650</onup>
                    <ondown>1008</ondown>
                    <onright>1003</onright>
                    <onleft>1001</onleft>
                    <font>font12</font>
                    <align>center</align>
                    <aligny>center</aligny>
                    <focusedcolor>FF000000</focusedcolor>
                    <texturefocus colordiffuse="FFE5A00D" border="50">script.plex/white-square-rounded-with-shadow.png</texturefocus>
                    <texturenofocus>-</texturenofocus>
                    <label>B</label>
                </control>
            </control>
            <control type="group">
                <posx>154</posx>
                <posy>0</posy>
                <control type="button" id="1003">
                    <animation effect="zoom" start="100" end="120" time="100" center="37,37" reversible="false">Focus</animation>
                    <animation effect="zoom" start="120" end="100" time="100" center="37,37" reversible="false">UnFocus</animation>
                    <hitrect x="0" y="0" w="75" h="75" />
                    <posx>-40</posx>
                    <posy>-40</posy>
                    <width>154</width>
                    <height>154</height>
                    <onup>650</onup>
                    <ondown>1009</ondown>
                    <onright>1004</onright>
                    <onleft>1002</onleft>
                    <font>font12</font>
                    <align>center</align>
                    <aligny>center</aligny>
                    <focusedcolor>FF000000</focusedcolor>
                    <texturefocus colordiffuse="FFE5A00D" border="50">script.plex/white-square-rounded-with-shadow.png</texturefocus>
                    <texturenofocus>-</texturenofocus>
                    <label>C</label>
                </control>
            </control>
            <control type="group">
                <posx>231</posx>
                <posy>0</posy>
                <control type="button" id="1004">
                    <animation effect="zoom" start="100" end="120" time="100" center="37,37" reversible="false">Focus</animation>
                    <animation effect="zoom" start="120" end="100" time="100" center="37,37" reversible="false">UnFocus</animation>
                    <hitrect x="0" y="0" w="75" h="75" />
                    <posx>-40</posx>
                    <posy>-40</posy>
                    <width>154</width>
                    <height>154</height>
                    <onup>650</onup>
                    <ondown>1010</ondown>
                    <onright>1005</onright>
                    <onleft>1003</onleft>
                    <font>font12</font>
                    <align>center</align>
                    <aligny>center</aligny>
                    <focusedcolor>FF000000</focusedcolor>
                    <texturefocus colordiffuse="FFE5A00D" border="50">script.plex/white-square-rounded-with-shadow.png</texturefocus>
                    <texturenofocus>-</texturenofocus>
                    <label>D</label>
                </control>
            </control>
            <control type="group">
                <posx>308</posx>
                <posy>0</posy>
                <control type="button" id="1005">
                    <animation effect="zoom" start="100" end="120" time="100" center="37,37" reversible="false">Focus</animation>
                    <animation effect="zoom" start="120" end="100" time="100" center="37,37" reversible="false">UnFocus</animation>
                    <hitrect x="0" y="0" w="75" h="75" />
                    <posx>-40</posx>
                    <posy>-40</posy>
                    <width>154</width>
                    <height>154</height>
                    <onup>650</onup>
                    <ondown>1011</ondown>
                    <onright>1006</onright>
                    <onleft>1004</onleft>
                    <font>font12</font>
                    <align>center</align>
                    <aligny>center</aligny>
                    <focusedcolor>FF000000</focusedcolor>
                    <texturefocus colordiffuse="FFE5A00D" border="50">script.plex/white-square-rounded-with-shadow.png</texturefocus>
                    <texturenofocus>-</texturenofocus>
                    <label>E</label>
                </control>
            </control>
            <control type="group">
                <posx>385</posx>
                <posy>0</posy>
                <control type="button" id="1006">
                    <animation effect="zoom" start="100" end="120" time="100" center="37,37" reversible="false">Focus</animation>
                    <animation effect="zoom" start="120" end="100" time="100" center="37,37" reversible="false">UnFocus</animation>
                    <hitrect x="0" y="0" w="75" h="75" />
                    <posx>-40</posx>
                    <posy>-40</posy>
                    <width>154</width>
                    <height>154</height>
                    <onup>650</onup>
                    <ondown>1012</ondown>
                    <onright>3000</onright>
                    <onleft>1005</onleft>
                    <font>font12</font>
                    <align>center</align>
                    <aligny>center</aligny>
                    <focusedcolor>FF000000</focusedcolor>
                    <texturefocus colordiffuse="FFE5A00D" border="50">script.plex/white-square-rounded-with-shadow.png</texturefocus>
                    <texturenofocus>-</texturenofocus>
                    <label>F</label>
                </control>
            </control>
        </control>
        <!-- BUTTONS ROW 2 -->
        <control type="group">
            <posx>0</posx>
            <posy>77</posy>
            <control type="group">
                <posx>0</posx>
                <posy>0</posy>
                <control type="button" id="1007">
                    <animation effect="zoom" start="100" end="120" time="100" center="37,37" reversible="false">Focus</animation>
                    <animation effect="zoom" start="120" end="100" time="100" center="37,37" reversible="false">UnFocus</animation>
                    <hitrect x="0" y="0" w="75" h="75" />
                    <posx>-40</posx>
                    <posy>-40</posy>
                    <width>154</width>
                    <height>154</height>
                    <onup>1001</onup>
                    <ondown>1013</ondown>
                    <onright>1008</onright>
                    <onleft>1012</onleft>
                    <font>font12</font>
                    <align>center</align>
                    <aligny>center</aligny>
                    <focusedcolor>FF000000</focusedcolor>
                    <texturefocus colordiffuse="FFE5A00D" border="50">script.plex/white-square-rounded-with-shadow.png</texturefocus>
                    <texturenofocus>-</texturenofocus>
                    <label>G</label>
                </control>
            </control>
            <control type="group">
                <posx>77</posx>
                <posy>0</posy>
                <control type="button" id="1008">
                    <animation effect="zoom" start="100" end="120" time="100" center="37,37" reversible="false">Focus</animation>
                    <animation effect="zoom" start="120" end="100" time="100" center="37,37" reversible="false">UnFocus</animation>
                    <hitrect x="0" y="0" w="75" h="75" />
                    <posx>-40</posx>
                    <posy>-40</posy>
                    <width>154</width>
                    <height>154</height>
                    <onup>1002</onup>
                    <ondown>1014</ondown>
                    <onright>1009</onright>
                    <onleft>1007</onleft>
                    <font>font12</font>
                    <align>center</align>
                    <aligny>center</aligny>
                    <focusedcolor>FF000000</focusedcolor>
                    <texturefocus colordiffuse="FFE5A00D" border="50">script.plex/white-square-rounded-with-shadow.png</texturefocus>
                    <texturenofocus>-</texturenofocus>
                    <label>H</label>
                </control>
            </control>
            <control type="group">
                <posx>154</posx>
                <posy>0</posy>
                <control type="button" id="1009">
                    <animation effect="zoom" start="100" end="120" time="100" center="37,37" reversible="false">Focus</animation>
                    <animation effect="zoom" start="120" end="100" time="100" center="37,37" reversible="false">UnFocus</animation>
                    <hitrect x="0" y="0" w="75" h="75" />
                    <posx>-40</posx>
                    <posy>-40</posy>
                    <width>154</width>
                    <height>154</height>
                    <onup>1003</onup>
                    <ondown>1015</ondown>
                    <onright>1010</onright>
                    <onleft>1008</onleft>
                    <font>font12</font>
                    <align>center</align>
                    <aligny>center</aligny>
                    <focusedcolor>FF000000</focusedcolor>
                    <texturefocus colordiffuse="FFE5A00D" border="50">script.plex/white-square-rounded-with-shadow.png</texturefocus>
                    <texturenofocus>-</texturenofocus>
                    <label>I</label>
                </control>
            </control>
            <control type="group">
                <posx>231</posx>
                <posy>0</posy>
                <control type="button" id="1010">
                    <animation effect="zoom" start="100" end="120" time="100" center="37,37" reversible="false">Focus</animation>
                    <animation effect="zoom" start="120" end="100" time="100" center="37,37" reversible="false">UnFocus</animation>
                    <hitrect x="0" y="0" w="75" h="75" />
                    <posx>-40</posx>
                    <posy>-40</posy>
                    <width>154</width>
                    <height>154</height>
                    <onup>1004</onup>
                    <ondown>1016</ondown>
                    <onright>1011</onright>
                    <onleft>1009</onleft>
                    <font>font12</font>
                    <align>center</align>
                    <aligny>center</aligny>
                    <focusedcolor>FF000000</focusedcolor>
                    <texturefocus colordiffuse="FFE5A00D" border="50">script.plex/white-square-rounded-with-shadow.png</texturefocus>
                    <texturenofocus>-</texturenofocus>
                    <label>J</label>
                </control>
            </control>
            <control type="group">
                <posx>308</posx>
                <posy>0</posy>
                <control type="button" id="1011">
                    <animation effect="zoom" start="100" end="120" time="100" center="37,37" reversible="false">Focus</animation>
                    <animation effect="zoom" start="120" end="100" time="100" center="37,37" reversible="false">UnFocus</animation>
                    <hitrect x="0" y="0" w="75" h="75" />
                    <posx>-40</posx>
                    <posy>-40</posy>
                    <width>154</width>
                    <height>154</height>
                    <onup>1005</onup>
                    <ondown>1017</ondown>
                    <onright>1012</onright>
                    <onleft>1010</onleft>
                    <font>font12</font>
                    <align>center</align>
                    <aligny>center</aligny>
                    <focusedcolor>FF000000</focusedcolor>
                    <texturefocus colordiffuse="FFE5A00D" border="50">script.plex/white-square-rounded-with-shadow.png</texturefocus>
                    <texturenofocus>-</texturenofocus>
                    <label>K</label>
                </control>
            </control>
            <control type="group">
                <posx>385</posx>
                <posy>0</posy>
                <control type="button" id="1012">
                    <animation effect="zoom" start="100" end="120" time="100" center="37,37" reversible="false">Focus</animation>
                    <animation effect="zoom" start="120" end="100" time="100" center="37,37" reversible="false">UnFocus</animation>
                    <hitrect x="0" y="0" w="75" h="75" />
                    <posx>-40</posx>
                    <posy>-40</posy>
                    <width>154</width>
                    <height>154</height>
                    <onup>1006</onup>
                    <ondown>1018</ondown>
                    <onright>3000</onright>
                    <onleft>1011</onleft>
                    <font>font12</font>
                    <align>center</align>
                    <aligny>center</aligny>
                    <focusedcolor>FF000000</focusedcolor>
                    <texturefocus colordiffuse="FFE5A00D" border="50">script.plex/white-square-rounded-with-shadow.png</texturefocus>
                    <texturenofocus>-</texturenofocus>
                    <label>L</label>
                </control>
            </control>
        </control>
        <!-- BUTTONS ROW 3 -->
        <control type="group">
            <posx>0</posx>
            <posy>154</posy>
            <control type="group">
                <posx>0</posx>
                <posy>0</posy>
                <control type="button" id="1013">
                    <animation effect="zoom" start="100" end="120" time="100" center="37,37" reversible="false">Focus</animation>
                    <animation effect="zoom" start="120" end="100" time="100" center="37,37" reversible="false">UnFocus</animation>
                    <hitrect x="0" y="0" w="75" h="75" />
                    <posx>-40</posx>
                    <posy>-40</posy>
                    <width>154</width>
                    <height>154</height>
                    <onup>1007</onup>
                    <ondown>1019</ondown>
                    <onright>1014</onright>
                    <onleft>1018</onleft>
                    <font>font12</font>
                    <align>center</align>
                    <aligny>center</aligny>
                    <focusedcolor>FF000000</focusedcolor>
                    <texturefocus colordiffuse="FFE5A00D" border="50">script.plex/white-square-rounded-with-shadow.png</texturefocus>
                    <texturenofocus>-</texturenofocus>
                    <label>M</label>
                </control>
            </control>
            <control type="group">
                <posx>77</posx>
                <posy>0</posy>
                <control type="button" id="1014">
                    <animation effect="zoom" start="100" end="120" time="100" center="37,37" reversible="false">Focus</animation>
                    <animation effect="zoom" start="120" end="100" time="100" center="37,37" reversible="false">UnFocus</animation>
                    <hitrect x="0" y="0" w="75" h="75" />
                    <posx>-40</posx>
                    <posy>-40</posy>
                    <width>154</width>
                    <height>154</height>
                    <onup>1008</onup>
                    <ondown>1020</ondown>
                    <onright>1015</onright>
                    <onleft>1013</onleft>
                    <font>font12</font>
                    <align>center</align>
                    <aligny>center</aligny>
                    <focusedcolor>FF000000</focusedcolor>
                    <texturefocus colordiffuse="FFE5A00D" border="50">script.plex/white-square-rounded-with-shadow.png</texturefocus>
                    <texturenofocus>-</texturenofocus>
                    <label>N</label>
                </control>
            </control>
            <control type="group">
                <posx>154</posx>
                <posy>0</posy>
                <control type="button" id="1015">
                    <animation effect="zoom" start="100" end="120" time="100" center="37,37" reversible="false">Focus</animation>
                    <animation effect="zoom" start="120" end="100" time="100" center="37,37" reversible="false">UnFocus</animation>
                    <hitrect x="0" y="0" w="75" h="75" />
                    <posx>-40</posx>
                    <posy>-40</posy>
                    <width>154</width>
                    <height>154</height>
                    <onup>1009</onup>
                    <ondown>1021</ondown>
                    <onright>1016</onright>
                    <onleft>1014</onleft>
                    <font>font12</font>
                    <align>center</align>
                    <aligny>center</aligny>
                    <focusedcolor>FF000000</focusedcolor>
                    <texturefocus colordiffuse="FFE5A00D" border="50">script.plex/white-square-rounded-with-shadow.png</texturefocus>
                    <texturenofocus>-</texturenofocus>
                    <label>O</label>
                </control>
            </control>
            <control type="group">
                <posx>231</posx>
                <posy>0</posy>
                <control type="button" id="1016">
                    <animation effect="zoom" start="100" end="120" time="100" center="37,37" reversible="false">Focus</animation>
                    <animation effect="zoom" start="120" end="100" time="100" center="37,37" reversible="false">UnFocus</animation>
                    <hitrect x="0" y="0" w="75" h="75" />
                    <posx>-40</posx>
                    <posy>-40</posy>
                    <width>154</width>
                    <height>154</height>
                    <onup>1010</onup>
                    <ondown>1022</ondown>
                    <onright>1017</onright>
                    <onleft>1015</onleft>
                    <font>font12</font>
                    <align>center</align>
                    <aligny>center</aligny>
                    <focusedcolor>FF000000</focusedcolor>
                    <texturefocus colordiffuse="FFE5A00D" border="50">script.plex/white-square-rounded-with-shadow.png</texturefocus>
                    <texturenofocus>-</texturenofocus>
                    <label>P</label>
                </control>
            </control>
            <control type="group">
                <posx>308</posx>
                <posy>0</posy>
                <control type="button" id="1017">
                    <animation effect="zoom" start="100" end="120" time="100" center="37,37" reversible="false">Focus</animation>
                    <animation effect="zoom" start="120" end="100" time="100" center="37,37" reversible="false">UnFocus</animation>
                    <hitrect x="0" y="0" w="75" h="75" />
                    <posx>-40</posx>
                    <posy>-40</posy>
                    <width>154</width>
                    <height>154</height>
                    <onup>1011</onup>
                    <ondown>1023</ondown>
                    <onright>1018</onright>
                    <onleft>1016</onleft>
                    <font>font12</font>
                    <align>center</align>
                    <aligny>center</aligny>
                    <focusedcolor>FF000000</focusedcolor>
                    <texturefocus colordiffuse="FFE5A00D" border="50">script.plex/white-square-rounded-with-shadow.png</texturefocus>
                    <texturenofocus>-</texturenofocus>
                    <label>Q</label>
                </control>
            </control>
            <control type="group">
                <posx>385</posx>
                <posy>0</posy>
                <control type="button" id="1018">
                    <animation effect="zoom" start="100" end="120" time="100" center="37,37" reversible="false">Focus</animation>
                    <animation effect="zoom" start="120" end="100" time="100" center="37,37" reversible="false">UnFocus</animation>
                    <hitrect x="0" y="0" w="75" h="75" />
                    <posx>-40</posx>
                    <posy>-40</posy>
                    <width>154</width>
                    <height>154</height>
                    <onup>1012</onup>
                    <ondown>1024</ondown>
                    <onright>3000</onright>
                    <onleft>1017</onleft>
                    <font>font12</font>
                    <align>center</align>
                    <aligny>center</aligny>
                    <focusedcolor>FF000000</focusedcolor>
                    <texturefocus colordiffuse="FFE5A00D" border="50">script.plex/white-square-rounded-with-shadow.png</texturefocus>
                    <texturenofocus>-</texturenofocus>
                    <label>R</label>
                </control>
            </control>
        </control>
        <!-- BUTTONS ROW 4 -->
        <control type="group">
            <posx>0</posx>
            <posy>231</posy>
            <control type="group">
                <posx>0</posx>
                <posy>0</posy>
                <control type="button" id="1019">
                    <animation effect="zoom" start="100" end="120" time="100" center="37,37" reversible="false">Focus</animation>
                    <animation effect="zoom" start="120" end="100" time="100" center="37,37" reversible="false">UnFocus</animation>
                    <hitrect x="0" y="0" w="75" h="75" />
                    <posx>-40</posx>
                    <posy>-40</posy>
                    <width>154</width>
                    <height>154</height>
                    <onup>1013</onup>
                    <ondown>1025</ondown>
                    <onright>1020</onright>
                    <onleft>1024</onleft>
                    <font>font12</font>
                    <align>center</align>
                    <aligny>center</aligny>
                    <focusedcolor>FF000000</focusedcolor>
                    <texturefocus colordiffuse="FFE5A00D" border="50">script.plex/white-square-rounded-with-shadow.png</texturefocus>
                    <texturenofocus>-</texturenofocus>
                    <label>S</label>
                </control>
            </control>
            <control type="group">
                <posx>77</posx>
                <posy>0</posy>
                <control type="button" id="1020">
                    <animation effect="zoom" start="100" end="120" time="100" center="37,37" reversible="false">Focus</animation>
                    <animation effect="zoom" start="120" end="100" time="100" center="37,37" reversible="false">UnFocus</animation>
                    <hitrect x="0" y="0" w="75" h="75" />
                    <posx>-40</posx>
                    <posy>-40</posy>
                    <width>154</width>
                    <height>154</height>
                    <onup>1014</onup>
                    <ondown>1026</ondown>
                    <onright>1021</onright>
                    <onleft>1019</onleft>
                    <font>font12</font>
                    <align>center</align>
                    <aligny>center</aligny>
                    <focusedcolor>FF000000</focusedcolor>
                    <texturefocus colordiffuse="FFE5A00D" border="50">script.plex/white-square-rounded-with-shadow.png</texturefocus>
                    <texturenofocus>-</texturenofocus>
                    <label>T</label>
                </control>
            </control>
            <control type="group">
                <posx>154</posx>
                <posy>0</posy>
                <control type="button" id="1021">
                    <animation effect="zoom" start="100" end="120" time="100" center="37,37" reversible="false">Focus</animation>
                    <animation effect="zoom" start="120" end="100" time="100" center="37,37" reversible="false">UnFocus</animation>
                    <hitrect x="0" y="0" w="75" h="75" />
                    <posx>-40</posx>
                    <posy>-40</posy>
                    <width>154</width>
                    <height>154</height>
                    <onup>1015</onup>
                    <ondown>1027</ondown>
                    <onright>1022</onright>
                    <onleft>1020</onleft>
                    <font>font12</font>
                    <align>center</align>
                    <aligny>center</aligny>
                    <focusedcolor>FF000000</focusedcolor>
                    <texturefocus colordiffuse="FFE5A00D" border="50">script.plex/white-square-rounded-with-shadow.png</texturefocus>
                    <texturenofocus>-</texturenofocus>
                    <label>U</label>
                </control>
            </control>
            <control type="group">
                <posx>231</posx>
                <posy>0</posy>
                <control type="button" id="1022">
                    <animation effect="zoom" start="100" end="120" time="100" center="37,37" reversible="false">Focus</animation>
                    <animation effect="zoom" start="120" end="100" time="100" center="37,37" reversible="false">UnFocus</animation>
                    <hitrect x="0" y="0" w="75" h="75" />
                    <posx>-40</posx>
                    <posy>-40</posy>
                    <width>154</width>
                    <height>154</height>
                    <onup>1016</onup>
                    <ondown>1028</ondown>
                    <onright>1023</onright>
                    <onleft>1021</onleft>
                    <font>font12</font>
                    <align>center</align>
                    <aligny>center</aligny>
                    <focusedcolor>FF000000</focusedcolor>
                    <texturefocus colordiffuse="FFE5A00D" border="50">script.plex/white-square-rounded-with-shadow.png</texturefocus>
                    <texturenofocus>-</texturenofocus>
                    <label>V</label>
                </control>
            </control>
            <control type="group">
                <posx>308</posx>
                <posy>0</posy>
                <control type="button" id="1023">
                    <animation effect="zoom" start="100" end="120" time="100" center="37,37" reversible="false">Focus</animation>
                    <animation effect="zoom" start="120" end="100" time="100" center="37,37" reversible="false">UnFocus</animation>
                    <hitrect x="0" y="0" w="75" h="75" />
                    <posx>-40</posx>
                    <posy>-40</posy>
                    <width>154</width>
                    <height>154</height>
                    <onup>1017</onup>
                    <ondown>1029</ondown>
                    <onright>1024</onright>
                    <onleft>1022</onleft>
                    <font>font12</font>
                    <align>center</align>
                    <aligny>center</aligny>
                    <focusedcolor>FF000000</focusedcolor>
                    <texturefocus colordiffuse="FFE5A00D" border="50">script.plex/white-square-rounded-with-shadow.png</texturefocus>
                    <texturenofocus>-</texturenofocus>
                    <label>W</label>
                </control>
            </control>
            <control type="group">
                <posx>385</posx>
                <posy>0</posy>
                <control type="button" id="1024">
                    <animation effect="zoom" start="100" end="120" time="100" center="37,37" reversible="false">Focus</animation>
                    <animation effect="zoom" start="120" end="100" time="100" center="37,37" reversible="false">UnFocus</animation>
                    <hitrect x="0" y="0" w="75" h="75" />
                    <posx>-40</posx>
                    <posy>-40</posy>
                    <width>154</width>
                    <height>154</height>
                    <onup>1018</onup>
                    <ondown>1030</ondown>
                    <onright>3000</onright>
                    <onleft>1023</onleft>
                    <font>font12</font>
                    <align>center</align>
                    <aligny>center</aligny>
                    <focusedcolor>FF000000</focusedcolor>
                    <texturefocus colordiffuse="FFE5A00D" border="50">script.plex/white-square-rounded-with-shadow.png</texturefocus>
                    <texturenofocus>-</texturenofocus>
                    <label>X</label>
                </control>
            </control>
        </control>
        <!-- BUTTONS ROW 5 -->
        <control type="group">
            <posx>0</posx>
            <posy>308</posy>
            <control type="group">
                <posx>0</posx>
                <posy>0</posy>
                <control type="button" id="1025">
                    <animation effect="zoom" start="100" end="120" time="100" center="37,37" reversible="false">Focus</animation>
                    <animation effect="zoom" start="120" end="100" time="100" center="37,37" reversible="false">UnFocus</animation>
                    <hitrect x="0" y="0" w="75" h="75" />
                    <posx>-40</posx>
                    <posy>-40</posy>
                    <width>154</width>
                    <height>154</height>
                    <onup>1019</onup>
                    <ondown>1031</ondown>
                    <onright>1026</onright>
                    <onleft>1030</onleft>
                    <font>font12</font>
                    <align>center</align>
                    <aligny>center</aligny>
                    <focusedcolor>FF000000</focusedcolor>
                    <texturefocus colordiffuse="FFE5A00D" border="50">script.plex/white-square-rounded-with-shadow.png</texturefocus>
                    <texturenofocus>-</texturenofocus>
                    <label>Y</label>
                </control>
            </control>
            <control type="group">
                <posx>77</posx>
                <posy>0</posy>
                <control type="button" id="1026">
                    <animation effect="zoom" start="100" end="120" time="100" center="37,37" reversible="false">Focus</animation>
                    <animation effect="zoom" start="120" end="100" time="100" center="37,37" reversible="false">UnFocus</animation>
                    <hitrect x="0" y="0" w="75" h="75" />
                    <posx>-40</posx>
                    <posy>-40</posy>
                    <width>154</width>
                    <height>154</height>
                    <onup>1020</onup>
                    <ondown>1032</ondown>
                    <onright>1027</onright>
                    <onleft>1025</onleft>
                    <font>font12</font>
                    <align>center</align>
                    <aligny>center</aligny>
                    <focusedcolor>FF000000</focusedcolor>
                    <texturefocus colordiffuse="FFE5A00D" border="50">script.plex/white-square-rounded-with-shadow.png</texturefocus>
                    <texturenofocus>-</texturenofocus>
                    <label>Z</label>
                </control>
            </control>
            <control type="group">
                <posx>154</posx>
                <posy>0</posy>
                <control type="button" id="1027">
                    <animation effect="zoom" start="100" end="120" time="100" center="37,37" reversible="false">Focus</animation>
                    <animation effect="zoom" start="120" end="100" time="100" center="37,37" reversible="false">UnFocus</animation>
                    <hitrect x="0" y="0" w="75" h="75" />
                    <posx>-40</posx>
                    <posy>-40</posy>
                    <width>154</width>
                    <height>154</height>
                    <onup>1021</onup>
                    <ondown>1033</ondown>
                    <onright>1028</onright>
                    <onleft>1026</onleft>
                    <font>font12</font>
                    <align>center</align>
                    <aligny>center</aligny>
                    <focusedcolor>FF000000</focusedcolor>
                    <texturefocus colordiffuse="FFE5A00D" border="50">script.plex/white-square-rounded-with-shadow.png</texturefocus>
                    <texturenofocus>-</texturenofocus>
                    <label>0[B][/B]</label>
                </control>
            </control>
            <control type="group">
                <posx>231</posx>
                <posy>0</posy>
                <control type="button" id="1028">
                    <animation effect="zoom" start="100" end="120" time="100" center="37,37" reversible="false">Focus</animation>
                    <animation effect="zoom" start="120" end="100" time="100" center="37,37" reversible="false">UnFocus</animation>
                    <hitrect x="0" y="0" w="75" h="75" />
                    <posx>-40</posx>
                    <posy>-40</posy>
                    <width>154</width>
                    <height>154</height>
                    <onup>1022</onup>
                    <ondown>1034</ondown>
                    <onright>1029</onright>
                    <onleft>1027</onleft>
                    <font>font12</font>
                    <align>center</align>
                    <aligny>center</aligny>
                    <focusedcolor>FF000000</focusedcolor>
                    <texturefocus colordiffuse="FFE5A00D" border="50">script.plex/white-square-rounded-with-shadow.png</texturefocus>
                    <texturenofocus>-</texturenofocus>
                    <label>1[B][/B]</label>
                </control>
            </control>
            <control type="group">
                <posx>308</posx>
                <posy>0</posy>
                <control type="button" id="1029">
                    <animation effect="zoom" start="100" end="120" time="100" center="37,37" reversible="false">Focus</animation>
                    <animation effect="zoom" start="120" end="100" time="100" center="37,37" reversible="false">UnFocus</animation>
                    <hitrect x="0" y="0" w="75" h="75" />
                    <posx>-40</posx>
                    <posy>-40</posy>
                    <width>154</width>
                    <height>154</height>
                    <onup>1023</onup>
                    <ondown>1035</ondown>
                    <onright>1030</onright>
                    <onleft>1028</onleft>
                    <font>font12</font>
                    <align>center</align>
                    <aligny>center</aligny>
                    <focusedcolor>FF000000</focusedcolor>
                    <texturefocus colordiffuse="FFE5A00D" border="50">script.plex/white-square-rounded-with-shadow.png</texturefocus>
                    <texturenofocus>-</texturenofocus>
                    <label>2[B][/B]</label>
                </control>
            </control>
            <control type="group">
                <posx>385</posx>
                <posy>0</posy>
                <control type="button" id="1030">
                    <animation effect="zoom" start="100" end="120" time="100" center="37,37" reversible="false">Focus</animation>
                    <animation effect="zoom" start="120" end="100" time="100" center="37,37" reversible="false">UnFocus</animation>
                    <hitrect x="0" y="0" w="75" h="75" />
                    <posx>-40</posx>
                    <posy>-40</posy>
                    <width>154</width>
                    <height>154</height>
                    <onup>1024</onup>
                    <ondown>1036</ondown>
                    <onright>3000</onright>
                    <onleft>1029</onleft>
                    <font>font12</font>
                    <align>center</align>
                    <aligny>center</aligny>
                    <focusedcolor>FF000000</focusedcolor>
                    <texturefocus colordiffuse="FFE5A00D" border="50">script.plex/white-square-rounded-with-shadow.png</texturefocus>
                    <texturenofocus>-</texturenofocus>
                    <label>3[B][/B]</label>
                </control>
            </control>
        </control>
        <!-- BUTTONS ROW 6 -->
        <control type="group">
            <posx>0</posx>
            <posy>385</posy>
            <control type="group">
                <posx>0</posx>
                <posy>0</posy>
                <control type="button" id="1031">
                    <animation effect="zoom" start="100" end="120" time="100" center="37,37" reversible="false">Focus</animation>
                    <animation effect="zoom" start="120" end="100" time="100" center="37,37" reversible="false">UnFocus</animation>
                    <hitrect x="0" y="0" w="75" h="75" />
                    <posx>-40</posx>
                    <posy>-40</posy>
                    <width>154</width>
                    <height>154</height>
                    <onup>1025</onup>
                    <ondown>951</ondown>
                    <onright>1032</onright>
                    <onleft>1036</onleft>
                    <font>font12</font>
                    <align>center</align>
                    <aligny>center</aligny>
                    <focusedcolor>FF000000</focusedcolor>
                    <texturefocus colordiffuse="FFE5A00D" border="50">script.plex/white-square-rounded-with-shadow.png</texturefocus>
                    <texturenofocus>-</texturenofocus>
                    <label>4[B][/B]</label>
                </control>
            </control>
            <control type="group">
                <posx>77</posx>
                <posy>0</posy>
                <control type="button" id="1032">
                    <animation effect="zoom" start="100" end="120" time="100" center="37,37" reversible="false">Focus</animation>
                    <animation effect="zoom" start="120" end="100" time="100" center="37,37" reversible="false">UnFocus</animation>
                    <hitrect x="0" y="0" w="75" h="75" />
                    <posx>-40</posx>
                    <posy>-40</posy>
                    <width>154</width>
                    <height>154</height>
                    <onup>1026</onup>
                    <ondown>951</ondown>
                    <onright>1033</onright>
                    <onleft>1031</onleft>
                    <font>font12</font>
                    <align>center</align>
                    <aligny>center</aligny>
                    <focusedcolor>FF000000</focusedcolor>
                    <texturefocus colordiffuse="FFE5A00D" border="50">script.plex/white-square-rounded-with-shadow.png</texturefocus>
                    <texturenofocus>-</texturenofocus>
                    <label>5[B][/B]</label>
                </control>
            </control>
            <control type="group">
                <posx>154</posx>
                <posy>0</posy>
                <control type="button" id="1033">
                    <animation effect="zoom" start="100" end="120" time="100" center="37,37" reversible="false">Focus</animation>
                    <animation effect="zoom" start="120" end="100" time="100" center="37,37" reversible="false">UnFocus</animation>
                    <hitrect x="0" y="0" w="75" h="75" />
                    <posx>-40</posx>
                    <posy>-40</posy>
                    <width>154</width>
                    <height>154</height>
                    <onup>1027</onup>
                    <ondown>952</ondown>
                    <onright>1034</onright>
                    <onleft>1032</onleft>
                    <font>font12</font>
                    <align>center</align>
                    <aligny>center</aligny>
                    <focusedcolor>FF000000</focusedcolor>
                    <texturefocus colordiffuse="FFE5A00D" border="50">script.plex/white-square-rounded-with-shadow.png</texturefocus>
                    <texturenofocus>-</texturenofocus>
                    <label>6[B][/B]</label>
                </control>
            </control>
            <control type="group">
                <posx>231</posx>
                <posy>0</posy>
                <control type="button" id="1034">
                    <animation effect="zoom" start="100" end="120" time="100" center="37,37" reversible="false">Focus</animation>
                    <animation effect="zoom" start="120" end="100" time="100" center="37,37" reversible="false">UnFocus</animation>
                    <hitrect x="0" y="0" w="75" h="75" />
                    <posx>-40</posx>
                    <posy>-40</posy>
                    <width>154</width>
                    <height>154</height>
                    <onup>1028</onup>
                    <ondown>952</ondown>
                    <onright>1035</onright>
                    <onleft>1033</onleft>
                    <font>font12</font>
                    <align>center</align>
                    <aligny>center</aligny>
                    <focusedcolor>FF000000</focusedcolor>
                    <texturefocus colordiffuse="FFE5A00D" border="50">script.plex/white-square-rounded-with-shadow.png</texturefocus>
                    <texturenofocus>-</texturenofocus>
                    <label>7[B][/B]</label>
                </control>
            </control>
            <control type="group">
                <posx>308</posx>
                <posy>0</posy>
                <control type="button" id="1035">
                    <animation effect="zoom" start="100" end="120" time="100" center="37,37" reversible="false">Focus</animation>
                    <animation effect="zoom" start="120" end="100" time="100" center="37,37" reversible="false">UnFocus</animation>
                    <hitrect x="0" y="0" w="75" h="75" />
                    <posx>-40</posx>
                    <posy>-40</posy>
                    <width>154</width>
                    <height>154</height>
                    <onup>1029</onup>
                    <ondown>953</ondown>
                    <onright>1036</onright>
                    <onleft>1034</onleft>
                    <font>font12</font>
                    <align>center</align>
                    <aligny>center</aligny>
                    <focusedcolor>FF000000</focusedcolor>
                    <texturefocus colordiffuse="FFE5A00D" border="50">script.plex/white-square-rounded-with-shadow.png</texturefocus>
                    <texturenofocus>-</texturenofocus>
                    <label>8[B][/B]</label>
                </control>
            </control>
            <control type="group">
                <posx>385</posx>
                <posy>0</posy>
                <control type="button" id="1036">
                    <animation effect="zoom" start="100" end="120" time="100" center="37,37" reversible="false">Focus</animation>
                    <animation effect="zoom" start="120" end="100" time="100" center="37,37" reversible="false">UnFocus</animation>
                    <hitrect x="0" y="0" w="75" h="75" />
                    <posx>-40</posx>
                    <posy>-40</posy>
                    <width>154</width>
                    <height>154</height>
                    <onup>1030</onup>
                    <ondown>953</ondown>
                    <onright>3000</onright>
                    <onleft>1035</onleft>
                    <font>font12</font>
                    <align>center</align>
                    <aligny>center</aligny>
                    <focusedcolor>FF000000</focusedcolor>
                    <texturefocus colordiffuse="FFE5A00D" border="50">script.plex/white-square-rounded-with-shadow.png</texturefocus>
                    <texturenofocus>-</texturenofocus>
                    <label>9[B][/B]</label>
                </control>
            </control>
        </control>
    </control>

    <!-- DELETE-ETC -->
    <control type="group" id="950">
        <posx>60</posx>
        <posy>840</posy>
        <width>459</width>
        <height>60</height>
        <visible>String.IsEmpty(Window.Property(hide.kbd))</visible>
        <control type="image">
            <posx>0</posx>
            <posy>0</posy>
            <width>151</width>
            <height>60</height>
            <texture colordiffuse="FF000000">script.plex/white-square.png</texture>
        </control>
        <control type="image">
            <posx>154</posx>
            <posy>0</posy>
            <width>151</width>
            <height>60</height>
            <texture colordiffuse="FF000000">script.plex/white-square.png</texture>
        </control>
        <control type="image">
            <posx>308</posx>
            <posy>0</posy>
            <width>151</width>
            <height>60</height>
            <texture colordiffuse="FF000000">script.plex/white-square.png</texture>
        </control>

        <control type="group">
            <posx>0</posx>
            <posy>0</posy>
            <control type="button" id="951">
                <animation effect="zoom" start="100" end="120" time="100" center="75.5,30" reversible="false">Focus</animation>
                <animation effect="zoom" start="120" end="100" time="100" center="75.5,30" reversible="false">UnFocus</animation>
                <hitrect x="0" y="0" w="151" h="60" />
                <posx>-40</posx>
                <posy>-40</posy>
                <width>231</width>
                <height>140</height>
                <onleft>953</onleft>
                <onright>952</onright>
                <onup>1031</onup>
                <font>font12</font>
                <align>center</align>
                <aligny>center</aligny>
                <focusedcolor>FF000000</focusedcolor>
                <texturefocus colordiffuse="FFE5A00D" border="50">script.plex/white-square-rounded-with-shadow.png</texturefocus>
                <texturenofocus>-</texturenofocus>
                <label>$ADDON[script.plexmod 32322]</label>
            </control>
        </control>
        <control type="group">
            <posx>154</posx>
            <posy>0</posy>
            <control type="button" id="952">
                <animation effect="zoom" start="100" end="120" time="100" center="75.5,30" reversible="false">Focus</animation>
                <animation effect="zoom" start="120" end="100" time="100" center="75.5,30" reversible="false">UnFocus</animation>
                <hitrect x="0" y="0" w="151" h="60" />
                <posx>-40</posx>
                <posy>-40</posy>
                <width>231</width>
                <height>140</height>
                <onleft>951</onleft>
                <onright>953</onright>
                <onup>1033</onup>
                <font>font12</font>
                <align>center</align>
                <aligny>center</aligny>
                <focusedcolor>FF000000</focusedcolor>
                <texturefocus colordiffuse="FFE5A00D" border="50">script.plex/white-square-rounded-with-shadow.png</texturefocus>
                <texturenofocus>-</texturenofocus>
                <label>$ADDON[script.plexmod 32432]</label>
            </control>
        </control>
        <control type="group">
            <posx>308</posx>
            <posy>0</posy>
            <control type="button" id="953">
                <animation effect="zoom" start="100" end="120" time="100" center="75.5,30" reversible="false">Focus</animation>
                <animation effect="zoom" start="120" end="100" time="100" center="75.5,30" reversible="false">UnFocus</animation>
                <hitrect x="0" y="0" w="151" h="60" />
                <posx>-40</posx>
                <posy>-40</posy>
                <width>231</width>
                <height>140</height>
                <onleft>952</onleft>
                <onright>3000</onright>
                <onup>1036</onup>
                <font>font12</font>
                <align>center</align>
                <aligny>center</aligny>
                <focusedcolor>FF000000</focusedcolor>
                <texturefocus colordiffuse="FFE5A00D" border="50">script.plex/white-square-rounded-with-shadow.png</texturefocus>
                <texturenofocus>-</texturenofocus>
                <label>$ADDON[script.plexmod 32433]</label>
            </control>
        </control>
    </control>

    <control type="group">
        <animation effect="fade" start="0" end="100" time="100" condition="!String.IsEmpty(Window.Property(searching))">Visible</animation>
        <visible>!String.IsEmpty(Window.Property(searching))</visible>
        <posx>0</posx>
        <posy>993</posy>
        <control type="label">
            <scroll>false</scroll>
            <posx>420</posx>
            <posy>0</posy>
            <width>434</width>
            <height>39</height>
            <font>font12</font>
            <align>right</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <label>[UPPERCASE]$ADDON[script.plexmod 32434][/UPPERCASE]</label>
        </control>
        <control type="group">
            <posx>480</posx>
            <posy>0</posy>
            <control type="image">
                <visible>!String.IsEmpty(Window.Property(searching))</visible>
                <animation effect="rotate" start="0" end="-36000" time="100000" center="19.5,19.5" reversible="false">Visible</animation>
                <posx>0</posx>
                <posy>0</posy>
                <width>39</width>
                <height>39</height>
                <texture colordiffuse="FFE5A00D">script.plex/indicators/spinner.png</texture>
            </control>
        </control>
    </control>
    <control type="group">
        <visible>!String.IsEmpty(Window.Property(no.results)) + String.IsEmpty(Window.Property(searching))</visible>
        <posx>0</posx>
        <posy>993</posy>
        <control type="label">
            <scroll>false</scroll>
            <posx>0</posx>
            <posy>0</posy>
            <width>564</width>
            <height>39</height>
            <font>font12</font>
            <align>center</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <label>[UPPERCASE]$ADDON[script.plexmod 32435][/UPPERCASE]</label>
        </control>
    </control>
</control>

<control type="grouplist" id="3000">
    <!-- 2108 Focus animation -->
    <animation type="Conditional" condition="Integer.IsGreater(Window.Property(hub.focus),8) + Control.IsVisible(2008)" reversible="true">
        <effect type="slide" end="0,-420" time="200" tween="quadratic" easing="out"/>
    </animation>

    <!-- 2109 Focus animation -->
    <animation type="Conditional" condition="Integer.IsGreater(Window.Property(hub.focus),9) + Control.IsVisible(2009)" reversible="true">
        <effect type="slide" end="0,-420" time="200" tween="quadratic" easing="out"/>
    </animation>

    <!-- 2110 Focus animation -->
    <animation type="Conditional" condition="Integer.IsGreater(Window.Property(hub.focus),10) + Control.IsVisible(2010)" reversible="true">
        <effect type="slide" end="0,-420" time="200" tween="quadratic" easing="out"/>
    </animation>

    <!-- 2111 Focus animation -->
    <animation type="Conditional" condition="Integer.IsGreater(Window.Property(hub.focus),11) + Control.IsVisible(2011)" reversible="true">
        <effect type="slide" end="0,-420" time="200" tween="quadratic" easing="out"/>
    </animation>

    <!-- 2112 Focus animation -->
    <animation type="Conditional" condition="Integer.IsGreater(Window.Property(hub.focus),12) + Control.IsVisible(2012)" reversible="true">
        <effect type="slide" end="0,-420" time="200" tween="quadratic" easing="out"/>
    </animation>

    <!-- 2113 Focus animation -->
    <animation type="Conditional" condition="Integer.IsGreater(Window.Property(hub.focus),13) + Control.IsVisible(2013)" reversible="true">
        <effect type="slide" end="0,-420" time="200" tween="quadratic" easing="out"/>
    </animation>

    <!-- 2114 Focus animation -->
    <animation type="Conditional" condition="Integer.IsGreater(Window.Property(hub.focus),14) + Control.IsVisible(2014)" reversible="true">
        <effect type="slide" end="0,-420" time="200" tween="quadratic" easing="out"/>
    </animation>

    <!-- 2115 Focus animation -->
    <animation type="Conditional" condition="Integer.IsGreater(Window.Property(hub.focus),15) + Control.IsVisible(2015)" reversible="true">
        <effect type="slide" end="0,-420" time="200" tween="quadratic" easing="out"/>
    </animation>

    <!-- 2116 Focus animation -->
    <animation type="Conditional" condition="Integer.IsGreater(Window.Property(hub.focus),16) + Control.IsVisible(2016)" reversible="true">
        <effect type="slide" end="0,-420" time="200" tween="quadratic" easing="out"/>
    </animation>

    <!-- 2117 Focus animation -->
    <animation type="Conditional" condition="Integer.IsGreater(Window.Property(hub.focus),17) + Control.IsVisible(2017)" reversible="true">
        <effect type="slide" end="0,-420" time="200" tween="quadratic" easing="out"/>
    </animation>

    <!-- 2118 Focus animation -->
    <animation type="Conditional" condition="Integer.IsGreater(Window.Property(hub.focus),18) + Control.IsVisible(2018)" reversible="true">
        <effect type="slide" end="0,-420" time="200" tween="quadratic" easing="out"/>
    </animation>

    <!-- 2119 Focus animation -->
    <animation type="Conditional" condition="Integer.IsGreater(Window.Property(hub.focus),19) + Control.IsVisible(2019)" reversible="true">
        <effect type="slide" end="0,-420" time="200" tween="quadratic" easing="out"/>
    </animation>

    <!-- 2120 Focus animation -->
    <animation type="Conditional" condition="Integer.IsGreater(Window.Property(hub.focus),20) + Control.IsVisible(2020)" reversible="true">
        <effect type="slide" end="0,-420" time="200" tween="quadratic" easing="out"/>
    </animation>

    <!-- 2121 Focus animation -->
    <animation type="Conditional" condition="Integer.IsGreater(Window.Property(hub.focus),21) + Control.IsVisible(2021)" reversible="true">
        <effect type="slide" end="0,-420" time="200" tween="quadratic" easing="out"/>
    </animation>

    <!-- 2122 Focus animation -->
    <animation type="Conditional" condition="Integer.IsGreater(Window.Property(hub.focus),22) + Control.IsVisible(2022)" reversible="true">
        <effect type="slide" end="0,-420" time="200" tween="quadratic" easing="out"/>
    </animation>

    <!-- 2123 Focus animation -->
    <animation type="Conditional" condition="Integer.IsGreater(Window.Property(hub.focus),23) + Control.IsVisible(2023)" reversible="true">
        <effect type="slide" end="0,-420" time="200" tween="quadratic" easing="out"/>
    </animation>

    <!-- 2124 Focus animation -->
    <animation type="Conditional" condition="Integer.IsGreater(Window.Property(hub.focus),24) + Control.IsVisible(2024)" reversible="true">
        <effect type="slide" end="0,-420" time="200" tween="quadratic" easing="out"/>
    </animation>

    <!-- 2125 Focus animation -->
    <animation type="Conditional" condition="Integer.IsGreater(Window.Property(hub.focus),25) + Control.IsVisible(2025)" reversible="true">
        <effect type="slide" end="0,-420" time="200" tween="quadratic" easing="out"/>
    </animation>

    <!-- 2126 Focus animation -->
    <animation type="Conditional" condition="Integer.IsGreater(Window.Property(hub.focus),26) + Control.IsVisible(2026)" reversible="true">
        <effect type="slide" end="0,-420" time="200" tween="quadratic" easing="out"/>
    </animation>

    <!-- 2127 Focus animation -->
    <animation type="Conditional" condition="Integer.IsGreater(Window.Property(hub.focus),27) + Control.IsVisible(2027)" reversible="true">
        <effect type="slide" end="0,-420" time="200" tween="quadratic" easing="out"/>
    </animation>

    <!-- 2128 Focus animation -->
    <animation type="Conditional" condition="Integer.IsGreater(Window.Property(hub.focus),28) + Control.IsVisible(2028)" reversible="true">
        <effect type="slide" end="0,-420" time="200" tween="quadratic" easing="out"/>
    </animation>

    <!-- 2129 Focus animation -->
    <animation type="Conditional" condition="Integer.IsGreater(Window.Property(hub.focus),29) + Control.IsVisible(2029)" reversible="true">
        <effect type="slide" end="0,-420" time="200" tween="quadratic" easing="out"/>
    </animation>

    <!-- 2130 Focus animation -->
    <animation type="Conditional" condition="Integer.IsGreater(Window.Property(hub.focus),30) + Control.IsVisible(2030)" reversible="true">
        <effect type="slide" end="0,-420" time="200" tween="quadratic" easing="out"/>
    </animation>

    <!-- 2131 Focus animation -->
    <animation type="Conditional" condition="Integer.IsGreater(Window.Property(hub.focus),31) + Control.IsVisible(2031)" reversible="true">
        <effect type="slide" end="0,-420" time="200" tween="quadratic" easing="out"/>
    </animation>

    <!-- 2132 Focus animation -->
    <animation type="Conditional" condition="Integer.IsGreater(Window.Property(hub.focus),32) + Control.IsVisible(2032)" reversible="true">
        <effect type="slide" end="0,-420" time="200" tween="quadratic" easing="out"/>
    </animation>

    <!-- 2133 Focus animation -->
    <animation type="Conditional" condition="Integer.IsGreater(Window.Property(hub.focus),33) + Control.IsVisible(2033)" reversible="true">
        <effect type="slide" end="0,-420" time="200" tween="quadratic" easing="out"/>
    </animation>

    <!-- 2134 Focus animation -->
    <animation type="Conditional" condition="Integer.IsGreater(Window.Property(hub.focus),34) + Control.IsVisible(2034)" reversible="true">
        <effect type="slide" end="0,-420" time="200" tween="quadratic" easing="out"/>
    </animation>

    <!-- 2135 Focus animation -->
    <animation type="Conditional" condition="Integer.IsGreater(Window.Property(hub.focus),35) + Control.IsVisible(2035)" reversible="true">
        <effect type="slide" end="0,-420" time="200" tween="quadratic" easing="out"/>
    </animation>

    <!-- 2136 Focus animation -->
    <animation type="Conditional" condition="Integer.IsGreater(Window.Property(hub.focus),36) + Control.IsVisible(2036)" reversible="true">
        <effect type="slide" end="0,-420" time="200" tween="quadratic" easing="out"/>
    </animation>

    <!-- 2137 Focus animation -->
    <animation type="Conditional" condition="Integer.IsGreater(Window.Property(hub.focus),37) + Control.IsVisible(2037)" reversible="true">
        <effect type="slide" end="0,-420" time="200" tween="quadratic" easing="out"/>
    </animation>

    <!-- 2138 Focus animation -->
    <animation type="Conditional" condition="Integer.IsGreater(Window.Property(hub.focus),38) + Control.IsVisible(2038)" reversible="true">
        <effect type="slide" end="0,-420" time="200" tween="quadratic" easing="out"/>
    </animation>

    <!-- 2139 Focus animation -->
    <animation type="Conditional" condition="Integer.IsGreater(Window.Property(hub.focus),39) + Control.IsVisible(2039)" reversible="true">
        <effect type="slide" end="0,-420" time="200" tween="quadratic" easing="out"/>
    </animation>

    <!-- 2140 Focus animation -->
    <animation type="Conditional" condition="Integer.IsGreater(Window.Property(hub.focus),40) + Control.IsVisible(2040)" reversible="true">
        <effect type="slide" end="0,-420" time="200" tween="quadratic" easing="out"/>
    </animation>

    <!-- 2141 Focus animation -->
    <animation type="Conditional" condition="Integer.IsGreater(Window.Property(hub.focus),41) + Control.IsVisible(2041)" reversible="true">
        <effect type="slide" end="0,-420" time="200" tween="quadratic" easing="out"/>
    </animation>

    <!-- 2142 Focus animation -->
    <animation type="Conditional" condition="Integer.IsGreater(Window.Property(hub.focus),42) + Control.IsVisible(2042)" reversible="true">
        <effect type="slide" end="0,-420" time="200" tween="quadratic" easing="out"/>
    </animation>

    <!-- 2143 Focus animation -->
    <animation type="Conditional" condition="Integer.IsGreater(Window.Property(hub.focus),43) + Control.IsVisible(2043)" reversible="true">
        <effect type="slide" end="0,-420" time="200" tween="quadratic" easing="out"/>
    </animation>

    <!-- 2144 Focus animation -->
    <animation type="Conditional" condition="Integer.IsGreater(Window.Property(hub.focus),44) + Control.IsVisible(2044)" reversible="true">
        <effect type="slide" end="0,-420" time="200" tween="quadratic" easing="out"/>
    </animation>

    <!-- 2145 Focus animation -->
    <animation type="Conditional" condition="Integer.IsGreater(Window.Property(hub.focus),45) + Control.IsVisible(2045)" reversible="true">
        <effect type="slide" end="0,-420" time="200" tween="quadratic" easing="out"/>
    </animation>

    <!-- 2146 Focus animation -->
    <animation type="Conditional" condition="Integer.IsGreater(Window.Property(hub.focus),46) + Control.IsVisible(2046)" reversible="true">
        <effect type="slide" end="0,-420" time="200" tween="quadratic" easing="out"/>
    </animation>

    <!-- 2147 Focus animation -->
    <animation type="Conditional" condition="Integer.IsGreater(Window.Property(hub.focus),47) + Control.IsVisible(2047)" reversible="true">
        <effect type="slide" end="0,-420" time="200" tween="quadratic" easing="out"/>
    </animation>


    <defaultcontrol always="true">2000</defaultcontrol>
    <posx>564</posx>
    <posy>20</posy>
    <width>2130</width>
    <height>5540</height>
    <itemgap>20</itemgap>
    <orientation>vertical</orientation>
    <usecontrolcoords>true</usecontrolcoords>
    <scrolltime tween="quadratic" easing="out">200</scrolltime>

    <control type="group" id="2000">
        <defaultcontrol>2100</defaultcontrol>
        <visible>Integer.IsGreater(Container(2100).NumItems,0) + String.IsEmpty(Window.Property(drawing))</visible>
        <width>1356</width>
        <height>420</height>
        <control type="label">
            <scroll>false</scroll>
            <posx>60</posx>
            <posy>0</posy>
            <width>1000</width>
            <height>87</height>
            <font>font12</font>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <label>[UPPERCASE]$INFO[Window.Property(hub.2100)][/UPPERCASE]</label>
        </control>
        <control type="list" id="2100">
            <posx>0</posx>
            <posy>30</posy>
            <width>1356</width>
            <height>440</height>
            <onleft>899</onleft>
            <ondown>2101</ondown>
            <scrolltime>200</scrolltime>
            <orientation>horizontal</orientation>
            <preloaditems>4</preloaditems>
            <!-- ITEM LAYOUT ########################################## -->
            <itemlayout width="240">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <posx>5</posx>
                        <posy>5</posy>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>180</width>
                            <height>270</height>
                            <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>180</width>
                            <height>270</height>
                            <texture background="true">$INFO[ListItem.Thumb]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="label">
                            <scroll>false</scroll>
                            <posx>0</posx>
                            <posy>280</posy>
                            <width>180</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <aligny>center</aligny>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label]</label>
                        </control>
                    </control>
                </control>
            </itemlayout>

            <!-- FOCUSED LAYOUT ####################################### -->
            <focusedlayout width="240">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <animation effect="zoom" start="100" end="110" time="100" center="95,140" reversible="false">Focus</animation>
                        <animation effect="zoom" start="110" end="100" time="100" center="95,140" reversible="false">UnFocus</animation>
                        <posx>0</posx>
                        <posy>0</posy>
                        <control type="image">
                            <visible>Control.HasFocus(2100)</visible>
                            <posx>-40</posx>
                            <posy>-40</posy>
                            <width>270</width>
                            <height>360</height>
                            <texture border="42">script.plex/drop-shadow.png</texture>
                        </control>
                        <control type="group">
                            <posx>5</posx>
                            <posy>5</posy>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>180</width>
                                <height>270</height>
                                <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                                <aspectratio>scale</aspectratio>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>180</width>
                                <height>270</height>
                                <texture background="true">$INFO[ListItem.Thumb]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="label">
                                <scroll>false</scroll>
                                <posx>0</posx>
                                <posy>280</posy>
                                <width>180</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <aligny>center</aligny>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label]</label>
                            </control>
                        </control>
                        <control type="image">
                            <visible>Control.HasFocus(2100)</visible>
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>190</width>
                            <height>280</height>
                            <texture border="10">script.plex/home/selected.png</texture>
                        </control>
                    </control>
                </control>
            </focusedlayout>
        </control>
    </control>

    <control type="group" id="2001">
        <visible>Integer.IsGreater(Container(2101).NumItems,0) + String.IsEmpty(Window.Property(drawing))</visible>
        <width>1356</width>
        <height>420</height>
        <control type="label">
            <scroll>false</scroll>
            <posx>60</posx>
            <posy>0</posy>
            <width>1000</width>
            <height>87</height>
            <font>font12</font>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <label>[UPPERCASE]$INFO[Window.Property(hub.2101)][/UPPERCASE]</label>
        </control>
        <control type="list" id="2101">
            <posx>0</posx>
            <posy>30</posy>
            <width>1356</width>
            <height>440</height>
            <onleft>899</onleft>
            <onup>2100</onup>
            <ondown>2102</ondown>
            <scrolltime>200</scrolltime>
            <orientation>horizontal</orientation>
            <preloaditems>4</preloaditems>
            <!-- ITEM LAYOUT ########################################## -->
            <itemlayout width="330">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <posx>5</posx>
                        <posy>5</posy>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>270</width>
                            <height>270</height>
                            <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>270</width>
                            <height>270</height>
                            <texture background="true">$INFO[ListItem.Thumb]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="label">
                            <scroll>false</scroll>
                            <posx>0</posx>
                            <posy>280</posy>
                            <width>270</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <aligny>center</aligny>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label]</label>
                        </control>
                    </control>
                </control>
            </itemlayout>

            <!-- FOCUSED LAYOUT ####################################### -->
            <focusedlayout width="330">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <animation effect="zoom" start="100" end="110" time="100" center="140,140" reversible="false">Focus</animation>
                        <animation effect="zoom" start="110" end="100" time="100" center="140,140" reversible="false">UnFocus</animation>
                        <posx>0</posx>
                        <posy>0</posy>
                        <control type="image">
                            <visible>Control.HasFocus(2101)</visible>
                            <posx>-40</posx>
                            <posy>-40</posy>
                            <width>360</width>
                            <height>360</height>
                            <texture border="42">script.plex/drop-shadow.png</texture>
                        </control>
                        <control type="group">
                            <posx>5</posx>
                            <posy>5</posy>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>270</width>
                                <height>270</height>
                                <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>270</width>
                                <height>270</height>
                                <texture background="true">$INFO[ListItem.Thumb]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="label">
                                <scroll>false</scroll>
                                <posx>0</posx>
                                <posy>280</posy>
                                <width>270</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <aligny>center</aligny>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label]</label>
                            </control>
                        </control>
                        <control type="image">
                            <visible>Control.HasFocus(2101)</visible>
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>280</width>
                            <height>280</height>
                            <texture border="10">script.plex/home/selected.png</texture>
                        </control>
                    </control>
                </control>
            </focusedlayout>
        </control>
    </control>

    <control type="group" id="2002">
        <visible>Integer.IsGreater(Container(2102).NumItems,0) + String.IsEmpty(Window.Property(drawing))</visible>
        <width>1356</width>
        <height>320</height>
        <control type="label">
            <scroll>false</scroll>
            <posx>60</posx>
            <posy>0</posy>
            <width>1000</width>
            <height>87</height>
            <font>font12</font>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <label>[UPPERCASE]$INFO[Window.Property(hub.2102)][/UPPERCASE]</label>
        </control>
        <control type="list" id="2102">
            <posx>0</posx>
            <posy>30</posy>
            <width>1356</width>
            <height>440</height>
            <onleft>899</onleft>
            <onup>2101</onup>
            <ondown>2103</ondown>
            <scrolltime>200</scrolltime>
            <orientation>horizontal</orientation>
            <preloaditems>4</preloaditems>
            <!-- ITEM LAYOUT ########################################## -->
            <itemlayout width="360">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <posx>5</posx>
                        <posy>5</posy>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>300</width>
                            <height>169</height>
                            <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>300</width>
                            <height>169</height>
                            <texture background="true">$INFO[ListItem.Thumb]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="label">
                            <scroll>false</scroll>
                            <posx>0</posx>
                            <posy>179</posy>
                            <width>300</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <aligny>center</aligny>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label]</label>
                        </control>
                    </control>
                </control>
            </itemlayout>

            <!-- FOCUSED LAYOUT ####################################### -->
            <focusedlayout width="360">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <animation effect="zoom" start="100" end="110" time="100" center="155,89.5" reversible="false">Focus</animation>
                        <animation effect="zoom" start="110" end="100" time="100" center="155,89.5" reversible="false">UnFocus</animation>
                        <posx>0</posx>
                        <posy>0</posy>
                        <control type="image">
                            <visible>Control.HasFocus(2102)</visible>
                            <posx>-40</posx>
                            <posy>-40</posy>
                            <width>390</width>
                            <height>259</height>
                            <texture border="42">script.plex/drop-shadow.png</texture>
                        </control>
                        <control type="group">
                            <posx>5</posx>
                            <posy>5</posy>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>300</width>
                                <height>169</height>
                                <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>300</width>
                                <height>169</height>
                                <texture background="true">$INFO[ListItem.Thumb]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="label">
                                <scroll>false</scroll>
                                <posx>0</posx>
                                <posy>179</posy>
                                <width>300</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <aligny>center</aligny>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label]</label>
                            </control>
                        </control>
                        <control type="image">
                            <visible>Control.HasFocus(2102)</visible>
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>310</width>
                            <height>179</height>
                            <texture border="10">script.plex/home/selected.png</texture>
                        </control>
                    </control>
                </control>
            </focusedlayout>
        </control>
    </control>

    <control type="group" id="2003">
        <visible>Integer.IsGreater(Container(2103).NumItems,0) + String.IsEmpty(Window.Property(drawing))</visible>
        <width>1356</width>
        <height>420</height>
        <control type="label">
            <scroll>false</scroll>
            <posx>60</posx>
            <posy>0</posy>
            <width>1000</width>
            <height>87</height>
            <font>font12</font>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <label>[UPPERCASE]$INFO[Window.Property(hub.2103)][/UPPERCASE]</label>
        </control>
        <control type="list" id="2103">
            <posx>0</posx>
            <posy>30</posy>
            <width>1356</width>
            <height>440</height>
            <onleft>899</onleft>
            <onup>2102</onup>
            <ondown>2104</ondown>
            <scrolltime>200</scrolltime>
            <orientation>horizontal</orientation>
            <preloaditems>4</preloaditems>
            <!-- ITEM LAYOUT ########################################## -->
            <itemlayout width="304">
                <control type="group">
                   <posx>55</posx>
                    <posy>61</posy>
                    <control type="group">
                        <posx>5</posx>
                        <posy>5</posy>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>244</width>
                            <height>244</height>
                            <texture diffuse="script.plex/masks/role.png">$INFO[ListItem.Property(thumb.fallback)]</texture>
                        </control>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>244</width>
                            <height>244</height>
                            <texture background="true" diffuse="script.plex/masks/role.png">$INFO[ListItem.Thumb]</texture>
                            <aspectratio scalediffuse="false" aligny="top">scale</aspectratio>
                        </control>
                        <control type="label">
                            <scroll>false</scroll>
                            <posx>0</posx>
                            <posy>254</posy>
                            <width>244</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label]</label>
                        </control>
                        <control type="label">
                            <posx>0</posx>
                            <posy>282</posy>
                            <width>244</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label2]</label>
                        </control>
                    </control>
                </control>
            </itemlayout>

            <!-- FOCUSED LAYOUT ####################################### -->
            <focusedlayout width="304">
                <control type="group">
                    <posx>55</posx>
                    <posy>61</posy>
                    <control type="group">
                        <animation effect="zoom" start="100" end="110" time="100" center="127,127" reversible="false">Focus</animation>
                        <animation effect="zoom" start="110" end="100" time="100" center="127,127" reversible="false">UnFocus</animation>
                        <posx>0</posx>
                        <posy>0</posy>
                        <control type="image">
                            <visible>Control.HasFocus(2103)</visible>
                            <posx>-40</posx>
                            <posy>-40</posy>
                            <width>334</width>
                            <height>334</height>
                            <texture border="42">script.plex/buttons/role-shadow.png</texture>
                        </control>
                        <control type="group">
                            <posx>5</posx>
                            <posy>5</posy>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>244</width>
                                <height>244</height>
                                <texture diffuse="script.plex/masks/role.png">$INFO[ListItem.Property(thumb.fallback)]</texture>
                            </control>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>244</width>
                                <height>244</height>
                                <texture background="true" diffuse="script.plex/masks/role.png">$INFO[ListItem.Thumb]</texture>
                                <aspectratio scalediffuse="false" aligny="top">scale</aspectratio>
                            </control>
                            <control type="label">
                                <scroll>false</scroll>
                                <posx>0</posx>
                                <posy>254</posy>
                                <width>244</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label]</label>
                            </control>
                            <control type="label">
                                <posx>0</posx>
                                <posy>282</posy>
                                <width>244</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label2]</label>
                            </control>
                        </control>
                        <control type="image">
                            <visible>Control.HasFocus(2103)</visible>
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>254</width>
                            <height>254</height>
                            <texture>script.plex/buttons/role-selected.png</texture>
                        </control>
                    </control>
                </control>
            </focusedlayout>
        </control>
    </control>

    <control type="group" id="2004">
        <visible>Integer.IsGreater(Container(2104).NumItems,0) + String.IsEmpty(Window.Property(drawing))</visible>
        <width>1356</width>
        <height>420</height>
        <control type="image">
            <posx>60</posx>
            <posy>0</posy>
            <width>1236</width>
            <height>2</height>
            <texture>script.plex/white-square.png</texture>
            <colordiffuse>FF282828</colordiffuse>
        </control>
        <control type="label">
            <scroll>false</scroll>
            <posx>60</posx>
            <posy>0</posy>
            <width>1000</width>
            <height>87</height>
            <font>font12</font>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <label>[UPPERCASE]$INFO[Window.Property(hub.2104)][/UPPERCASE]</label>
        </control>
        <control type="list" id="2104">
            <posx>0</posx>
            <posy>30</posy>
            <width>1356</width>
            <height>440</height>
            <onleft>899</onleft>
            <onup>2103</onup>
            <ondown>2105</ondown>
            <scrolltime>200</scrolltime>
            <orientation>horizontal</orientation>
            <preloaditems>4</preloaditems>
            <!-- ITEM LAYOUT ########################################## -->
            <itemlayout width="240">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <posx>5</posx>
                        <posy>5</posy>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>180</width>
                            <height>270</height>
                            <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>180</width>
                            <height>270</height>
                            <texture background="true">$INFO[ListItem.Thumb]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="label">
                            <scroll>false</scroll>
                            <posx>0</posx>
                            <posy>280</posy>
                            <width>180</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <aligny>center</aligny>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label]</label>
                        </control>
                    </control>
                </control>
            </itemlayout>

            <!-- FOCUSED LAYOUT ####################################### -->
            <focusedlayout width="240">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <animation effect="zoom" start="100" end="110" time="100" center="95,140" reversible="false">Focus</animation>
                        <animation effect="zoom" start="110" end="100" time="100" center="95,140" reversible="false">UnFocus</animation>
                        <posx>0</posx>
                        <posy>0</posy>
                        <control type="image">
                            <visible>Control.HasFocus(2104)</visible>
                            <posx>-40</posx>
                            <posy>-40</posy>
                            <width>270</width>
                            <height>360</height>
                            <texture border="42">script.plex/drop-shadow.png</texture>
                        </control>
                        <control type="group">
                            <posx>5</posx>
                            <posy>5</posy>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>180</width>
                                <height>270</height>
                                <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>180</width>
                                <height>270</height>
                                <texture background="true">$INFO[ListItem.Thumb]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="label">
                                <scroll>false</scroll>
                                <posx>0</posx>
                                <posy>280</posy>
                                <width>180</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <aligny>center</aligny>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label]</label>
                            </control>
                        </control>
                        <control type="image">
                            <visible>Control.HasFocus(2104)</visible>
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>190</width>
                            <height>280</height>
                            <texture border="10">script.plex/home/selected.png</texture>
                        </control>
                    </control>
                </control>
            </focusedlayout>
        </control>
    </control>

    <control type="group" id="2005">
        <visible>Integer.IsGreater(Container(2105).NumItems,0) + String.IsEmpty(Window.Property(drawing))</visible>
        <width>1356</width>
        <height>420</height>
        <control type="image">
            <posx>60</posx>
            <posy>0</posy>
            <width>1236</width>
            <height>2</height>
            <texture>script.plex/white-square.png</texture>
            <colordiffuse>FF282828</colordiffuse>
        </control>
        <control type="label">
            <scroll>false</scroll>
            <posx>60</posx>
            <posy>0</posy>
            <width>1000</width>
            <height>87</height>
            <font>font12</font>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <label>[UPPERCASE]$INFO[Window.Property(hub.2105)][/UPPERCASE]</label>
        </control>
        <control type="list" id="2105">
            <posx>0</posx>
            <posy>30</posy>
            <width>1356</width>
            <height>440</height>
            <onleft>899</onleft>
            <onup>2104</onup>
            <ondown>2106</ondown>
            <scrolltime>200</scrolltime>
            <orientation>horizontal</orientation>
            <preloaditems>4</preloaditems>
            <!-- ITEM LAYOUT ########################################## -->
            <itemlayout width="330">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <posx>5</posx>
                        <posy>5</posy>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>270</width>
                            <height>270</height>
                            <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>270</width>
                            <height>270</height>
                            <texture background="true">$INFO[ListItem.Thumb]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="label">
                            <scroll>false</scroll>
                            <posx>0</posx>
                            <posy>280</posy>
                            <width>270</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <aligny>center</aligny>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label]</label>
                        </control>
                    </control>
                </control>
            </itemlayout>

            <!-- FOCUSED LAYOUT ####################################### -->
            <focusedlayout width="330">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <animation effect="zoom" start="100" end="110" time="100" center="140,140" reversible="false">Focus</animation>
                        <animation effect="zoom" start="110" end="100" time="100" center="140,140" reversible="false">UnFocus</animation>
                        <posx>0</posx>
                        <posy>0</posy>
                        <control type="image">
                            <visible>Control.HasFocus(2105)</visible>
                            <posx>-40</posx>
                            <posy>-40</posy>
                            <width>360</width>
                            <height>360</height>
                            <texture border="42">script.plex/drop-shadow.png</texture>
                        </control>
                        <control type="group">
                            <posx>5</posx>
                            <posy>5</posy>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>270</width>
                                <height>270</height>
                                <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>270</width>
                                <height>270</height>
                                <texture background="true">$INFO[ListItem.Thumb]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="label">
                                <scroll>false</scroll>
                                <posx>0</posx>
                                <posy>280</posy>
                                <width>270</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <aligny>center</aligny>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label]</label>
                            </control>
                        </control>
                        <control type="image">
                            <visible>Control.HasFocus(2105)</visible>
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>280</width>
                            <height>280</height>
                            <texture border="10">script.plex/home/selected.png</texture>
                        </control>
                    </control>
                </control>
            </focusedlayout>
        </control>
    </control>

    <control type="group" id="2006">
        <visible>Integer.IsGreater(Container(2106).NumItems,0) + String.IsEmpty(Window.Property(drawing))</visible>
        <width>1356</width>
        <height>320</height>
        <control type="image">
            <posx>60</posx>
            <posy>0</posy>
            <width>1236</width>
            <height>2</height>
            <texture>script.plex/white-square.png</texture>
            <colordiffuse>FF282828</colordiffuse>
        </control>
        <control type="label">
            <scroll>false</scroll>
            <posx>60</posx>
            <posy>0</posy>
            <width>1000</width>
            <height>87</height>
            <font>font12</font>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <label>[UPPERCASE]$INFO[Window.Property(hub.2106)][/UPPERCASE]</label>
        </control>
        <control type="list" id="2106">
            <posx>0</posx>
            <posy>30</posy>
            <width>1356</width>
            <height>440</height>
            <onleft>899</onleft>
            <onup>2105</onup>
            <ondown>2107</ondown>
            <scrolltime>200</scrolltime>
            <orientation>horizontal</orientation>
            <preloaditems>4</preloaditems>
            <!-- ITEM LAYOUT ########################################## -->
            <itemlayout width="360">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <posx>5</posx>
                        <posy>5</posy>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>300</width>
                            <height>169</height>
                            <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>300</width>
                            <height>169</height>
                            <texture background="true">$INFO[ListItem.Thumb]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="label">
                            <scroll>false</scroll>
                            <posx>0</posx>
                            <posy>179</posy>
                            <width>300</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <aligny>center</aligny>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label]</label>
                        </control>
                    </control>
                </control>
            </itemlayout>

            <!-- FOCUSED LAYOUT ####################################### -->
            <focusedlayout width="360">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <animation effect="zoom" start="100" end="110" time="100" center="155,89.5" reversible="false">Focus</animation>
                        <animation effect="zoom" start="110" end="100" time="100" center="155,89.5" reversible="false">UnFocus</animation>
                        <posx>0</posx>
                        <posy>0</posy>
                        <control type="image">
                            <visible>Control.HasFocus(2106)</visible>
                            <posx>-40</posx>
                            <posy>-40</posy>
                            <width>390</width>
                            <height>259</height>
                            <texture border="42">script.plex/drop-shadow.png</texture>
                        </control>
                        <control type="group">
                            <posx>5</posx>
                            <posy>5</posy>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>300</width>
                                <height>169</height>
                                <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>300</width>
                                <height>169</height>
                                <texture background="true">$INFO[ListItem.Thumb]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="label">
                                <scroll>false</scroll>
                                <posx>0</posx>
                                <posy>179</posy>
                                <width>300</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <aligny>center</aligny>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label]</label>
                            </control>
                        </control>
                        <control type="image">
                            <visible>Control.HasFocus(2106)</visible>
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>310</width>
                            <height>179</height>
                            <texture border="10">script.plex/home/selected.png</texture>
                        </control>
                    </control>
                </control>
            </focusedlayout>
        </control>
    </control>

    <control type="group" id="2007">
        <visible>Integer.IsGreater(Container(2107).NumItems,0) + String.IsEmpty(Window.Property(drawing))</visible>
        <width>1356</width>
        <height>420</height>
        <control type="image">
            <posx>60</posx>
            <posy>0</posy>
            <width>1236</width>
            <height>2</height>
            <texture>script.plex/white-square.png</texture>
            <colordiffuse>FF282828</colordiffuse>
        </control>
        <control type="label">
            <scroll>false</scroll>
            <posx>60</posx>
            <posy>0</posy>
            <width>1000</width>
            <height>87</height>
            <font>font12</font>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <label>[UPPERCASE]$INFO[Window.Property(hub.2107)][/UPPERCASE]</label>
        </control>
        <control type="list" id="2107">
            <posx>0</posx>
            <posy>30</posy>
            <width>1356</width>
            <height>440</height>
            <onleft>899</onleft>
            <onup>2106</onup>
            <ondown>2108</ondown>
            <scrolltime>200</scrolltime>
            <orientation>horizontal</orientation>
            <preloaditems>4</preloaditems>
            <!-- ITEM LAYOUT ########################################## -->
            <itemlayout width="304">
                <control type="group">
                   <posx>55</posx>
                    <posy>61</posy>
                    <control type="group">
                        <posx>5</posx>
                        <posy>5</posy>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>244</width>
                            <height>244</height>
                            <texture diffuse="script.plex/masks/role.png">$INFO[ListItem.Property(thumb.fallback)]</texture>
                        </control>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>244</width>
                            <height>244</height>
                            <texture background="true" diffuse="script.plex/masks/role.png">$INFO[ListItem.Thumb]</texture>
                            <aspectratio scalediffuse="false" aligny="top">scale</aspectratio>
                        </control>
                        <control type="label">
                            <scroll>false</scroll>
                            <posx>0</posx>
                            <posy>254</posy>
                            <width>244</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label]</label>
                        </control>
                        <control type="label">
                            <posx>0</posx>
                            <posy>282</posy>
                            <width>244</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label2]</label>
                        </control>
                    </control>
                </control>
            </itemlayout>

            <!-- FOCUSED LAYOUT ####################################### -->
            <focusedlayout width="304">
                <control type="group">
                    <posx>55</posx>
                    <posy>61</posy>
                    <control type="group">
                        <animation effect="zoom" start="100" end="110" time="100" center="127,127" reversible="false">Focus</animation>
                        <animation effect="zoom" start="110" end="100" time="100" center="127,127" reversible="false">UnFocus</animation>
                        <posx>0</posx>
                        <posy>0</posy>
                        <control type="image">
                            <visible>Control.HasFocus(2107)</visible>
                            <posx>-40</posx>
                            <posy>-40</posy>
                            <width>334</width>
                            <height>334</height>
                            <texture border="42">script.plex/buttons/role-shadow.png</texture>
                        </control>
                        <control type="group">
                            <posx>5</posx>
                            <posy>5</posy>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>244</width>
                                <height>244</height>
                                <texture diffuse="script.plex/masks/role.png">$INFO[ListItem.Property(thumb.fallback)]</texture>
                            </control>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>244</width>
                                <height>244</height>
                                <texture background="true" diffuse="script.plex/masks/role.png">$INFO[ListItem.Thumb]</texture>
                                <aspectratio scalediffuse="false" aligny="top">scale</aspectratio>
                            </control>
                            <control type="label">
                                <scroll>false</scroll>
                                <posx>0</posx>
                                <posy>254</posy>
                                <width>244</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label]</label>
                            </control>
                            <control type="label">
                                <posx>0</posx>
                                <posy>282</posy>
                                <width>244</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label2]</label>
                            </control>
                        </control>
                        <control type="image">
                            <visible>Control.HasFocus(2107)</visible>
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>254</width>
                            <height>254</height>
                            <texture>script.plex/buttons/role-selected.png</texture>
                        </control>
                    </control>
                </control>
            </focusedlayout>
        </control>
    </control>

    <control type="group" id="2008">
        <visible>Integer.IsGreater(Container(2108).NumItems,0) + String.IsEmpty(Window.Property(drawing))</visible>
        <width>1356</width>
        <height>420</height>
        <control type="image">
            <posx>60</posx>
            <posy>0</posy>
            <width>1236</width>
            <height>2</height>
            <texture>script.plex/white-square.png</texture>
            <colordiffuse>FF282828</colordiffuse>
        </control>
        <control type="label">
            <scroll>false</scroll>
            <posx>60</posx>
            <posy>0</posy>
            <width>1000</width>
            <height>87</height>
            <font>font12</font>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <label>[UPPERCASE]$INFO[Window.Property(hub.2108)][/UPPERCASE]</label>
        </control>
        <control type="list" id="2108">
            <posx>0</posx>
            <posy>30</posy>
            <width>1356</width>
            <height>440</height>
            <onleft>899</onleft>
            <onup>2107</onup>
            <ondown>2109</ondown>
            <scrolltime>200</scrolltime>
            <orientation>horizontal</orientation>
            <preloaditems>4</preloaditems>
            <!-- ITEM LAYOUT ########################################## -->
            <itemlayout width="240">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <posx>5</posx>
                        <posy>5</posy>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>180</width>
                            <height>270</height>
                            <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>180</width>
                            <height>270</height>
                            <texture background="true">$INFO[ListItem.Thumb]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="label">
                            <scroll>false</scroll>
                            <posx>0</posx>
                            <posy>280</posy>
                            <width>180</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <aligny>center</aligny>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label]</label>
                        </control>
                    </control>
                </control>
            </itemlayout>

            <!-- FOCUSED LAYOUT ####################################### -->
            <focusedlayout width="240">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <animation effect="zoom" start="100" end="110" time="100" center="95,140" reversible="false">Focus</animation>
                        <animation effect="zoom" start="110" end="100" time="100" center="95,140" reversible="false">UnFocus</animation>
                        <posx>0</posx>
                        <posy>0</posy>
                        <control type="image">
                            <visible>Control.HasFocus(2108)</visible>
                            <posx>-40</posx>
                            <posy>-40</posy>
                            <width>270</width>
                            <height>360</height>
                            <texture border="42">script.plex/drop-shadow.png</texture>
                        </control>
                        <control type="group">
                            <posx>5</posx>
                            <posy>5</posy>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>180</width>
                                <height>270</height>
                                <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>180</width>
                                <height>270</height>
                                <texture background="true">$INFO[ListItem.Thumb]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="label">
                                <scroll>false</scroll>
                                <posx>0</posx>
                                <posy>280</posy>
                                <width>180</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <aligny>center</aligny>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label]</label>
                            </control>
                        </control>
                        <control type="image">
                            <visible>Control.HasFocus(2108)</visible>
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>190</width>
                            <height>280</height>
                            <texture border="10">script.plex/home/selected.png</texture>
                        </control>
                    </control>
                </control>
            </focusedlayout>
        </control>
    </control>

    <control type="group" id="2009">
        <visible>Integer.IsGreater(Container(2109).NumItems,0) + String.IsEmpty(Window.Property(drawing))</visible>
        <width>1356</width>
        <height>420</height>
        <control type="image">
            <posx>60</posx>
            <posy>0</posy>
            <width>1236</width>
            <height>2</height>
            <texture>script.plex/white-square.png</texture>
            <colordiffuse>FF282828</colordiffuse>
        </control>
        <control type="label">
            <scroll>false</scroll>
            <posx>60</posx>
            <posy>0</posy>
            <width>1000</width>
            <height>87</height>
            <font>font12</font>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <label>[UPPERCASE]$INFO[Window.Property(hub.2109)][/UPPERCASE]</label>
        </control>
        <control type="list" id="2109">
            <posx>0</posx>
            <posy>30</posy>
            <width>1356</width>
            <height>440</height>
            <onleft>899</onleft>
            <onup>2108</onup>
            <ondown>2110</ondown>
            <scrolltime>200</scrolltime>
            <orientation>horizontal</orientation>
            <preloaditems>4</preloaditems>
            <!-- ITEM LAYOUT ########################################## -->
            <itemlayout width="330">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <posx>5</posx>
                        <posy>5</posy>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>270</width>
                            <height>270</height>
                            <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>270</width>
                            <height>270</height>
                            <texture background="true">$INFO[ListItem.Thumb]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="label">
                            <scroll>false</scroll>
                            <posx>0</posx>
                            <posy>280</posy>
                            <width>270</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <aligny>center</aligny>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label]</label>
                        </control>
                    </control>
                </control>
            </itemlayout>

            <!-- FOCUSED LAYOUT ####################################### -->
            <focusedlayout width="330">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <animation effect="zoom" start="100" end="110" time="100" center="140,140" reversible="false">Focus</animation>
                        <animation effect="zoom" start="110" end="100" time="100" center="140,140" reversible="false">UnFocus</animation>
                        <posx>0</posx>
                        <posy>0</posy>
                        <control type="image">
                            <visible>Control.HasFocus(2109)</visible>
                            <posx>-40</posx>
                            <posy>-40</posy>
                            <width>360</width>
                            <height>360</height>
                            <texture border="42">script.plex/drop-shadow.png</texture>
                        </control>
                        <control type="group">
                            <posx>5</posx>
                            <posy>5</posy>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>270</width>
                                <height>270</height>
                                <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>270</width>
                                <height>270</height>
                                <texture background="true">$INFO[ListItem.Thumb]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="label">
                                <scroll>false</scroll>
                                <posx>0</posx>
                                <posy>280</posy>
                                <width>270</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <aligny>center</aligny>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label]</label>
                            </control>
                        </control>
                        <control type="image">
                            <visible>Control.HasFocus(2109)</visible>
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>280</width>
                            <height>280</height>
                            <texture border="10">script.plex/home/selected.png</texture>
                        </control>
                    </control>
                </control>
            </focusedlayout>
        </control>
    </control>

    <control type="group" id="2010">
        <visible>Integer.IsGreater(Container(2110).NumItems,0) + String.IsEmpty(Window.Property(drawing))</visible>
        <width>1356</width>
        <height>320</height>
        <control type="image">
            <posx>60</posx>
            <posy>0</posy>
            <width>1236</width>
            <height>2</height>
            <texture>script.plex/white-square.png</texture>
            <colordiffuse>FF282828</colordiffuse>
        </control>
        <control type="label">
            <scroll>false</scroll>
            <posx>60</posx>
            <posy>0</posy>
            <width>1000</width>
            <height>87</height>
            <font>font12</font>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <label>[UPPERCASE]$INFO[Window.Property(hub.2110)][/UPPERCASE]</label>
        </control>
        <control type="list" id="2110">
            <posx>0</posx>
            <posy>30</posy>
            <width>1356</width>
            <height>440</height>
            <onleft>899</onleft>
            <onup>2109</onup>
            <ondown>2111</ondown>
            <scrolltime>200</scrolltime>
            <orientation>horizontal</orientation>
            <preloaditems>4</preloaditems>
            <!-- ITEM LAYOUT ########################################## -->
            <itemlayout width="360">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <posx>5</posx>
                        <posy>5</posy>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>300</width>
                            <height>169</height>
                            <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>300</width>
                            <height>169</height>
                            <texture background="true">$INFO[ListItem.Thumb]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="label">
                            <scroll>false</scroll>
                            <posx>0</posx>
                            <posy>179</posy>
                            <width>300</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <aligny>center</aligny>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label]</label>
                        </control>
                    </control>
                </control>
            </itemlayout>

            <!-- FOCUSED LAYOUT ####################################### -->
            <focusedlayout width="360">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <animation effect="zoom" start="100" end="110" time="100" center="155,89.5" reversible="false">Focus</animation>
                        <animation effect="zoom" start="110" end="100" time="100" center="155,89.5" reversible="false">UnFocus</animation>
                        <posx>0</posx>
                        <posy>0</posy>
                        <control type="image">
                            <visible>Control.HasFocus(2110)</visible>
                            <posx>-40</posx>
                            <posy>-40</posy>
                            <width>390</width>
                            <height>259</height>
                            <texture border="42">script.plex/drop-shadow.png</texture>
                        </control>
                        <control type="group">
                            <posx>5</posx>
                            <posy>5</posy>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>300</width>
                                <height>169</height>
                                <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>300</width>
                                <height>169</height>
                                <texture background="true">$INFO[ListItem.Thumb]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="label">
                                <scroll>false</scroll>
                                <posx>0</posx>
                                <posy>179</posy>
                                <width>300</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <aligny>center</aligny>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label]</label>
                            </control>
                        </control>
                        <control type="image">
                            <visible>Control.HasFocus(2110)</visible>
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>310</width>
                            <height>179</height>
                            <texture border="10">script.plex/home/selected.png</texture>
                        </control>
                    </control>
                </control>
            </focusedlayout>
        </control>
    </control>

    <control type="group" id="2011">
        <visible>Integer.IsGreater(Container(2111).NumItems,0) + String.IsEmpty(Window.Property(drawing))</visible>
        <width>1356</width>
        <height>420</height>
        <control type="image">
            <posx>60</posx>
            <posy>0</posy>
            <width>1236</width>
            <height>2</height>
            <texture>script.plex/white-square.png</texture>
            <colordiffuse>FF282828</colordiffuse>
        </control>
        <control type="label">
            <scroll>false</scroll>
            <posx>60</posx>
            <posy>0</posy>
            <width>1000</width>
            <height>87</height>
            <font>font12</font>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <label>[UPPERCASE]$INFO[Window.Property(hub.2111)][/UPPERCASE]</label>
        </control>
        <control type="list" id="2111">
            <posx>0</posx>
            <posy>30</posy>
            <width>1356</width>
            <height>440</height>
            <onleft>899</onleft>
            <onup>2110</onup>
            <ondown>2112</ondown>
            <scrolltime>200</scrolltime>
            <orientation>horizontal</orientation>
            <preloaditems>4</preloaditems>
            <!-- ITEM LAYOUT ########################################## -->
            <itemlayout width="304">
                <control type="group">
                   <posx>55</posx>
                    <posy>61</posy>
                    <control type="group">
                        <posx>5</posx>
                        <posy>5</posy>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>244</width>
                            <height>244</height>
                            <texture diffuse="script.plex/masks/role.png">$INFO[ListItem.Property(thumb.fallback)]</texture>
                        </control>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>244</width>
                            <height>244</height>
                            <texture background="true" diffuse="script.plex/masks/role.png">$INFO[ListItem.Thumb]</texture>
                            <aspectratio scalediffuse="false" aligny="top">scale</aspectratio>
                        </control>
                        <control type="label">
                            <scroll>false</scroll>
                            <posx>0</posx>
                            <posy>254</posy>
                            <width>244</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label]</label>
                        </control>
                        <control type="label">
                            <posx>0</posx>
                            <posy>282</posy>
                            <width>244</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label2]</label>
                        </control>
                    </control>
                </control>
            </itemlayout>

            <!-- FOCUSED LAYOUT ####################################### -->
            <focusedlayout width="304">
                <control type="group">
                    <posx>55</posx>
                    <posy>61</posy>
                    <control type="group">
                        <animation effect="zoom" start="100" end="110" time="100" center="127,127" reversible="false">Focus</animation>
                        <animation effect="zoom" start="110" end="100" time="100" center="127,127" reversible="false">UnFocus</animation>
                        <posx>0</posx>
                        <posy>0</posy>
                        <control type="image">
                            <visible>Control.HasFocus(2111)</visible>
                            <posx>-40</posx>
                            <posy>-40</posy>
                            <width>334</width>
                            <height>334</height>
                            <texture border="42">script.plex/buttons/role-shadow.png</texture>
                        </control>
                        <control type="group">
                            <posx>5</posx>
                            <posy>5</posy>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>244</width>
                                <height>244</height>
                                <texture diffuse="script.plex/masks/role.png">$INFO[ListItem.Property(thumb.fallback)]</texture>
                            </control>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>244</width>
                                <height>244</height>
                                <texture background="true" diffuse="script.plex/masks/role.png">$INFO[ListItem.Thumb]</texture>
                                <aspectratio scalediffuse="false" aligny="top">scale</aspectratio>
                            </control>
                            <control type="label">
                                <scroll>false</scroll>
                                <posx>0</posx>
                                <posy>254</posy>
                                <width>244</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label]</label>
                            </control>
                            <control type="label">
                                <posx>0</posx>
                                <posy>282</posy>
                                <width>244</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label2]</label>
                            </control>
                        </control>
                        <control type="image">
                            <visible>Control.HasFocus(2111)</visible>
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>254</width>
                            <height>254</height>
                            <texture>script.plex/buttons/role-selected.png</texture>
                        </control>
                    </control>
                </control>
            </focusedlayout>
        </control>
    </control>

    <control type="group" id="2012">
        <visible>Integer.IsGreater(Container(2112).NumItems,0) + String.IsEmpty(Window.Property(drawing))</visible>
        <width>1356</width>
        <height>420</height>
        <control type="image">
            <posx>60</posx>
            <posy>0</posy>
            <width>1236</width>
            <height>2</height>
            <texture>script.plex/white-square.png</texture>
            <colordiffuse>FF282828</colordiffuse>
        </control>
        <control type="label">
            <scroll>false</scroll>
            <posx>60</posx>
            <posy>0</posy>
            <width>1000</width>
            <height>87</height>
            <font>font12</font>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <label>[UPPERCASE]$INFO[Window.Property(hub.2112)][/UPPERCASE]</label>
        </control>
        <control type="list" id="2112">
            <posx>0</posx>
            <posy>30</posy>
            <width>1356</width>
            <height>440</height>
            <onleft>899</onleft>
            <onup>2111</onup>
            <ondown>2113</ondown>
            <scrolltime>200</scrolltime>
            <orientation>horizontal</orientation>
            <preloaditems>4</preloaditems>
            <!-- ITEM LAYOUT ########################################## -->
            <itemlayout width="240">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <posx>5</posx>
                        <posy>5</posy>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>180</width>
                            <height>270</height>
                            <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>180</width>
                            <height>270</height>
                            <texture background="true">$INFO[ListItem.Thumb]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="label">
                            <scroll>false</scroll>
                            <posx>0</posx>
                            <posy>280</posy>
                            <width>180</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <aligny>center</aligny>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label]</label>
                        </control>
                    </control>
                </control>
            </itemlayout>

            <!-- FOCUSED LAYOUT ####################################### -->
            <focusedlayout width="240">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <animation effect="zoom" start="100" end="110" time="100" center="95,140" reversible="false">Focus</animation>
                        <animation effect="zoom" start="110" end="100" time="100" center="95,140" reversible="false">UnFocus</animation>
                        <posx>0</posx>
                        <posy>0</posy>
                        <control type="image">
                            <visible>Control.HasFocus(2112)</visible>
                            <posx>-40</posx>
                            <posy>-40</posy>
                            <width>270</width>
                            <height>360</height>
                            <texture border="42">script.plex/drop-shadow.png</texture>
                        </control>
                        <control type="group">
                            <posx>5</posx>
                            <posy>5</posy>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>180</width>
                                <height>270</height>
                                <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>180</width>
                                <height>270</height>
                                <texture background="true">$INFO[ListItem.Thumb]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="label">
                                <scroll>false</scroll>
                                <posx>0</posx>
                                <posy>280</posy>
                                <width>180</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <aligny>center</aligny>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label]</label>
                            </control>
                        </control>
                        <control type="image">
                            <visible>Control.HasFocus(2112)</visible>
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>190</width>
                            <height>280</height>
                            <texture border="10">script.plex/home/selected.png</texture>
                        </control>
                    </control>
                </control>
            </focusedlayout>
        </control>
    </control>

    <control type="group" id="2013">
        <visible>Integer.IsGreater(Container(2113).NumItems,0) + String.IsEmpty(Window.Property(drawing))</visible>
        <width>1356</width>
        <height>420</height>
        <control type="image">
            <posx>60</posx>
            <posy>0</posy>
            <width>1236</width>
            <height>2</height>
            <texture>script.plex/white-square.png</texture>
            <colordiffuse>FF282828</colordiffuse>
        </control>
        <control type="label">
            <scroll>false</scroll>
            <posx>60</posx>
            <posy>0</posy>
            <width>1000</width>
            <height>87</height>
            <font>font12</font>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <label>[UPPERCASE]$INFO[Window.Property(hub.2113)][/UPPERCASE]</label>
        </control>
        <control type="list" id="2113">
            <posx>0</posx>
            <posy>30</posy>
            <width>1356</width>
            <height>440</height>
            <onleft>899</onleft>
            <onup>2112</onup>
            <ondown>2114</ondown>
            <scrolltime>200</scrolltime>
            <orientation>horizontal</orientation>
            <preloaditems>4</preloaditems>
            <!-- ITEM LAYOUT ########################################## -->
            <itemlayout width="330">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <posx>5</posx>
                        <posy>5</posy>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>270</width>
                            <height>270</height>
                            <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>270</width>
                            <height>270</height>
                            <texture background="true">$INFO[ListItem.Thumb]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="label">
                            <scroll>false</scroll>
                            <posx>0</posx>
                            <posy>280</posy>
                            <width>270</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <aligny>center</aligny>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label]</label>
                        </control>
                    </control>
                </control>
            </itemlayout>

            <!-- FOCUSED LAYOUT ####################################### -->
            <focusedlayout width="330">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <animation effect="zoom" start="100" end="110" time="100" center="140,140" reversible="false">Focus</animation>
                        <animation effect="zoom" start="110" end="100" time="100" center="140,140" reversible="false">UnFocus</animation>
                        <posx>0</posx>
                        <posy>0</posy>
                        <control type="image">
                            <visible>Control.HasFocus(2113)</visible>
                            <posx>-40</posx>
                            <posy>-40</posy>
                            <width>360</width>
                            <height>360</height>
                            <texture border="42">script.plex/drop-shadow.png</texture>
                        </control>
                        <control type="group">
                            <posx>5</posx>
                            <posy>5</posy>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>270</width>
                                <height>270</height>
                                <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>270</width>
                                <height>270</height>
                                <texture background="true">$INFO[ListItem.Thumb]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="label">
                                <scroll>false</scroll>
                                <posx>0</posx>
                                <posy>280</posy>
                                <width>270</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <aligny>center</aligny>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label]</label>
                            </control>
                        </control>
                        <control type="image">
                            <visible>Control.HasFocus(2113)</visible>
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>280</width>
                            <height>280</height>
                            <texture border="10">script.plex/home/selected.png</texture>
                        </control>
                    </control>
                </control>
            </focusedlayout>
        </control>
    </control>

    <control type="group" id="2014">
        <visible>Integer.IsGreater(Container(2114).NumItems,0) + String.IsEmpty(Window.Property(drawing))</visible>
        <width>1356</width>
        <height>320</height>
        <control type="image">
            <posx>60</posx>
            <posy>0</posy>
            <width>1236</width>
            <height>2</height>
            <texture>script.plex/white-square.png</texture>
            <colordiffuse>FF282828</colordiffuse>
        </control>
        <control type="label">
            <scroll>false</scroll>
            <posx>60</posx>
            <posy>0</posy>
            <width>1000</width>
            <height>87</height>
            <font>font12</font>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <label>[UPPERCASE]$INFO[Window.Property(hub.2114)][/UPPERCASE]</label>
        </control>
        <control type="list" id="2114">
            <posx>0</posx>
            <posy>30</posy>
            <width>1356</width>
            <height>440</height>
            <onleft>899</onleft>
            <onup>2113</onup>
            <ondown>2115</ondown>
            <scrolltime>200</scrolltime>
            <orientation>horizontal</orientation>
            <preloaditems>4</preloaditems>
            <!-- ITEM LAYOUT ########################################## -->
            <itemlayout width="360">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <posx>5</posx>
                        <posy>5</posy>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>300</width>
                            <height>169</height>
                            <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>300</width>
                            <height>169</height>
                            <texture background="true">$INFO[ListItem.Thumb]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="label">
                            <scroll>false</scroll>
                            <posx>0</posx>
                            <posy>179</posy>
                            <width>300</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <aligny>center</aligny>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label]</label>
                        </control>
                    </control>
                </control>
            </itemlayout>

            <!-- FOCUSED LAYOUT ####################################### -->
            <focusedlayout width="360">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <animation effect="zoom" start="100" end="110" time="100" center="155,89.5" reversible="false">Focus</animation>
                        <animation effect="zoom" start="110" end="100" time="100" center="155,89.5" reversible="false">UnFocus</animation>
                        <posx>0</posx>
                        <posy>0</posy>
                        <control type="image">
                            <visible>Control.HasFocus(2114)</visible>
                            <posx>-40</posx>
                            <posy>-40</posy>
                            <width>390</width>
                            <height>259</height>
                            <texture border="42">script.plex/drop-shadow.png</texture>
                        </control>
                        <control type="group">
                            <posx>5</posx>
                            <posy>5</posy>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>300</width>
                                <height>169</height>
                                <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>300</width>
                                <height>169</height>
                                <texture background="true">$INFO[ListItem.Thumb]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="label">
                                <scroll>false</scroll>
                                <posx>0</posx>
                                <posy>179</posy>
                                <width>300</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <aligny>center</aligny>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label]</label>
                            </control>
                        </control>
                        <control type="image">
                            <visible>Control.HasFocus(2114)</visible>
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>310</width>
                            <height>179</height>
                            <texture border="10">script.plex/home/selected.png</texture>
                        </control>
                    </control>
                </control>
            </focusedlayout>
        </control>
    </control>

    <control type="group" id="2015">
        <visible>Integer.IsGreater(Container(2115).NumItems,0) + String.IsEmpty(Window.Property(drawing))</visible>
        <width>1356</width>
        <height>420</height>
        <control type="image">
            <posx>60</posx>
            <posy>0</posy>
            <width>1236</width>
            <height>2</height>
            <texture>script.plex/white-square.png</texture>
            <colordiffuse>FF282828</colordiffuse>
        </control>
        <control type="label">
            <scroll>false</scroll>
            <posx>60</posx>
            <posy>0</posy>
            <width>1000</width>
            <height>87</height>
            <font>font12</font>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <label>[UPPERCASE]$INFO[Window.Property(hub.2115)][/UPPERCASE]</label>
        </control>
        <control type="list" id="2115">
            <posx>0</posx>
            <posy>30</posy>
            <width>1356</width>
            <height>440</height>
            <onleft>899</onleft>
            <onup>2114</onup>
            <ondown>2116</ondown>
            <scrolltime>200</scrolltime>
            <orientation>horizontal</orientation>
            <preloaditems>4</preloaditems>
            <!-- ITEM LAYOUT ########################################## -->
            <itemlayout width="304">
                <control type="group">
                   <posx>55</posx>
                    <posy>61</posy>
                    <control type="group">
                        <posx>5</posx>
                        <posy>5</posy>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>244</width>
                            <height>244</height>
                            <texture diffuse="script.plex/masks/role.png">$INFO[ListItem.Property(thumb.fallback)]</texture>
                        </control>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>244</width>
                            <height>244</height>
                            <texture background="true" diffuse="script.plex/masks/role.png">$INFO[ListItem.Thumb]</texture>
                            <aspectratio scalediffuse="false" aligny="top">scale</aspectratio>
                        </control>
                        <control type="label">
                            <scroll>false</scroll>
                            <posx>0</posx>
                            <posy>254</posy>
                            <width>244</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label]</label>
                        </control>
                        <control type="label">
                            <posx>0</posx>
                            <posy>282</posy>
                            <width>244</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label2]</label>
                        </control>
                    </control>
                </control>
            </itemlayout>

            <!-- FOCUSED LAYOUT ####################################### -->
            <focusedlayout width="304">
                <control type="group">
                    <posx>55</posx>
                    <posy>61</posy>
                    <control type="group">
                        <animation effect="zoom" start="100" end="110" time="100" center="127,127" reversible="false">Focus</animation>
                        <animation effect="zoom" start="110" end="100" time="100" center="127,127" reversible="false">UnFocus</animation>
                        <posx>0</posx>
                        <posy>0</posy>
                        <control type="image">
                            <visible>Control.HasFocus(2115)</visible>
                            <posx>-40</posx>
                            <posy>-40</posy>
                            <width>334</width>
                            <height>334</height>
                            <texture border="42">script.plex/buttons/role-shadow.png</texture>
                        </control>
                        <control type="group">
                            <posx>5</posx>
                            <posy>5</posy>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>244</width>
                                <height>244</height>
                                <texture diffuse="script.plex/masks/role.png">$INFO[ListItem.Property(thumb.fallback)]</texture>
                            </control>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>244</width>
                                <height>244</height>
                                <texture background="true" diffuse="script.plex/masks/role.png">$INFO[ListItem.Thumb]</texture>
                                <aspectratio scalediffuse="false" aligny="top">scale</aspectratio>
                            </control>
                            <control type="label">
                                <scroll>false</scroll>
                                <posx>0</posx>
                                <posy>254</posy>
                                <width>244</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label]</label>
                            </control>
                            <control type="label">
                                <posx>0</posx>
                                <posy>282</posy>
                                <width>244</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label2]</label>
                            </control>
                        </control>
                        <control type="image">
                            <visible>Control.HasFocus(2115)</visible>
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>254</width>
                            <height>254</height>
                            <texture>script.plex/buttons/role-selected.png</texture>
                        </control>
                    </control>
                </control>
            </focusedlayout>
        </control>
    </control>

    <control type="group" id="2016">
        <visible>Integer.IsGreater(Container(2116).NumItems,0) + String.IsEmpty(Window.Property(drawing))</visible>
        <width>1356</width>
        <height>420</height>
        <control type="image">
            <posx>60</posx>
            <posy>0</posy>
            <width>1236</width>
            <height>2</height>
            <texture>script.plex/white-square.png</texture>
            <colordiffuse>FF282828</colordiffuse>
        </control>
        <control type="label">
            <scroll>false</scroll>
            <posx>60</posx>
            <posy>0</posy>
            <width>1000</width>
            <height>87</height>
            <font>font12</font>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <label>[UPPERCASE]$INFO[Window.Property(hub.2116)][/UPPERCASE]</label>
        </control>
        <control type="list" id="2116">
            <posx>0</posx>
            <posy>30</posy>
            <width>1356</width>
            <height>440</height>
            <onleft>899</onleft>
            <onup>2115</onup>
            <ondown>2117</ondown>
            <scrolltime>200</scrolltime>
            <orientation>horizontal</orientation>
            <preloaditems>4</preloaditems>
            <!-- ITEM LAYOUT ########################################## -->
            <itemlayout width="240">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <posx>5</posx>
                        <posy>5</posy>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>180</width>
                            <height>270</height>
                            <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>180</width>
                            <height>270</height>
                            <texture background="true">$INFO[ListItem.Thumb]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="label">
                            <scroll>false</scroll>
                            <posx>0</posx>
                            <posy>280</posy>
                            <width>180</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <aligny>center</aligny>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label]</label>
                        </control>
                    </control>
                </control>
            </itemlayout>

            <!-- FOCUSED LAYOUT ####################################### -->
            <focusedlayout width="240">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <animation effect="zoom" start="100" end="110" time="100" center="95,140" reversible="false">Focus</animation>
                        <animation effect="zoom" start="110" end="100" time="100" center="95,140" reversible="false">UnFocus</animation>
                        <posx>0</posx>
                        <posy>0</posy>
                        <control type="image">
                            <visible>Control.HasFocus(2116)</visible>
                            <posx>-40</posx>
                            <posy>-40</posy>
                            <width>270</width>
                            <height>360</height>
                            <texture border="42">script.plex/drop-shadow.png</texture>
                        </control>
                        <control type="group">
                            <posx>5</posx>
                            <posy>5</posy>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>180</width>
                                <height>270</height>
                                <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>180</width>
                                <height>270</height>
                                <texture background="true">$INFO[ListItem.Thumb]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="label">
                                <scroll>false</scroll>
                                <posx>0</posx>
                                <posy>280</posy>
                                <width>180</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <aligny>center</aligny>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label]</label>
                            </control>
                        </control>
                        <control type="image">
                            <visible>Control.HasFocus(2116)</visible>
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>190</width>
                            <height>280</height>
                            <texture border="10">script.plex/home/selected.png</texture>
                        </control>
                    </control>
                </control>
            </focusedlayout>
        </control>
    </control>

    <control type="group" id="2017">
        <visible>Integer.IsGreater(Container(2117).NumItems,0) + String.IsEmpty(Window.Property(drawing))</visible>
        <width>1356</width>
        <height>420</height>
        <control type="image">
            <posx>60</posx>
            <posy>0</posy>
            <width>1236</width>
            <height>2</height>
            <texture>script.plex/white-square.png</texture>
            <colordiffuse>FF282828</colordiffuse>
        </control>
        <control type="label">
            <scroll>false</scroll>
            <posx>60</posx>
            <posy>0</posy>
            <width>1000</width>
            <height>87</height>
            <font>font12</font>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <label>[UPPERCASE]$INFO[Window.Property(hub.2117)][/UPPERCASE]</label>
        </control>
        <control type="list" id="2117">
            <posx>0</posx>
            <posy>30</posy>
            <width>1356</width>
            <height>440</height>
            <onleft>899</onleft>
            <onup>2116</onup>
            <ondown>2118</ondown>
            <scrolltime>200</scrolltime>
            <orientation>horizontal</orientation>
            <preloaditems>4</preloaditems>
            <!-- ITEM LAYOUT ########################################## -->
            <itemlayout width="330">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <posx>5</posx>
                        <posy>5</posy>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>270</width>
                            <height>270</height>
                            <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>270</width>
                            <height>270</height>
                            <texture background="true">$INFO[ListItem.Thumb]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="label">
                            <scroll>false</scroll>
                            <posx>0</posx>
                            <posy>280</posy>
                            <width>270</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <aligny>center</aligny>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label]</label>
                        </control>
                    </control>
                </control>
            </itemlayout>

            <!-- FOCUSED LAYOUT ####################################### -->
            <focusedlayout width="330">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <animation effect="zoom" start="100" end="110" time="100" center="140,140" reversible="false">Focus</animation>
                        <animation effect="zoom" start="110" end="100" time="100" center="140,140" reversible="false">UnFocus</animation>
                        <posx>0</posx>
                        <posy>0</posy>
                        <control type="image">
                            <visible>Control.HasFocus(2117)</visible>
                            <posx>-40</posx>
                            <posy>-40</posy>
                            <width>360</width>
                            <height>360</height>
                            <texture border="42">script.plex/drop-shadow.png</texture>
                        </control>
                        <control type="group">
                            <posx>5</posx>
                            <posy>5</posy>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>270</width>
                                <height>270</height>
                                <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>270</width>
                                <height>270</height>
                                <texture background="true">$INFO[ListItem.Thumb]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="label">
                                <scroll>false</scroll>
                                <posx>0</posx>
                                <posy>280</posy>
                                <width>270</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <aligny>center</aligny>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label]</label>
                            </control>
                        </control>
                        <control type="image">
                            <visible>Control.HasFocus(2117)</visible>
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>280</width>
                            <height>280</height>
                            <texture border="10">script.plex/home/selected.png</texture>
                        </control>
                    </control>
                </control>
            </focusedlayout>
        </control>
    </control>

    <control type="group" id="2018">
        <visible>Integer.IsGreater(Container(2118).NumItems,0) + String.IsEmpty(Window.Property(drawing))</visible>
        <width>1356</width>
        <height>320</height>
        <control type="image">
            <posx>60</posx>
            <posy>0</posy>
            <width>1236</width>
            <height>2</height>
            <texture>script.plex/white-square.png</texture>
            <colordiffuse>FF282828</colordiffuse>
        </control>
        <control type="label">
            <scroll>false</scroll>
            <posx>60</posx>
            <posy>0</posy>
            <width>1000</width>
            <height>87</height>
            <font>font12</font>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <label>[UPPERCASE]$INFO[Window.Property(hub.2118)][/UPPERCASE]</label>
        </control>
        <control type="list" id="2118">
            <posx>0</posx>
            <posy>30</posy>
            <width>1356</width>
            <height>440</height>
            <onleft>899</onleft>
            <onup>2117</onup>
            <ondown>2119</ondown>
            <scrolltime>200</scrolltime>
            <orientation>horizontal</orientation>
            <preloaditems>4</preloaditems>
            <!-- ITEM LAYOUT ########################################## -->
            <itemlayout width="360">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <posx>5</posx>
                        <posy>5</posy>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>300</width>
                            <height>169</height>
                            <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>300</width>
                            <height>169</height>
                            <texture background="true">$INFO[ListItem.Thumb]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="label">
                            <scroll>false</scroll>
                            <posx>0</posx>
                            <posy>179</posy>
                            <width>300</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <aligny>center</aligny>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label]</label>
                        </control>
                    </control>
                </control>
            </itemlayout>

            <!-- FOCUSED LAYOUT ####################################### -->
            <focusedlayout width="360">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <animation effect="zoom" start="100" end="110" time="100" center="155,89.5" reversible="false">Focus</animation>
                        <animation effect="zoom" start="110" end="100" time="100" center="155,89.5" reversible="false">UnFocus</animation>
                        <posx>0</posx>
                        <posy>0</posy>
                        <control type="image">
                            <visible>Control.HasFocus(2118)</visible>
                            <posx>-40</posx>
                            <posy>-40</posy>
                            <width>390</width>
                            <height>259</height>
                            <texture border="42">script.plex/drop-shadow.png</texture>
                        </control>
                        <control type="group">
                            <posx>5</posx>
                            <posy>5</posy>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>300</width>
                                <height>169</height>
                                <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>300</width>
                                <height>169</height>
                                <texture background="true">$INFO[ListItem.Thumb]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="label">
                                <scroll>false</scroll>
                                <posx>0</posx>
                                <posy>179</posy>
                                <width>300</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <aligny>center</aligny>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label]</label>
                            </control>
                        </control>
                        <control type="image">
                            <visible>Control.HasFocus(2118)</visible>
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>310</width>
                            <height>179</height>
                            <texture border="10">script.plex/home/selected.png</texture>
                        </control>
                    </control>
                </control>
            </focusedlayout>
        </control>
    </control>

    <control type="group" id="2019">
        <visible>Integer.IsGreater(Container(2119).NumItems,0) + String.IsEmpty(Window.Property(drawing))</visible>
        <width>1356</width>
        <height>420</height>
        <control type="image">
            <posx>60</posx>
            <posy>0</posy>
            <width>1236</width>
            <height>2</height>
            <texture>script.plex/white-square.png</texture>
            <colordiffuse>FF282828</colordiffuse>
        </control>
        <control type="label">
            <scroll>false</scroll>
            <posx>60</posx>
            <posy>0</posy>
            <width>1000</width>
            <height>87</height>
            <font>font12</font>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <label>[UPPERCASE]$INFO[Window.Property(hub.2119)][/UPPERCASE]</label>
        </control>
        <control type="list" id="2119">
            <posx>0</posx>
            <posy>30</posy>
            <width>1356</width>
            <height>440</height>
            <onleft>899</onleft>
            <onup>2118</onup>
            <ondown>2120</ondown>
            <scrolltime>200</scrolltime>
            <orientation>horizontal</orientation>
            <preloaditems>4</preloaditems>
            <!-- ITEM LAYOUT ########################################## -->
            <itemlayout width="304">
                <control type="group">
                   <posx>55</posx>
                    <posy>61</posy>
                    <control type="group">
                        <posx>5</posx>
                        <posy>5</posy>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>244</width>
                            <height>244</height>
                            <texture diffuse="script.plex/masks/role.png">$INFO[ListItem.Property(thumb.fallback)]</texture>
                        </control>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>244</width>
                            <height>244</height>
                            <texture background="true" diffuse="script.plex/masks/role.png">$INFO[ListItem.Thumb]</texture>
                            <aspectratio scalediffuse="false" aligny="top">scale</aspectratio>
                        </control>
                        <control type="label">
                            <scroll>false</scroll>
                            <posx>0</posx>
                            <posy>254</posy>
                            <width>244</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label]</label>
                        </control>
                        <control type="label">
                            <posx>0</posx>
                            <posy>282</posy>
                            <width>244</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label2]</label>
                        </control>
                    </control>
                </control>
            </itemlayout>

            <!-- FOCUSED LAYOUT ####################################### -->
            <focusedlayout width="304">
                <control type="group">
                    <posx>55</posx>
                    <posy>61</posy>
                    <control type="group">
                        <animation effect="zoom" start="100" end="110" time="100" center="127,127" reversible="false">Focus</animation>
                        <animation effect="zoom" start="110" end="100" time="100" center="127,127" reversible="false">UnFocus</animation>
                        <posx>0</posx>
                        <posy>0</posy>
                        <control type="image">
                            <visible>Control.HasFocus(2119)</visible>
                            <posx>-40</posx>
                            <posy>-40</posy>
                            <width>334</width>
                            <height>334</height>
                            <texture border="42">script.plex/buttons/role-shadow.png</texture>
                        </control>
                        <control type="group">
                            <posx>5</posx>
                            <posy>5</posy>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>244</width>
                                <height>244</height>
                                <texture diffuse="script.plex/masks/role.png">$INFO[ListItem.Property(thumb.fallback)]</texture>
                            </control>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>244</width>
                                <height>244</height>
                                <texture background="true" diffuse="script.plex/masks/role.png">$INFO[ListItem.Thumb]</texture>
                                <aspectratio scalediffuse="false" aligny="top">scale</aspectratio>
                            </control>
                            <control type="label">
                                <scroll>false</scroll>
                                <posx>0</posx>
                                <posy>254</posy>
                                <width>244</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label]</label>
                            </control>
                            <control type="label">
                                <posx>0</posx>
                                <posy>282</posy>
                                <width>244</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label2]</label>
                            </control>
                        </control>
                        <control type="image">
                            <visible>Control.HasFocus(2119)</visible>
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>254</width>
                            <height>254</height>
                            <texture>script.plex/buttons/role-selected.png</texture>
                        </control>
                    </control>
                </control>
            </focusedlayout>
        </control>
    </control>

    <control type="group" id="2020">
        <visible>Integer.IsGreater(Container(2120).NumItems,0) + String.IsEmpty(Window.Property(drawing))</visible>
        <width>1356</width>
        <height>420</height>
        <control type="image">
            <posx>60</posx>
            <posy>0</posy>
            <width>1236</width>
            <height>2</height>
            <texture>script.plex/white-square.png</texture>
            <colordiffuse>FF282828</colordiffuse>
        </control>
        <control type="label">
            <scroll>false</scroll>
            <posx>60</posx>
            <posy>0</posy>
            <width>1000</width>
            <height>87</height>
            <font>font12</font>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <label>[UPPERCASE]$INFO[Window.Property(hub.2120)][/UPPERCASE]</label>
        </control>
        <control type="list" id="2120">
            <posx>0</posx>
            <posy>30</posy>
            <width>1356</width>
            <height>440</height>
            <onleft>899</onleft>
            <onup>2119</onup>
            <ondown>2121</ondown>
            <scrolltime>200</scrolltime>
            <orientation>horizontal</orientation>
            <preloaditems>4</preloaditems>
            <!-- ITEM LAYOUT ########################################## -->
            <itemlayout width="240">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <posx>5</posx>
                        <posy>5</posy>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>180</width>
                            <height>270</height>
                            <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>180</width>
                            <height>270</height>
                            <texture background="true">$INFO[ListItem.Thumb]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="label">
                            <scroll>false</scroll>
                            <posx>0</posx>
                            <posy>280</posy>
                            <width>180</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <aligny>center</aligny>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label]</label>
                        </control>
                    </control>
                </control>
            </itemlayout>

            <!-- FOCUSED LAYOUT ####################################### -->
            <focusedlayout width="240">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <animation effect="zoom" start="100" end="110" time="100" center="95,140" reversible="false">Focus</animation>
                        <animation effect="zoom" start="110" end="100" time="100" center="95,140" reversible="false">UnFocus</animation>
                        <posx>0</posx>
                        <posy>0</posy>
                        <control type="image">
                            <visible>Control.HasFocus(2120)</visible>
                            <posx>-40</posx>
                            <posy>-40</posy>
                            <width>270</width>
                            <height>360</height>
                            <texture border="42">script.plex/drop-shadow.png</texture>
                        </control>
                        <control type="group">
                            <posx>5</posx>
                            <posy>5</posy>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>180</width>
                                <height>270</height>
                                <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>180</width>
                                <height>270</height>
                                <texture background="true">$INFO[ListItem.Thumb]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="label">
                                <scroll>false</scroll>
                                <posx>0</posx>
                                <posy>280</posy>
                                <width>180</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <aligny>center</aligny>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label]</label>
                            </control>
                        </control>
                        <control type="image">
                            <visible>Control.HasFocus(2120)</visible>
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>190</width>
                            <height>280</height>
                            <texture border="10">script.plex/home/selected.png</texture>
                        </control>
                    </control>
                </control>
            </focusedlayout>
        </control>
    </control>

    <control type="group" id="2021">
        <visible>Integer.IsGreater(Container(2121).NumItems,0) + String.IsEmpty(Window.Property(drawing))</visible>
        <width>1356</width>
        <height>420</height>
        <control type="image">
            <posx>60</posx>
            <posy>0</posy>
            <width>1236</width>
            <height>2</height>
            <texture>script.plex/white-square.png</texture>
            <colordiffuse>FF282828</colordiffuse>
        </control>
        <control type="label">
            <scroll>false</scroll>
            <posx>60</posx>
            <posy>0</posy>
            <width>1000</width>
            <height>87</height>
            <font>font12</font>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <label>[UPPERCASE]$INFO[Window.Property(hub.2121)][/UPPERCASE]</label>
        </control>
        <control type="list" id="2121">
            <posx>0</posx>
            <posy>30</posy>
            <width>1356</width>
            <height>440</height>
            <onleft>899</onleft>
            <onup>2120</onup>
            <ondown>2122</ondown>
            <scrolltime>200</scrolltime>
            <orientation>horizontal</orientation>
            <preloaditems>4</preloaditems>
            <!-- ITEM LAYOUT ########################################## -->
            <itemlayout width="330">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <posx>5</posx>
                        <posy>5</posy>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>270</width>
                            <height>270</height>
                            <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>270</width>
                            <height>270</height>
                            <texture background="true">$INFO[ListItem.Thumb]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="label">
                            <scroll>false</scroll>
                            <posx>0</posx>
                            <posy>280</posy>
                            <width>270</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <aligny>center</aligny>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label]</label>
                        </control>
                    </control>
                </control>
            </itemlayout>

            <!-- FOCUSED LAYOUT ####################################### -->
            <focusedlayout width="330">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <animation effect="zoom" start="100" end="110" time="100" center="140,140" reversible="false">Focus</animation>
                        <animation effect="zoom" start="110" end="100" time="100" center="140,140" reversible="false">UnFocus</animation>
                        <posx>0</posx>
                        <posy>0</posy>
                        <control type="image">
                            <visible>Control.HasFocus(2121)</visible>
                            <posx>-40</posx>
                            <posy>-40</posy>
                            <width>360</width>
                            <height>360</height>
                            <texture border="42">script.plex/drop-shadow.png</texture>
                        </control>
                        <control type="group">
                            <posx>5</posx>
                            <posy>5</posy>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>270</width>
                                <height>270</height>
                                <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>270</width>
                                <height>270</height>
                                <texture background="true">$INFO[ListItem.Thumb]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="label">
                                <scroll>false</scroll>
                                <posx>0</posx>
                                <posy>280</posy>
                                <width>270</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <aligny>center</aligny>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label]</label>
                            </control>
                        </control>
                        <control type="image">
                            <visible>Control.HasFocus(2121)</visible>
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>280</width>
                            <height>280</height>
                            <texture border="10">script.plex/home/selected.png</texture>
                        </control>
                    </control>
                </control>
            </focusedlayout>
        </control>
    </control>

    <control type="group" id="2022">
        <visible>Integer.IsGreater(Container(2122).NumItems,0) + String.IsEmpty(Window.Property(drawing))</visible>
        <width>1356</width>
        <height>320</height>
        <control type="image">
            <posx>60</posx>
            <posy>0</posy>
            <width>1236</width>
            <height>2</height>
            <texture>script.plex/white-square.png</texture>
            <colordiffuse>FF282828</colordiffuse>
        </control>
        <control type="label">
            <scroll>false</scroll>
            <posx>60</posx>
            <posy>0</posy>
            <width>1000</width>
            <height>87</height>
            <font>font12</font>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <label>[UPPERCASE]$INFO[Window.Property(hub.2122)][/UPPERCASE]</label>
        </control>
        <control type="list" id="2122">
            <posx>0</posx>
            <posy>30</posy>
            <width>1356</width>
            <height>440</height>
            <onleft>899</onleft>
            <onup>2121</onup>
            <ondown>2123</ondown>
            <scrolltime>200</scrolltime>
            <orientation>horizontal</orientation>
            <preloaditems>4</preloaditems>
            <!-- ITEM LAYOUT ########################################## -->
            <itemlayout width="360">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <posx>5</posx>
                        <posy>5</posy>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>300</width>
                            <height>169</height>
                            <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>300</width>
                            <height>169</height>
                            <texture background="true">$INFO[ListItem.Thumb]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="label">
                            <scroll>false</scroll>
                            <posx>0</posx>
                            <posy>179</posy>
                            <width>300</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <aligny>center</aligny>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label]</label>
                        </control>
                    </control>
                </control>
            </itemlayout>

            <!-- FOCUSED LAYOUT ####################################### -->
            <focusedlayout width="360">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <animation effect="zoom" start="100" end="110" time="100" center="155,89.5" reversible="false">Focus</animation>
                        <animation effect="zoom" start="110" end="100" time="100" center="155,89.5" reversible="false">UnFocus</animation>
                        <posx>0</posx>
                        <posy>0</posy>
                        <control type="image">
                            <visible>Control.HasFocus(2122)</visible>
                            <posx>-40</posx>
                            <posy>-40</posy>
                            <width>390</width>
                            <height>259</height>
                            <texture border="42">script.plex/drop-shadow.png</texture>
                        </control>
                        <control type="group">
                            <posx>5</posx>
                            <posy>5</posy>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>300</width>
                                <height>169</height>
                                <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>300</width>
                                <height>169</height>
                                <texture background="true">$INFO[ListItem.Thumb]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="label">
                                <scroll>false</scroll>
                                <posx>0</posx>
                                <posy>179</posy>
                                <width>300</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <aligny>center</aligny>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label]</label>
                            </control>
                        </control>
                        <control type="image">
                            <visible>Control.HasFocus(2122)</visible>
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>310</width>
                            <height>179</height>
                            <texture border="10">script.plex/home/selected.png</texture>
                        </control>
                    </control>
                </control>
            </focusedlayout>
        </control>
    </control>

    <control type="group" id="2023">
        <visible>Integer.IsGreater(Container(2123).NumItems,0) + String.IsEmpty(Window.Property(drawing))</visible>
        <width>1356</width>
        <height>420</height>
        <control type="image">
            <posx>60</posx>
            <posy>0</posy>
            <width>1236</width>
            <height>2</height>
            <texture>script.plex/white-square.png</texture>
            <colordiffuse>FF282828</colordiffuse>
        </control>
        <control type="label">
            <scroll>false</scroll>
            <posx>60</posx>
            <posy>0</posy>
            <width>1000</width>
            <height>87</height>
            <font>font12</font>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <label>[UPPERCASE]$INFO[Window.Property(hub.2123)][/UPPERCASE]</label>
        </control>
        <control type="list" id="2123">
            <posx>0</posx>
            <posy>30</posy>
            <width>1356</width>
            <height>440</height>
            <onleft>899</onleft>
            <onup>2122</onup>
            <ondown>2124</ondown>
            <scrolltime>200</scrolltime>
            <orientation>horizontal</orientation>
            <preloaditems>4</preloaditems>
            <!-- ITEM LAYOUT ########################################## -->
            <itemlayout width="304">
                <control type="group">
                   <posx>55</posx>
                    <posy>61</posy>
                    <control type="group">
                        <posx>5</posx>
                        <posy>5</posy>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>244</width>
                            <height>244</height>
                            <texture diffuse="script.plex/masks/role.png">$INFO[ListItem.Property(thumb.fallback)]</texture>
                        </control>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>244</width>
                            <height>244</height>
                            <texture background="true" diffuse="script.plex/masks/role.png">$INFO[ListItem.Thumb]</texture>
                            <aspectratio scalediffuse="false" aligny="top">scale</aspectratio>
                        </control>
                        <control type="label">
                            <scroll>false</scroll>
                            <posx>0</posx>
                            <posy>254</posy>
                            <width>244</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label]</label>
                        </control>
                        <control type="label">
                            <posx>0</posx>
                            <posy>282</posy>
                            <width>244</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label2]</label>
                        </control>
                    </control>
                </control>
            </itemlayout>

            <!-- FOCUSED LAYOUT ####################################### -->
            <focusedlayout width="304">
                <control type="group">
                    <posx>55</posx>
                    <posy>61</posy>
                    <control type="group">
                        <animation effect="zoom" start="100" end="110" time="100" center="127,127" reversible="false">Focus</animation>
                        <animation effect="zoom" start="110" end="100" time="100" center="127,127" reversible="false">UnFocus</animation>
                        <posx>0</posx>
                        <posy>0</posy>
                        <control type="image">
                            <visible>Control.HasFocus(2123)</visible>
                            <posx>-40</posx>
                            <posy>-40</posy>
                            <width>334</width>
                            <height>334</height>
                            <texture border="42">script.plex/buttons/role-shadow.png</texture>
                        </control>
                        <control type="group">
                            <posx>5</posx>
                            <posy>5</posy>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>244</width>
                                <height>244</height>
                                <texture diffuse="script.plex/masks/role.png">$INFO[ListItem.Property(thumb.fallback)]</texture>
                            </control>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>244</width>
                                <height>244</height>
                                <texture background="true" diffuse="script.plex/masks/role.png">$INFO[ListItem.Thumb]</texture>
                                <aspectratio scalediffuse="false" aligny="top">scale</aspectratio>
                            </control>
                            <control type="label">
                                <scroll>false</scroll>
                                <posx>0</posx>
                                <posy>254</posy>
                                <width>244</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label]</label>
                            </control>
                            <control type="label">
                                <posx>0</posx>
                                <posy>282</posy>
                                <width>244</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label2]</label>
                            </control>
                        </control>
                        <control type="image">
                            <visible>Control.HasFocus(2123)</visible>
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>254</width>
                            <height>254</height>
                            <texture>script.plex/buttons/role-selected.png</texture>
                        </control>
                    </control>
                </control>
            </focusedlayout>
        </control>
    </control>

    <control type="group" id="2024">
        <visible>Integer.IsGreater(Container(2124).NumItems,0) + String.IsEmpty(Window.Property(drawing))</visible>
        <width>1356</width>
        <height>420</height>
        <control type="image">
            <posx>60</posx>
            <posy>0</posy>
            <width>1236</width>
            <height>2</height>
            <texture>script.plex/white-square.png</texture>
            <colordiffuse>FF282828</colordiffuse>
        </control>
        <control type="label">
            <scroll>false</scroll>
            <posx>60</posx>
            <posy>0</posy>
            <width>1000</width>
            <height>87</height>
            <font>font12</font>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <label>[UPPERCASE]$INFO[Window.Property(hub.2124)][/UPPERCASE]</label>
        </control>
        <control type="list" id="2124">
            <posx>0</posx>
            <posy>30</posy>
            <width>1356</width>
            <height>440</height>
            <onleft>899</onleft>
            <onup>2123</onup>
            <ondown>2125</ondown>
            <scrolltime>200</scrolltime>
            <orientation>horizontal</orientation>
            <preloaditems>4</preloaditems>
            <!-- ITEM LAYOUT ########################################## -->
            <itemlayout width="240">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <posx>5</posx>
                        <posy>5</posy>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>180</width>
                            <height>270</height>
                            <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>180</width>
                            <height>270</height>
                            <texture background="true">$INFO[ListItem.Thumb]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="label">
                            <scroll>false</scroll>
                            <posx>0</posx>
                            <posy>280</posy>
                            <width>180</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <aligny>center</aligny>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label]</label>
                        </control>
                    </control>
                </control>
            </itemlayout>

            <!-- FOCUSED LAYOUT ####################################### -->
            <focusedlayout width="240">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <animation effect="zoom" start="100" end="110" time="100" center="95,140" reversible="false">Focus</animation>
                        <animation effect="zoom" start="110" end="100" time="100" center="95,140" reversible="false">UnFocus</animation>
                        <posx>0</posx>
                        <posy>0</posy>
                        <control type="image">
                            <visible>Control.HasFocus(2124)</visible>
                            <posx>-40</posx>
                            <posy>-40</posy>
                            <width>270</width>
                            <height>360</height>
                            <texture border="42">script.plex/drop-shadow.png</texture>
                        </control>
                        <control type="group">
                            <posx>5</posx>
                            <posy>5</posy>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>180</width>
                                <height>270</height>
                                <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>180</width>
                                <height>270</height>
                                <texture background="true">$INFO[ListItem.Thumb]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="label">
                                <scroll>false</scroll>
                                <posx>0</posx>
                                <posy>280</posy>
                                <width>180</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <aligny>center</aligny>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label]</label>
                            </control>
                        </control>
                        <control type="image">
                            <visible>Control.HasFocus(2124)</visible>
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>190</width>
                            <height>280</height>
                            <texture border="10">script.plex/home/selected.png</texture>
                        </control>
                    </control>
                </control>
            </focusedlayout>
        </control>
    </control>

    <control type="group" id="2025">
        <visible>Integer.IsGreater(Container(2125).NumItems,0) + String.IsEmpty(Window.Property(drawing))</visible>
        <width>1356</width>
        <height>420</height>
        <control type="image">
            <posx>60</posx>
            <posy>0</posy>
            <width>1236</width>
            <height>2</height>
            <texture>script.plex/white-square.png</texture>
            <colordiffuse>FF282828</colordiffuse>
        </control>
        <control type="label">
            <scroll>false</scroll>
            <posx>60</posx>
            <posy>0</posy>
            <width>1000</width>
            <height>87</height>
            <font>font12</font>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <label>[UPPERCASE]$INFO[Window.Property(hub.2125)][/UPPERCASE]</label>
        </control>
        <control type="list" id="2125">
            <posx>0</posx>
            <posy>30</posy>
            <width>1356</width>
            <height>440</height>
            <onleft>899</onleft>
            <onup>2124</onup>
            <ondown>2126</ondown>
            <scrolltime>200</scrolltime>
            <orientation>horizontal</orientation>
            <preloaditems>4</preloaditems>
            <!-- ITEM LAYOUT ########################################## -->
            <itemlayout width="330">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <posx>5</posx>
                        <posy>5</posy>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>270</width>
                            <height>270</height>
                            <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>270</width>
                            <height>270</height>
                            <texture background="true">$INFO[ListItem.Thumb]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="label">
                            <scroll>false</scroll>
                            <posx>0</posx>
                            <posy>280</posy>
                            <width>270</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <aligny>center</aligny>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label]</label>
                        </control>
                    </control>
                </control>
            </itemlayout>

            <!-- FOCUSED LAYOUT ####################################### -->
            <focusedlayout width="330">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <animation effect="zoom" start="100" end="110" time="100" center="140,140" reversible="false">Focus</animation>
                        <animation effect="zoom" start="110" end="100" time="100" center="140,140" reversible="false">UnFocus</animation>
                        <posx>0</posx>
                        <posy>0</posy>
                        <control type="image">
                            <visible>Control.HasFocus(2125)</visible>
                            <posx>-40</posx>
                            <posy>-40</posy>
                            <width>360</width>
                            <height>360</height>
                            <texture border="42">script.plex/drop-shadow.png</texture>
                        </control>
                        <control type="group">
                            <posx>5</posx>
                            <posy>5</posy>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>270</width>
                                <height>270</height>
                                <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>270</width>
                                <height>270</height>
                                <texture background="true">$INFO[ListItem.Thumb]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="label">
                                <scroll>false</scroll>
                                <posx>0</posx>
                                <posy>280</posy>
                                <width>270</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <aligny>center</aligny>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label]</label>
                            </control>
                        </control>
                        <control type="image">
                            <visible>Control.HasFocus(2125)</visible>
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>280</width>
                            <height>280</height>
                            <texture border="10">script.plex/home/selected.png</texture>
                        </control>
                    </control>
                </control>
            </focusedlayout>
        </control>
    </control>

    <control type="group" id="2026">
        <visible>Integer.IsGreater(Container(2126).NumItems,0) + String.IsEmpty(Window.Property(drawing))</visible>
        <width>1356</width>
        <height>320</height>
        <control type="image">
            <posx>60</posx>
            <posy>0</posy>
            <width>1236</width>
            <height>2</height>
            <texture>script.plex/white-square.png</texture>
            <colordiffuse>FF282828</colordiffuse>
        </control>
        <control type="label">
            <scroll>false</scroll>
            <posx>60</posx>
            <posy>0</posy>
            <width>1000</width>
            <height>87</height>
            <font>font12</font>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <label>[UPPERCASE]$INFO[Window.Property(hub.2126)][/UPPERCASE]</label>
        </control>
        <control type="list" id="2126">
            <posx>0</posx>
            <posy>30</posy>
            <width>1356</width>
            <height>440</height>
            <onleft>899</onleft>
            <onup>2125</onup>
            <ondown>2127</ondown>
            <scrolltime>200</scrolltime>
            <orientation>horizontal</orientation>
            <preloaditems>4</preloaditems>
            <!-- ITEM LAYOUT ########################################## -->
            <itemlayout width="360">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <posx>5</posx>
                        <posy>5</posy>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>300</width>
                            <height>169</height>
                            <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>300</width>
                            <height>169</height>
                            <texture background="true">$INFO[ListItem.Thumb]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="label">
                            <scroll>false</scroll>
                            <posx>0</posx>
                            <posy>179</posy>
                            <width>300</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <aligny>center</aligny>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label]</label>
                        </control>
                    </control>
                </control>
            </itemlayout>

            <!-- FOCUSED LAYOUT ####################################### -->
            <focusedlayout width="360">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <animation effect="zoom" start="100" end="110" time="100" center="155,89.5" reversible="false">Focus</animation>
                        <animation effect="zoom" start="110" end="100" time="100" center="155,89.5" reversible="false">UnFocus</animation>
                        <posx>0</posx>
                        <posy>0</posy>
                        <control type="image">
                            <visible>Control.HasFocus(2126)</visible>
                            <posx>-40</posx>
                            <posy>-40</posy>
                            <width>390</width>
                            <height>259</height>
                            <texture border="42">script.plex/drop-shadow.png</texture>
                        </control>
                        <control type="group">
                            <posx>5</posx>
                            <posy>5</posy>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>300</width>
                                <height>169</height>
                                <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>300</width>
                                <height>169</height>
                                <texture background="true">$INFO[ListItem.Thumb]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="label">
                                <scroll>false</scroll>
                                <posx>0</posx>
                                <posy>179</posy>
                                <width>300</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <aligny>center</aligny>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label]</label>
                            </control>
                        </control>
                        <control type="image">
                            <visible>Control.HasFocus(2126)</visible>
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>310</width>
                            <height>179</height>
                            <texture border="10">script.plex/home/selected.png</texture>
                        </control>
                    </control>
                </control>
            </focusedlayout>
        </control>
    </control>

    <control type="group" id="2027">
        <visible>Integer.IsGreater(Container(2127).NumItems,0) + String.IsEmpty(Window.Property(drawing))</visible>
        <width>1356</width>
        <height>420</height>
        <control type="image">
            <posx>60</posx>
            <posy>0</posy>
            <width>1236</width>
            <height>2</height>
            <texture>script.plex/white-square.png</texture>
            <colordiffuse>FF282828</colordiffuse>
        </control>
        <control type="label">
            <scroll>false</scroll>
            <posx>60</posx>
            <posy>0</posy>
            <width>1000</width>
            <height>87</height>
            <font>font12</font>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <label>[UPPERCASE]$INFO[Window.Property(hub.2127)][/UPPERCASE]</label>
        </control>
        <control type="list" id="2127">
            <posx>0</posx>
            <posy>30</posy>
            <width>1356</width>
            <height>440</height>
            <onleft>899</onleft>
            <onup>2126</onup>
            <ondown>2128</ondown>
            <scrolltime>200</scrolltime>
            <orientation>horizontal</orientation>
            <preloaditems>4</preloaditems>
            <!-- ITEM LAYOUT ########################################## -->
            <itemlayout width="304">
                <control type="group">
                   <posx>55</posx>
                    <posy>61</posy>
                    <control type="group">
                        <posx>5</posx>
                        <posy>5</posy>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>244</width>
                            <height>244</height>
                            <texture diffuse="script.plex/masks/role.png">$INFO[ListItem.Property(thumb.fallback)]</texture>
                        </control>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>244</width>
                            <height>244</height>
                            <texture background="true" diffuse="script.plex/masks/role.png">$INFO[ListItem.Thumb]</texture>
                            <aspectratio scalediffuse="false" aligny="top">scale</aspectratio>
                        </control>
                        <control type="label">
                            <scroll>false</scroll>
                            <posx>0</posx>
                            <posy>254</posy>
                            <width>244</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label]</label>
                        </control>
                        <control type="label">
                            <posx>0</posx>
                            <posy>282</posy>
                            <width>244</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label2]</label>
                        </control>
                    </control>
                </control>
            </itemlayout>

            <!-- FOCUSED LAYOUT ####################################### -->
            <focusedlayout width="304">
                <control type="group">
                    <posx>55</posx>
                    <posy>61</posy>
                    <control type="group">
                        <animation effect="zoom" start="100" end="110" time="100" center="127,127" reversible="false">Focus</animation>
                        <animation effect="zoom" start="110" end="100" time="100" center="127,127" reversible="false">UnFocus</animation>
                        <posx>0</posx>
                        <posy>0</posy>
                        <control type="image">
                            <visible>Control.HasFocus(2127)</visible>
                            <posx>-40</posx>
                            <posy>-40</posy>
                            <width>334</width>
                            <height>334</height>
                            <texture border="42">script.plex/buttons/role-shadow.png</texture>
                        </control>
                        <control type="group">
                            <posx>5</posx>
                            <posy>5</posy>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>244</width>
                                <height>244</height>
                                <texture diffuse="script.plex/masks/role.png">$INFO[ListItem.Property(thumb.fallback)]</texture>
                            </control>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>244</width>
                                <height>244</height>
                                <texture background="true" diffuse="script.plex/masks/role.png">$INFO[ListItem.Thumb]</texture>
                                <aspectratio scalediffuse="false" aligny="top">scale</aspectratio>
                            </control>
                            <control type="label">
                                <scroll>false</scroll>
                                <posx>0</posx>
                                <posy>254</posy>
                                <width>244</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label]</label>
                            </control>
                            <control type="label">
                                <posx>0</posx>
                                <posy>282</posy>
                                <width>244</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label2]</label>
                            </control>
                        </control>
                        <control type="image">
                            <visible>Control.HasFocus(2127)</visible>
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>254</width>
                            <height>254</height>
                            <texture>script.plex/buttons/role-selected.png</texture>
                        </control>
                    </control>
                </control>
            </focusedlayout>
        </control>
    </control>

    <control type="group" id="2028">
        <visible>Integer.IsGreater(Container(2128).NumItems,0) + String.IsEmpty(Window.Property(drawing))</visible>
        <width>1356</width>
        <height>420</height>
        <control type="image">
            <posx>60</posx>
            <posy>0</posy>
            <width>1236</width>
            <height>2</height>
            <texture>script.plex/white-square.png</texture>
            <colordiffuse>FF282828</colordiffuse>
        </control>
        <control type="label">
            <scroll>false</scroll>
            <posx>60</posx>
            <posy>0</posy>
            <width>1000</width>
            <height>87</height>
            <font>font12</font>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <label>[UPPERCASE]$INFO[Window.Property(hub.2128)][/UPPERCASE]</label>
        </control>
        <control type="list" id="2128">
            <posx>0</posx>
            <posy>30</posy>
            <width>1356</width>
            <height>440</height>
            <onleft>899</onleft>
            <onup>2127</onup>
            <ondown>2129</ondown>
            <scrolltime>200</scrolltime>
            <orientation>horizontal</orientation>
            <preloaditems>4</preloaditems>
            <!-- ITEM LAYOUT ########################################## -->
            <itemlayout width="240">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <posx>5</posx>
                        <posy>5</posy>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>180</width>
                            <height>270</height>
                            <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>180</width>
                            <height>270</height>
                            <texture background="true">$INFO[ListItem.Thumb]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="label">
                            <scroll>false</scroll>
                            <posx>0</posx>
                            <posy>280</posy>
                            <width>180</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <aligny>center</aligny>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label]</label>
                        </control>
                    </control>
                </control>
            </itemlayout>

            <!-- FOCUSED LAYOUT ####################################### -->
            <focusedlayout width="240">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <animation effect="zoom" start="100" end="110" time="100" center="95,140" reversible="false">Focus</animation>
                        <animation effect="zoom" start="110" end="100" time="100" center="95,140" reversible="false">UnFocus</animation>
                        <posx>0</posx>
                        <posy>0</posy>
                        <control type="image">
                            <visible>Control.HasFocus(2128)</visible>
                            <posx>-40</posx>
                            <posy>-40</posy>
                            <width>270</width>
                            <height>360</height>
                            <texture border="42">script.plex/drop-shadow.png</texture>
                        </control>
                        <control type="group">
                            <posx>5</posx>
                            <posy>5</posy>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>180</width>
                                <height>270</height>
                                <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>180</width>
                                <height>270</height>
                                <texture background="true">$INFO[ListItem.Thumb]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="label">
                                <scroll>false</scroll>
                                <posx>0</posx>
                                <posy>280</posy>
                                <width>180</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <aligny>center</aligny>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label]</label>
                            </control>
                        </control>
                        <control type="image">
                            <visible>Control.HasFocus(2128)</visible>
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>190</width>
                            <height>280</height>
                            <texture border="10">script.plex/home/selected.png</texture>
                        </control>
                    </control>
                </control>
            </focusedlayout>
        </control>
    </control>

    <control type="group" id="2029">
        <visible>Integer.IsGreater(Container(2129).NumItems,0) + String.IsEmpty(Window.Property(drawing))</visible>
        <width>1356</width>
        <height>420</height>
        <control type="image">
            <posx>60</posx>
            <posy>0</posy>
            <width>1236</width>
            <height>2</height>
            <texture>script.plex/white-square.png</texture>
            <colordiffuse>FF282828</colordiffuse>
        </control>
        <control type="label">
            <scroll>false</scroll>
            <posx>60</posx>
            <posy>0</posy>
            <width>1000</width>
            <height>87</height>
            <font>font12</font>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <label>[UPPERCASE]$INFO[Window.Property(hub.2129)][/UPPERCASE]</label>
        </control>
        <control type="list" id="2129">
            <posx>0</posx>
            <posy>30</posy>
            <width>1356</width>
            <height>440</height>
            <onleft>899</onleft>
            <onup>2128</onup>
            <ondown>2130</ondown>
            <scrolltime>200</scrolltime>
            <orientation>horizontal</orientation>
            <preloaditems>4</preloaditems>
            <!-- ITEM LAYOUT ########################################## -->
            <itemlayout width="330">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <posx>5</posx>
                        <posy>5</posy>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>270</width>
                            <height>270</height>
                            <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>270</width>
                            <height>270</height>
                            <texture background="true">$INFO[ListItem.Thumb]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="label">
                            <scroll>false</scroll>
                            <posx>0</posx>
                            <posy>280</posy>
                            <width>270</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <aligny>center</aligny>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label]</label>
                        </control>
                    </control>
                </control>
            </itemlayout>

            <!-- FOCUSED LAYOUT ####################################### -->
            <focusedlayout width="330">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <animation effect="zoom" start="100" end="110" time="100" center="140,140" reversible="false">Focus</animation>
                        <animation effect="zoom" start="110" end="100" time="100" center="140,140" reversible="false">UnFocus</animation>
                        <posx>0</posx>
                        <posy>0</posy>
                        <control type="image">
                            <visible>Control.HasFocus(2129)</visible>
                            <posx>-40</posx>
                            <posy>-40</posy>
                            <width>360</width>
                            <height>360</height>
                            <texture border="42">script.plex/drop-shadow.png</texture>
                        </control>
                        <control type="group">
                            <posx>5</posx>
                            <posy>5</posy>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>270</width>
                                <height>270</height>
                                <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>270</width>
                                <height>270</height>
                                <texture background="true">$INFO[ListItem.Thumb]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="label">
                                <scroll>false</scroll>
                                <posx>0</posx>
                                <posy>280</posy>
                                <width>270</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <aligny>center</aligny>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label]</label>
                            </control>
                        </control>
                        <control type="image">
                            <visible>Control.HasFocus(2129)</visible>
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>280</width>
                            <height>280</height>
                            <texture border="10">script.plex/home/selected.png</texture>
                        </control>
                    </control>
                </control>
            </focusedlayout>
        </control>
    </control>

    <control type="group" id="2030">
        <visible>Integer.IsGreater(Container(2130).NumItems,0) + String.IsEmpty(Window.Property(drawing))</visible>
        <width>1356</width>
        <height>320</height>
        <control type="image">
            <posx>60</posx>
            <posy>0</posy>
            <width>1236</width>
            <height>2</height>
            <texture>script.plex/white-square.png</texture>
            <colordiffuse>FF282828</colordiffuse>
        </control>
        <control type="label">
            <scroll>false</scroll>
            <posx>60</posx>
            <posy>0</posy>
            <width>1000</width>
            <height>87</height>
            <font>font12</font>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <label>[UPPERCASE]$INFO[Window.Property(hub.2130)][/UPPERCASE]</label>
        </control>
        <control type="list" id="2130">
            <posx>0</posx>
            <posy>30</posy>
            <width>1356</width>
            <height>440</height>
            <onleft>899</onleft>
            <onup>2129</onup>
            <ondown>2131</ondown>
            <scrolltime>200</scrolltime>
            <orientation>horizontal</orientation>
            <preloaditems>4</preloaditems>
            <!-- ITEM LAYOUT ########################################## -->
            <itemlayout width="360">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <posx>5</posx>
                        <posy>5</posy>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>300</width>
                            <height>169</height>
                            <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>300</width>
                            <height>169</height>
                            <texture background="true">$INFO[ListItem.Thumb]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="label">
                            <scroll>false</scroll>
                            <posx>0</posx>
                            <posy>179</posy>
                            <width>300</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <aligny>center</aligny>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label]</label>
                        </control>
                    </control>
                </control>
            </itemlayout>

            <!-- FOCUSED LAYOUT ####################################### -->
            <focusedlayout width="360">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <animation effect="zoom" start="100" end="110" time="100" center="155,89.5" reversible="false">Focus</animation>
                        <animation effect="zoom" start="110" end="100" time="100" center="155,89.5" reversible="false">UnFocus</animation>
                        <posx>0</posx>
                        <posy>0</posy>
                        <control type="image">
                            <visible>Control.HasFocus(2130)</visible>
                            <posx>-40</posx>
                            <posy>-40</posy>
                            <width>390</width>
                            <height>259</height>
                            <texture border="42">script.plex/drop-shadow.png</texture>
                        </control>
                        <control type="group">
                            <posx>5</posx>
                            <posy>5</posy>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>300</width>
                                <height>169</height>
                                <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>300</width>
                                <height>169</height>
                                <texture background="true">$INFO[ListItem.Thumb]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="label">
                                <scroll>false</scroll>
                                <posx>0</posx>
                                <posy>179</posy>
                                <width>300</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <aligny>center</aligny>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label]</label>
                            </control>
                        </control>
                        <control type="image">
                            <visible>Control.HasFocus(2130)</visible>
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>310</width>
                            <height>179</height>
                            <texture border="10">script.plex/home/selected.png</texture>
                        </control>
                    </control>
                </control>
            </focusedlayout>
        </control>
    </control>

    <control type="group" id="2031">
        <visible>Integer.IsGreater(Container(2131).NumItems,0) + String.IsEmpty(Window.Property(drawing))</visible>
        <width>1356</width>
        <height>420</height>
        <control type="image">
            <posx>60</posx>
            <posy>0</posy>
            <width>1236</width>
            <height>2</height>
            <texture>script.plex/white-square.png</texture>
            <colordiffuse>FF282828</colordiffuse>
        </control>
        <control type="label">
            <scroll>false</scroll>
            <posx>60</posx>
            <posy>0</posy>
            <width>1000</width>
            <height>87</height>
            <font>font12</font>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <label>[UPPERCASE]$INFO[Window.Property(hub.2131)][/UPPERCASE]</label>
        </control>
        <control type="list" id="2131">
            <posx>0</posx>
            <posy>30</posy>
            <width>1356</width>
            <height>440</height>
            <onleft>899</onleft>
            <onup>2130</onup>
            <ondown>2132</ondown>
            <scrolltime>200</scrolltime>
            <orientation>horizontal</orientation>
            <preloaditems>4</preloaditems>
            <!-- ITEM LAYOUT ########################################## -->
            <itemlayout width="304">
                <control type="group">
                   <posx>55</posx>
                    <posy>61</posy>
                    <control type="group">
                        <posx>5</posx>
                        <posy>5</posy>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>244</width>
                            <height>244</height>
                            <texture diffuse="script.plex/masks/role.png">$INFO[ListItem.Property(thumb.fallback)]</texture>
                        </control>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>244</width>
                            <height>244</height>
                            <texture background="true" diffuse="script.plex/masks/role.png">$INFO[ListItem.Thumb]</texture>
                            <aspectratio scalediffuse="false" aligny="top">scale</aspectratio>
                        </control>
                        <control type="label">
                            <scroll>false</scroll>
                            <posx>0</posx>
                            <posy>254</posy>
                            <width>244</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label]</label>
                        </control>
                        <control type="label">
                            <posx>0</posx>
                            <posy>282</posy>
                            <width>244</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label2]</label>
                        </control>
                    </control>
                </control>
            </itemlayout>

            <!-- FOCUSED LAYOUT ####################################### -->
            <focusedlayout width="304">
                <control type="group">
                    <posx>55</posx>
                    <posy>61</posy>
                    <control type="group">
                        <animation effect="zoom" start="100" end="110" time="100" center="127,127" reversible="false">Focus</animation>
                        <animation effect="zoom" start="110" end="100" time="100" center="127,127" reversible="false">UnFocus</animation>
                        <posx>0</posx>
                        <posy>0</posy>
                        <control type="image">
                            <visible>Control.HasFocus(2131)</visible>
                            <posx>-40</posx>
                            <posy>-40</posy>
                            <width>334</width>
                            <height>334</height>
                            <texture border="42">script.plex/buttons/role-shadow.png</texture>
                        </control>
                        <control type="group">
                            <posx>5</posx>
                            <posy>5</posy>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>244</width>
                                <height>244</height>
                                <texture diffuse="script.plex/masks/role.png">$INFO[ListItem.Property(thumb.fallback)]</texture>
                            </control>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>244</width>
                                <height>244</height>
                                <texture background="true" diffuse="script.plex/masks/role.png">$INFO[ListItem.Thumb]</texture>
                                <aspectratio scalediffuse="false" aligny="top">scale</aspectratio>
                            </control>
                            <control type="label">
                                <scroll>false</scroll>
                                <posx>0</posx>
                                <posy>254</posy>
                                <width>244</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label]</label>
                            </control>
                            <control type="label">
                                <posx>0</posx>
                                <posy>282</posy>
                                <width>244</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label2]</label>
                            </control>
                        </control>
                        <control type="image">
                            <visible>Control.HasFocus(2131)</visible>
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>254</width>
                            <height>254</height>
                            <texture>script.plex/buttons/role-selected.png</texture>
                        </control>
                    </control>
                </control>
            </focusedlayout>
        </control>
    </control>

    <control type="group" id="2032">
        <visible>Integer.IsGreater(Container(2132).NumItems,0) + String.IsEmpty(Window.Property(drawing))</visible>
        <width>1356</width>
        <height>420</height>
        <control type="image">
            <posx>60</posx>
            <posy>0</posy>
            <width>1236</width>
            <height>2</height>
            <texture>script.plex/white-square.png</texture>
            <colordiffuse>FF282828</colordiffuse>
        </control>
        <control type="label">
            <scroll>false</scroll>
            <posx>60</posx>
            <posy>0</posy>
            <width>1000</width>
            <height>87</height>
            <font>font12</font>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <label>[UPPERCASE]$INFO[Window.Property(hub.2132)][/UPPERCASE]</label>
        </control>
        <control type="list" id="2132">
            <posx>0</posx>
            <posy>30</posy>
            <width>1356</width>
            <height>440</height>
            <onleft>899</onleft>
            <onup>2131</onup>
            <ondown>2133</ondown>
            <scrolltime>200</scrolltime>
            <orientation>horizontal</orientation>
            <preloaditems>4</preloaditems>
            <!-- ITEM LAYOUT ########################################## -->
            <itemlayout width="240">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <posx>5</posx>
                        <posy>5</posy>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>180</width>
                            <height>270</height>
                            <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>180</width>
                            <height>270</height>
                            <texture background="true">$INFO[ListItem.Thumb]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="label">
                            <scroll>false</scroll>
                            <posx>0</posx>
                            <posy>280</posy>
                            <width>180</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <aligny>center</aligny>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label]</label>
                        </control>
                    </control>
                </control>
            </itemlayout>

            <!-- FOCUSED LAYOUT ####################################### -->
            <focusedlayout width="240">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <animation effect="zoom" start="100" end="110" time="100" center="95,140" reversible="false">Focus</animation>
                        <animation effect="zoom" start="110" end="100" time="100" center="95,140" reversible="false">UnFocus</animation>
                        <posx>0</posx>
                        <posy>0</posy>
                        <control type="image">
                            <visible>Control.HasFocus(2132)</visible>
                            <posx>-40</posx>
                            <posy>-40</posy>
                            <width>270</width>
                            <height>360</height>
                            <texture border="42">script.plex/drop-shadow.png</texture>
                        </control>
                        <control type="group">
                            <posx>5</posx>
                            <posy>5</posy>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>180</width>
                                <height>270</height>
                                <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>180</width>
                                <height>270</height>
                                <texture background="true">$INFO[ListItem.Thumb]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="label">
                                <scroll>false</scroll>
                                <posx>0</posx>
                                <posy>280</posy>
                                <width>180</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <aligny>center</aligny>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label]</label>
                            </control>
                        </control>
                        <control type="image">
                            <visible>Control.HasFocus(2132)</visible>
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>190</width>
                            <height>280</height>
                            <texture border="10">script.plex/home/selected.png</texture>
                        </control>
                    </control>
                </control>
            </focusedlayout>
        </control>
    </control>

    <control type="group" id="2033">
        <visible>Integer.IsGreater(Container(2133).NumItems,0) + String.IsEmpty(Window.Property(drawing))</visible>
        <width>1356</width>
        <height>420</height>
        <control type="image">
            <posx>60</posx>
            <posy>0</posy>
            <width>1236</width>
            <height>2</height>
            <texture>script.plex/white-square.png</texture>
            <colordiffuse>FF282828</colordiffuse>
        </control>
        <control type="label">
            <scroll>false</scroll>
            <posx>60</posx>
            <posy>0</posy>
            <width>1000</width>
            <height>87</height>
            <font>font12</font>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <label>[UPPERCASE]$INFO[Window.Property(hub.2133)][/UPPERCASE]</label>
        </control>
        <control type="list" id="2133">
            <posx>0</posx>
            <posy>30</posy>
            <width>1356</width>
            <height>440</height>
            <onleft>899</onleft>
            <onup>2132</onup>
            <ondown>2134</ondown>
            <scrolltime>200</scrolltime>
            <orientation>horizontal</orientation>
            <preloaditems>4</preloaditems>
            <!-- ITEM LAYOUT ########################################## -->
            <itemlayout width="330">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <posx>5</posx>
                        <posy>5</posy>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>270</width>
                            <height>270</height>
                            <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>270</width>
                            <height>270</height>
                            <texture background="true">$INFO[ListItem.Thumb]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="label">
                            <scroll>false</scroll>
                            <posx>0</posx>
                            <posy>280</posy>
                            <width>270</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <aligny>center</aligny>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label]</label>
                        </control>
                    </control>
                </control>
            </itemlayout>

            <!-- FOCUSED LAYOUT ####################################### -->
            <focusedlayout width="330">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <animation effect="zoom" start="100" end="110" time="100" center="140,140" reversible="false">Focus</animation>
                        <animation effect="zoom" start="110" end="100" time="100" center="140,140" reversible="false">UnFocus</animation>
                        <posx>0</posx>
                        <posy>0</posy>
                        <control type="image">
                            <visible>Control.HasFocus(2133)</visible>
                            <posx>-40</posx>
                            <posy>-40</posy>
                            <width>360</width>
                            <height>360</height>
                            <texture border="42">script.plex/drop-shadow.png</texture>
                        </control>
                        <control type="group">
                            <posx>5</posx>
                            <posy>5</posy>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>270</width>
                                <height>270</height>
                                <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>270</width>
                                <height>270</height>
                                <texture background="true">$INFO[ListItem.Thumb]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="label">
                                <scroll>false</scroll>
                                <posx>0</posx>
                                <posy>280</posy>
                                <width>270</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <aligny>center</aligny>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label]</label>
                            </control>
                        </control>
                        <control type="image">
                            <visible>Control.HasFocus(2133)</visible>
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>280</width>
                            <height>280</height>
                            <texture border="10">script.plex/home/selected.png</texture>
                        </control>
                    </control>
                </control>
            </focusedlayout>
        </control>
    </control>

    <control type="group" id="2034">
        <visible>Integer.IsGreater(Container(2134).NumItems,0) + String.IsEmpty(Window.Property(drawing))</visible>
        <width>1356</width>
        <height>320</height>
        <control type="image">
            <posx>60</posx>
            <posy>0</posy>
            <width>1236</width>
            <height>2</height>
            <texture>script.plex/white-square.png</texture>
            <colordiffuse>FF282828</colordiffuse>
        </control>
        <control type="label">
            <scroll>false</scroll>
            <posx>60</posx>
            <posy>0</posy>
            <width>1000</width>
            <height>87</height>
            <font>font12</font>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <label>[UPPERCASE]$INFO[Window.Property(hub.2134)][/UPPERCASE]</label>
        </control>
        <control type="list" id="2134">
            <posx>0</posx>
            <posy>30</posy>
            <width>1356</width>
            <height>440</height>
            <onleft>899</onleft>
            <onup>2133</onup>
            <ondown>2135</ondown>
            <scrolltime>200</scrolltime>
            <orientation>horizontal</orientation>
            <preloaditems>4</preloaditems>
            <!-- ITEM LAYOUT ########################################## -->
            <itemlayout width="360">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <posx>5</posx>
                        <posy>5</posy>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>300</width>
                            <height>169</height>
                            <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>300</width>
                            <height>169</height>
                            <texture background="true">$INFO[ListItem.Thumb]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="label">
                            <scroll>false</scroll>
                            <posx>0</posx>
                            <posy>179</posy>
                            <width>300</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <aligny>center</aligny>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label]</label>
                        </control>
                    </control>
                </control>
            </itemlayout>

            <!-- FOCUSED LAYOUT ####################################### -->
            <focusedlayout width="360">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <animation effect="zoom" start="100" end="110" time="100" center="155,89.5" reversible="false">Focus</animation>
                        <animation effect="zoom" start="110" end="100" time="100" center="155,89.5" reversible="false">UnFocus</animation>
                        <posx>0</posx>
                        <posy>0</posy>
                        <control type="image">
                            <visible>Control.HasFocus(2134)</visible>
                            <posx>-40</posx>
                            <posy>-40</posy>
                            <width>390</width>
                            <height>259</height>
                            <texture border="42">script.plex/drop-shadow.png</texture>
                        </control>
                        <control type="group">
                            <posx>5</posx>
                            <posy>5</posy>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>300</width>
                                <height>169</height>
                                <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>300</width>
                                <height>169</height>
                                <texture background="true">$INFO[ListItem.Thumb]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="label">
                                <scroll>false</scroll>
                                <posx>0</posx>
                                <posy>179</posy>
                                <width>300</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <aligny>center</aligny>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label]</label>
                            </control>
                        </control>
                        <control type="image">
                            <visible>Control.HasFocus(2134)</visible>
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>310</width>
                            <height>179</height>
                            <texture border="10">script.plex/home/selected.png</texture>
                        </control>
                    </control>
                </control>
            </focusedlayout>
        </control>
    </control>

    <control type="group" id="2035">
        <visible>Integer.IsGreater(Container(2135).NumItems,0) + String.IsEmpty(Window.Property(drawing))</visible>
        <width>1356</width>
        <height>420</height>
        <control type="image">
            <posx>60</posx>
            <posy>0</posy>
            <width>1236</width>
            <height>2</height>
            <texture>script.plex/white-square.png</texture>
            <colordiffuse>FF282828</colordiffuse>
        </control>
        <control type="label">
            <scroll>false</scroll>
            <posx>60</posx>
            <posy>0</posy>
            <width>1000</width>
            <height>87</height>
            <font>font12</font>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <label>[UPPERCASE]$INFO[Window.Property(hub.2135)][/UPPERCASE]</label>
        </control>
        <control type="list" id="2135">
            <posx>0</posx>
            <posy>30</posy>
            <width>1356</width>
            <height>440</height>
            <onleft>899</onleft>
            <onup>2134</onup>
            <ondown>2136</ondown>
            <scrolltime>200</scrolltime>
            <orientation>horizontal</orientation>
            <preloaditems>4</preloaditems>
            <!-- ITEM LAYOUT ########################################## -->
            <itemlayout width="304">
                <control type="group">
                   <posx>55</posx>
                    <posy>61</posy>
                    <control type="group">
                        <posx>5</posx>
                        <posy>5</posy>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>244</width>
                            <height>244</height>
                            <texture diffuse="script.plex/masks/role.png">$INFO[ListItem.Property(thumb.fallback)]</texture>
                        </control>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>244</width>
                            <height>244</height>
                            <texture background="true" diffuse="script.plex/masks/role.png">$INFO[ListItem.Thumb]</texture>
                            <aspectratio scalediffuse="false" aligny="top">scale</aspectratio>
                        </control>
                        <control type="label">
                            <scroll>false</scroll>
                            <posx>0</posx>
                            <posy>254</posy>
                            <width>244</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label]</label>
                        </control>
                        <control type="label">
                            <posx>0</posx>
                            <posy>282</posy>
                            <width>244</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label2]</label>
                        </control>
                    </control>
                </control>
            </itemlayout>

            <!-- FOCUSED LAYOUT ####################################### -->
            <focusedlayout width="304">
                <control type="group">
                    <posx>55</posx>
                    <posy>61</posy>
                    <control type="group">
                        <animation effect="zoom" start="100" end="110" time="100" center="127,127" reversible="false">Focus</animation>
                        <animation effect="zoom" start="110" end="100" time="100" center="127,127" reversible="false">UnFocus</animation>
                        <posx>0</posx>
                        <posy>0</posy>
                        <control type="image">
                            <visible>Control.HasFocus(2135)</visible>
                            <posx>-40</posx>
                            <posy>-40</posy>
                            <width>334</width>
                            <height>334</height>
                            <texture border="42">script.plex/buttons/role-shadow.png</texture>
                        </control>
                        <control type="group">
                            <posx>5</posx>
                            <posy>5</posy>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>244</width>
                                <height>244</height>
                                <texture diffuse="script.plex/masks/role.png">$INFO[ListItem.Property(thumb.fallback)]</texture>
                            </control>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>244</width>
                                <height>244</height>
                                <texture background="true" diffuse="script.plex/masks/role.png">$INFO[ListItem.Thumb]</texture>
                                <aspectratio scalediffuse="false" aligny="top">scale</aspectratio>
                            </control>
                            <control type="label">
                                <scroll>false</scroll>
                                <posx>0</posx>
                                <posy>254</posy>
                                <width>244</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label]</label>
                            </control>
                            <control type="label">
                                <posx>0</posx>
                                <posy>282</posy>
                                <width>244</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label2]</label>
                            </control>
                        </control>
                        <control type="image">
                            <visible>Control.HasFocus(2135)</visible>
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>254</width>
                            <height>254</height>
                            <texture>script.plex/buttons/role-selected.png</texture>
                        </control>
                    </control>
                </control>
            </focusedlayout>
        </control>
    </control>

    <control type="group" id="2036">
        <visible>Integer.IsGreater(Container(2136).NumItems,0) + String.IsEmpty(Window.Property(drawing))</visible>
        <width>1356</width>
        <height>420</height>
        <control type="image">
            <posx>60</posx>
            <posy>0</posy>
            <width>1236</width>
            <height>2</height>
            <texture>script.plex/white-square.png</texture>
            <colordiffuse>FF282828</colordiffuse>
        </control>
        <control type="label">
            <scroll>false</scroll>
            <posx>60</posx>
            <posy>0</posy>
            <width>1000</width>
            <height>87</height>
            <font>font12</font>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <label>[UPPERCASE]$INFO[Window.Property(hub.2136)][/UPPERCASE]</label>
        </control>
        <control type="list" id="2136">
            <posx>0</posx>
            <posy>30</posy>
            <width>1356</width>
            <height>440</height>
            <onleft>899</onleft>
            <onup>2135</onup>
            <ondown>2137</ondown>
            <scrolltime>200</scrolltime>
            <orientation>horizontal</orientation>
            <preloaditems>4</preloaditems>
            <!-- ITEM LAYOUT ########################################## -->
            <itemlayout width="240">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <posx>5</posx>
                        <posy>5</posy>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>180</width>
                            <height>270</height>
                            <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>180</width>
                            <height>270</height>
                            <texture background="true">$INFO[ListItem.Thumb]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="label">
                            <scroll>false</scroll>
                            <posx>0</posx>
                            <posy>280</posy>
                            <width>180</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <aligny>center</aligny>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label]</label>
                        </control>
                    </control>
                </control>
            </itemlayout>

            <!-- FOCUSED LAYOUT ####################################### -->
            <focusedlayout width="240">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <animation effect="zoom" start="100" end="110" time="100" center="95,140" reversible="false">Focus</animation>
                        <animation effect="zoom" start="110" end="100" time="100" center="95,140" reversible="false">UnFocus</animation>
                        <posx>0</posx>
                        <posy>0</posy>
                        <control type="image">
                            <visible>Control.HasFocus(2136)</visible>
                            <posx>-40</posx>
                            <posy>-40</posy>
                            <width>270</width>
                            <height>360</height>
                            <texture border="42">script.plex/drop-shadow.png</texture>
                        </control>
                        <control type="group">
                            <posx>5</posx>
                            <posy>5</posy>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>180</width>
                                <height>270</height>
                                <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>180</width>
                                <height>270</height>
                                <texture background="true">$INFO[ListItem.Thumb]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="label">
                                <scroll>false</scroll>
                                <posx>0</posx>
                                <posy>280</posy>
                                <width>180</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <aligny>center</aligny>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label]</label>
                            </control>
                        </control>
                        <control type="image">
                            <visible>Control.HasFocus(2136)</visible>
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>190</width>
                            <height>280</height>
                            <texture border="10">script.plex/home/selected.png</texture>
                        </control>
                    </control>
                </control>
            </focusedlayout>
        </control>
    </control>

    <control type="group" id="2037">
        <visible>Integer.IsGreater(Container(2137).NumItems,0) + String.IsEmpty(Window.Property(drawing))</visible>
        <width>1356</width>
        <height>420</height>
        <control type="image">
            <posx>60</posx>
            <posy>0</posy>
            <width>1236</width>
            <height>2</height>
            <texture>script.plex/white-square.png</texture>
            <colordiffuse>FF282828</colordiffuse>
        </control>
        <control type="label">
            <scroll>false</scroll>
            <posx>60</posx>
            <posy>0</posy>
            <width>1000</width>
            <height>87</height>
            <font>font12</font>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <label>[UPPERCASE]$INFO[Window.Property(hub.2137)][/UPPERCASE]</label>
        </control>
        <control type="list" id="2137">
            <posx>0</posx>
            <posy>30</posy>
            <width>1356</width>
            <height>440</height>
            <onleft>899</onleft>
            <onup>2136</onup>
            <ondown>2138</ondown>
            <scrolltime>200</scrolltime>
            <orientation>horizontal</orientation>
            <preloaditems>4</preloaditems>
            <!-- ITEM LAYOUT ########################################## -->
            <itemlayout width="330">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <posx>5</posx>
                        <posy>5</posy>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>270</width>
                            <height>270</height>
                            <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>270</width>
                            <height>270</height>
                            <texture background="true">$INFO[ListItem.Thumb]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="label">
                            <scroll>false</scroll>
                            <posx>0</posx>
                            <posy>280</posy>
                            <width>270</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <aligny>center</aligny>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label]</label>
                        </control>
                    </control>
                </control>
            </itemlayout>

            <!-- FOCUSED LAYOUT ####################################### -->
            <focusedlayout width="330">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <animation effect="zoom" start="100" end="110" time="100" center="140,140" reversible="false">Focus</animation>
                        <animation effect="zoom" start="110" end="100" time="100" center="140,140" reversible="false">UnFocus</animation>
                        <posx>0</posx>
                        <posy>0</posy>
                        <control type="image">
                            <visible>Control.HasFocus(2137)</visible>
                            <posx>-40</posx>
                            <posy>-40</posy>
                            <width>360</width>
                            <height>360</height>
                            <texture border="42">script.plex/drop-shadow.png</texture>
                        </control>
                        <control type="group">
                            <posx>5</posx>
                            <posy>5</posy>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>270</width>
                                <height>270</height>
                                <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>270</width>
                                <height>270</height>
                                <texture background="true">$INFO[ListItem.Thumb]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="label">
                                <scroll>false</scroll>
                                <posx>0</posx>
                                <posy>280</posy>
                                <width>270</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <aligny>center</aligny>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label]</label>
                            </control>
                        </control>
                        <control type="image">
                            <visible>Control.HasFocus(2137)</visible>
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>280</width>
                            <height>280</height>
                            <texture border="10">script.plex/home/selected.png</texture>
                        </control>
                    </control>
                </control>
            </focusedlayout>
        </control>
    </control>

    <control type="group" id="2038">
        <visible>Integer.IsGreater(Container(2138).NumItems,0) + String.IsEmpty(Window.Property(drawing))</visible>
        <width>1356</width>
        <height>320</height>
        <control type="image">
            <posx>60</posx>
            <posy>0</posy>
            <width>1236</width>
            <height>2</height>
            <texture>script.plex/white-square.png</texture>
            <colordiffuse>FF282828</colordiffuse>
        </control>
        <control type="label">
            <scroll>false</scroll>
            <posx>60</posx>
            <posy>0</posy>
            <width>1000</width>
            <height>87</height>
            <font>font12</font>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <label>[UPPERCASE]$INFO[Window.Property(hub.2138)][/UPPERCASE]</label>
        </control>
        <control type="list" id="2138">
            <posx>0</posx>
            <posy>30</posy>
            <width>1356</width>
            <height>440</height>
            <onleft>899</onleft>
            <onup>2137</onup>
            <ondown>2139</ondown>
            <scrolltime>200</scrolltime>
            <orientation>horizontal</orientation>
            <preloaditems>4</preloaditems>
            <!-- ITEM LAYOUT ########################################## -->
            <itemlayout width="360">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <posx>5</posx>
                        <posy>5</posy>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>300</width>
                            <height>169</height>
                            <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>300</width>
                            <height>169</height>
                            <texture background="true">$INFO[ListItem.Thumb]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="label">
                            <scroll>false</scroll>
                            <posx>0</posx>
                            <posy>179</posy>
                            <width>300</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <aligny>center</aligny>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label]</label>
                        </control>
                    </control>
                </control>
            </itemlayout>

            <!-- FOCUSED LAYOUT ####################################### -->
            <focusedlayout width="360">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <animation effect="zoom" start="100" end="110" time="100" center="155,89.5" reversible="false">Focus</animation>
                        <animation effect="zoom" start="110" end="100" time="100" center="155,89.5" reversible="false">UnFocus</animation>
                        <posx>0</posx>
                        <posy>0</posy>
                        <control type="image">
                            <visible>Control.HasFocus(2138)</visible>
                            <posx>-40</posx>
                            <posy>-40</posy>
                            <width>390</width>
                            <height>259</height>
                            <texture border="42">script.plex/drop-shadow.png</texture>
                        </control>
                        <control type="group">
                            <posx>5</posx>
                            <posy>5</posy>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>300</width>
                                <height>169</height>
                                <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>300</width>
                                <height>169</height>
                                <texture background="true">$INFO[ListItem.Thumb]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="label">
                                <scroll>false</scroll>
                                <posx>0</posx>
                                <posy>179</posy>
                                <width>300</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <aligny>center</aligny>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label]</label>
                            </control>
                        </control>
                        <control type="image">
                            <visible>Control.HasFocus(2138)</visible>
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>310</width>
                            <height>179</height>
                            <texture border="10">script.plex/home/selected.png</texture>
                        </control>
                    </control>
                </control>
            </focusedlayout>
        </control>
    </control>

    <control type="group" id="2039">
        <visible>Integer.IsGreater(Container(2139).NumItems,0) + String.IsEmpty(Window.Property(drawing))</visible>
        <width>1356</width>
        <height>420</height>
        <control type="image">
            <posx>60</posx>
            <posy>0</posy>
            <width>1236</width>
            <height>2</height>
            <texture>script.plex/white-square.png</texture>
            <colordiffuse>FF282828</colordiffuse>
        </control>
        <control type="label">
            <scroll>false</scroll>
            <posx>60</posx>
            <posy>0</posy>
            <width>1000</width>
            <height>87</height>
            <font>font12</font>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <label>[UPPERCASE]$INFO[Window.Property(hub.2139)][/UPPERCASE]</label>
        </control>
        <control type="list" id="2139">
            <posx>0</posx>
            <posy>30</posy>
            <width>1356</width>
            <height>440</height>
            <onleft>899</onleft>
            <onup>2138</onup>
            <ondown>2140</ondown>
            <scrolltime>200</scrolltime>
            <orientation>horizontal</orientation>
            <preloaditems>4</preloaditems>
            <!-- ITEM LAYOUT ########################################## -->
            <itemlayout width="304">
                <control type="group">
                   <posx>55</posx>
                    <posy>61</posy>
                    <control type="group">
                        <posx>5</posx>
                        <posy>5</posy>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>244</width>
                            <height>244</height>
                            <texture diffuse="script.plex/masks/role.png">$INFO[ListItem.Property(thumb.fallback)]</texture>
                        </control>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>244</width>
                            <height>244</height>
                            <texture background="true" diffuse="script.plex/masks/role.png">$INFO[ListItem.Thumb]</texture>
                            <aspectratio scalediffuse="false" aligny="top">scale</aspectratio>
                        </control>
                        <control type="label">
                            <scroll>false</scroll>
                            <posx>0</posx>
                            <posy>254</posy>
                            <width>244</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label]</label>
                        </control>
                        <control type="label">
                            <posx>0</posx>
                            <posy>282</posy>
                            <width>244</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label2]</label>
                        </control>
                    </control>
                </control>
            </itemlayout>

            <!-- FOCUSED LAYOUT ####################################### -->
            <focusedlayout width="304">
                <control type="group">
                    <posx>55</posx>
                    <posy>61</posy>
                    <control type="group">
                        <animation effect="zoom" start="100" end="110" time="100" center="127,127" reversible="false">Focus</animation>
                        <animation effect="zoom" start="110" end="100" time="100" center="127,127" reversible="false">UnFocus</animation>
                        <posx>0</posx>
                        <posy>0</posy>
                        <control type="image">
                            <visible>Control.HasFocus(2139)</visible>
                            <posx>-40</posx>
                            <posy>-40</posy>
                            <width>334</width>
                            <height>334</height>
                            <texture border="42">script.plex/buttons/role-shadow.png</texture>
                        </control>
                        <control type="group">
                            <posx>5</posx>
                            <posy>5</posy>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>244</width>
                                <height>244</height>
                                <texture diffuse="script.plex/masks/role.png">$INFO[ListItem.Property(thumb.fallback)]</texture>
                            </control>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>244</width>
                                <height>244</height>
                                <texture background="true" diffuse="script.plex/masks/role.png">$INFO[ListItem.Thumb]</texture>
                                <aspectratio scalediffuse="false" aligny="top">scale</aspectratio>
                            </control>
                            <control type="label">
                                <scroll>false</scroll>
                                <posx>0</posx>
                                <posy>254</posy>
                                <width>244</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label]</label>
                            </control>
                            <control type="label">
                                <posx>0</posx>
                                <posy>282</posy>
                                <width>244</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label2]</label>
                            </control>
                        </control>
                        <control type="image">
                            <visible>Control.HasFocus(2139)</visible>
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>254</width>
                            <height>254</height>
                            <texture>script.plex/buttons/role-selected.png</texture>
                        </control>
                    </control>
                </control>
            </focusedlayout>
        </control>
    </control>

    <control type="group" id="2040">
        <visible>Integer.IsGreater(Container(2140).NumItems,0) + String.IsEmpty(Window.Property(drawing))</visible>
        <width>1356</width>
        <height>420</height>
        <control type="image">
            <posx>60</posx>
            <posy>0</posy>
            <width>1236</width>
            <height>2</height>
            <texture>script.plex/white-square.png</texture>
            <colordiffuse>FF282828</colordiffuse>
        </control>
        <control type="label">
            <scroll>false</scroll>
            <posx>60</posx>
            <posy>0</posy>
            <width>1000</width>
            <height>87</height>
            <font>font12</font>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <label>[UPPERCASE]$INFO[Window.Property(hub.2140)][/UPPERCASE]</label>
        </control>
        <control type="list" id="2140">
            <posx>0</posx>
            <posy>30</posy>
            <width>1356</width>
            <height>440</height>
            <onleft>899</onleft>
            <onup>2139</onup>
            <ondown>2141</ondown>
            <scrolltime>200</scrolltime>
            <orientation>horizontal</orientation>
            <preloaditems>4</preloaditems>
            <!-- ITEM LAYOUT ########################################## -->
            <itemlayout width="240">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <posx>5</posx>
                        <posy>5</posy>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>180</width>
                            <height>270</height>
                            <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>180</width>
                            <height>270</height>
                            <texture background="true">$INFO[ListItem.Thumb]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="label">
                            <scroll>false</scroll>
                            <posx>0</posx>
                            <posy>280</posy>
                            <width>180</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <aligny>center</aligny>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label]</label>
                        </control>
                    </control>
                </control>
            </itemlayout>

            <!-- FOCUSED LAYOUT ####################################### -->
            <focusedlayout width="240">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <animation effect="zoom" start="100" end="110" time="100" center="95,140" reversible="false">Focus</animation>
                        <animation effect="zoom" start="110" end="100" time="100" center="95,140" reversible="false">UnFocus</animation>
                        <posx>0</posx>
                        <posy>0</posy>
                        <control type="image">
                            <visible>Control.HasFocus(2140)</visible>
                            <posx>-40</posx>
                            <posy>-40</posy>
                            <width>270</width>
                            <height>360</height>
                            <texture border="42">script.plex/drop-shadow.png</texture>
                        </control>
                        <control type="group">
                            <posx>5</posx>
                            <posy>5</posy>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>180</width>
                                <height>270</height>
                                <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>180</width>
                                <height>270</height>
                                <texture background="true">$INFO[ListItem.Thumb]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="label">
                                <scroll>false</scroll>
                                <posx>0</posx>
                                <posy>280</posy>
                                <width>180</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <aligny>center</aligny>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label]</label>
                            </control>
                        </control>
                        <control type="image">
                            <visible>Control.HasFocus(2140)</visible>
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>190</width>
                            <height>280</height>
                            <texture border="10">script.plex/home/selected.png</texture>
                        </control>
                    </control>
                </control>
            </focusedlayout>
        </control>
    </control>

    <control type="group" id="2041">
        <visible>Integer.IsGreater(Container(2141).NumItems,0) + String.IsEmpty(Window.Property(drawing))</visible>
        <width>1356</width>
        <height>420</height>
        <control type="image">
            <posx>60</posx>
            <posy>0</posy>
            <width>1236</width>
            <height>2</height>
            <texture>script.plex/white-square.png</texture>
            <colordiffuse>FF282828</colordiffuse>
        </control>
        <control type="label">
            <scroll>false</scroll>
            <posx>60</posx>
            <posy>0</posy>
            <width>1000</width>
            <height>87</height>
            <font>font12</font>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <label>[UPPERCASE]$INFO[Window.Property(hub.2141)][/UPPERCASE]</label>
        </control>
        <control type="list" id="2141">
            <posx>0</posx>
            <posy>30</posy>
            <width>1356</width>
            <height>440</height>
            <onleft>899</onleft>
            <onup>2140</onup>
            <ondown>2142</ondown>
            <scrolltime>200</scrolltime>
            <orientation>horizontal</orientation>
            <preloaditems>4</preloaditems>
            <!-- ITEM LAYOUT ########################################## -->
            <itemlayout width="330">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <posx>5</posx>
                        <posy>5</posy>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>270</width>
                            <height>270</height>
                            <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>270</width>
                            <height>270</height>
                            <texture background="true">$INFO[ListItem.Thumb]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="label">
                            <scroll>false</scroll>
                            <posx>0</posx>
                            <posy>280</posy>
                            <width>270</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <aligny>center</aligny>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label]</label>
                        </control>
                    </control>
                </control>
            </itemlayout>

            <!-- FOCUSED LAYOUT ####################################### -->
            <focusedlayout width="330">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <animation effect="zoom" start="100" end="110" time="100" center="140,140" reversible="false">Focus</animation>
                        <animation effect="zoom" start="110" end="100" time="100" center="140,140" reversible="false">UnFocus</animation>
                        <posx>0</posx>
                        <posy>0</posy>
                        <control type="image">
                            <visible>Control.HasFocus(2141)</visible>
                            <posx>-40</posx>
                            <posy>-40</posy>
                            <width>360</width>
                            <height>360</height>
                            <texture border="42">script.plex/drop-shadow.png</texture>
                        </control>
                        <control type="group">
                            <posx>5</posx>
                            <posy>5</posy>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>270</width>
                                <height>270</height>
                                <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>270</width>
                                <height>270</height>
                                <texture background="true">$INFO[ListItem.Thumb]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="label">
                                <scroll>false</scroll>
                                <posx>0</posx>
                                <posy>280</posy>
                                <width>270</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <aligny>center</aligny>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label]</label>
                            </control>
                        </control>
                        <control type="image">
                            <visible>Control.HasFocus(2141)</visible>
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>280</width>
                            <height>280</height>
                            <texture border="10">script.plex/home/selected.png</texture>
                        </control>
                    </control>
                </control>
            </focusedlayout>
        </control>
    </control>

    <control type="group" id="2042">
        <visible>Integer.IsGreater(Container(2142).NumItems,0) + String.IsEmpty(Window.Property(drawing))</visible>
        <width>1356</width>
        <height>320</height>
        <control type="image">
            <posx>60</posx>
            <posy>0</posy>
            <width>1236</width>
            <height>2</height>
            <texture>script.plex/white-square.png</texture>
            <colordiffuse>FF282828</colordiffuse>
        </control>
        <control type="label">
            <scroll>false</scroll>
            <posx>60</posx>
            <posy>0</posy>
            <width>1000</width>
            <height>87</height>
            <font>font12</font>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <label>[UPPERCASE]$INFO[Window.Property(hub.2142)][/UPPERCASE]</label>
        </control>
        <control type="list" id="2142">
            <posx>0</posx>
            <posy>30</posy>
            <width>1356</width>
            <height>440</height>
            <onleft>899</onleft>
            <onup>2141</onup>
            <ondown>2143</ondown>
            <scrolltime>200</scrolltime>
            <orientation>horizontal</orientation>
            <preloaditems>4</preloaditems>
            <!-- ITEM LAYOUT ########################################## -->
            <itemlayout width="360">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <posx>5</posx>
                        <posy>5</posy>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>300</width>
                            <height>169</height>
                            <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>300</width>
                            <height>169</height>
                            <texture background="true">$INFO[ListItem.Thumb]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="label">
                            <scroll>false</scroll>
                            <posx>0</posx>
                            <posy>179</posy>
                            <width>300</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <aligny>center</aligny>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label]</label>
                        </control>
                    </control>
                </control>
            </itemlayout>

            <!-- FOCUSED LAYOUT ####################################### -->
            <focusedlayout width="360">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <animation effect="zoom" start="100" end="110" time="100" center="155,89.5" reversible="false">Focus</animation>
                        <animation effect="zoom" start="110" end="100" time="100" center="155,89.5" reversible="false">UnFocus</animation>
                        <posx>0</posx>
                        <posy>0</posy>
                        <control type="image">
                            <visible>Control.HasFocus(2142)</visible>
                            <posx>-40</posx>
                            <posy>-40</posy>
                            <width>390</width>
                            <height>259</height>
                            <texture border="42">script.plex/drop-shadow.png</texture>
                        </control>
                        <control type="group">
                            <posx>5</posx>
                            <posy>5</posy>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>300</width>
                                <height>169</height>
                                <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>300</width>
                                <height>169</height>
                                <texture background="true">$INFO[ListItem.Thumb]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="label">
                                <scroll>false</scroll>
                                <posx>0</posx>
                                <posy>179</posy>
                                <width>300</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <aligny>center</aligny>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label]</label>
                            </control>
                        </control>
                        <control type="image">
                            <visible>Control.HasFocus(2142)</visible>
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>310</width>
                            <height>179</height>
                            <texture border="10">script.plex/home/selected.png</texture>
                        </control>
                    </control>
                </control>
            </focusedlayout>
        </control>
    </control>

    <control type="group" id="2043">
        <visible>Integer.IsGreater(Container(2143).NumItems,0) + String.IsEmpty(Window.Property(drawing))</visible>
        <width>1356</width>
        <height>420</height>
        <control type="image">
            <posx>60</posx>
            <posy>0</posy>
            <width>1236</width>
            <height>2</height>
            <texture>script.plex/white-square.png</texture>
            <colordiffuse>FF282828</colordiffuse>
        </control>
        <control type="label">
            <scroll>false</scroll>
            <posx>60</posx>
            <posy>0</posy>
            <width>1000</width>
            <height>87</height>
            <font>font12</font>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <label>[UPPERCASE]$INFO[Window.Property(hub.2143)][/UPPERCASE]</label>
        </control>
        <control type="list" id="2143">
            <posx>0</posx>
            <posy>30</posy>
            <width>1356</width>
            <height>440</height>
            <onleft>899</onleft>
            <onup>2142</onup>
            <ondown>2144</ondown>
            <scrolltime>200</scrolltime>
            <orientation>horizontal</orientation>
            <preloaditems>4</preloaditems>
            <!-- ITEM LAYOUT ########################################## -->
            <itemlayout width="304">
                <control type="group">
                   <posx>55</posx>
                    <posy>61</posy>
                    <control type="group">
                        <posx>5</posx>
                        <posy>5</posy>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>244</width>
                            <height>244</height>
                            <texture diffuse="script.plex/masks/role.png">$INFO[ListItem.Property(thumb.fallback)]</texture>
                        </control>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>244</width>
                            <height>244</height>
                            <texture background="true" diffuse="script.plex/masks/role.png">$INFO[ListItem.Thumb]</texture>
                            <aspectratio scalediffuse="false" aligny="top">scale</aspectratio>
                        </control>
                        <control type="label">
                            <scroll>false</scroll>
                            <posx>0</posx>
                            <posy>254</posy>
                            <width>244</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label]</label>
                        </control>
                        <control type="label">
                            <posx>0</posx>
                            <posy>282</posy>
                            <width>244</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label2]</label>
                        </control>
                    </control>
                </control>
            </itemlayout>

            <!-- FOCUSED LAYOUT ####################################### -->
            <focusedlayout width="304">
                <control type="group">
                    <posx>55</posx>
                    <posy>61</posy>
                    <control type="group">
                        <animation effect="zoom" start="100" end="110" time="100" center="127,127" reversible="false">Focus</animation>
                        <animation effect="zoom" start="110" end="100" time="100" center="127,127" reversible="false">UnFocus</animation>
                        <posx>0</posx>
                        <posy>0</posy>
                        <control type="image">
                            <visible>Control.HasFocus(2143)</visible>
                            <posx>-40</posx>
                            <posy>-40</posy>
                            <width>334</width>
                            <height>334</height>
                            <texture border="42">script.plex/buttons/role-shadow.png</texture>
                        </control>
                        <control type="group">
                            <posx>5</posx>
                            <posy>5</posy>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>244</width>
                                <height>244</height>
                                <texture diffuse="script.plex/masks/role.png">$INFO[ListItem.Property(thumb.fallback)]</texture>
                            </control>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>244</width>
                                <height>244</height>
                                <texture background="true" diffuse="script.plex/masks/role.png">$INFO[ListItem.Thumb]</texture>
                                <aspectratio scalediffuse="false" aligny="top">scale</aspectratio>
                            </control>
                            <control type="label">
                                <scroll>false</scroll>
                                <posx>0</posx>
                                <posy>254</posy>
                                <width>244</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label]</label>
                            </control>
                            <control type="label">
                                <posx>0</posx>
                                <posy>282</posy>
                                <width>244</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label2]</label>
                            </control>
                        </control>
                        <control type="image">
                            <visible>Control.HasFocus(2143)</visible>
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>254</width>
                            <height>254</height>
                            <texture>script.plex/buttons/role-selected.png</texture>
                        </control>
                    </control>
                </control>
            </focusedlayout>
        </control>
    </control>

    <control type="group" id="2044">
        <visible>Integer.IsGreater(Container(2144).NumItems,0) + String.IsEmpty(Window.Property(drawing))</visible>
        <width>1356</width>
        <height>420</height>
        <control type="image">
            <posx>60</posx>
            <posy>0</posy>
            <width>1236</width>
            <height>2</height>
            <texture>script.plex/white-square.png</texture>
            <colordiffuse>FF282828</colordiffuse>
        </control>
        <control type="label">
            <scroll>false</scroll>
            <posx>60</posx>
            <posy>0</posy>
            <width>1000</width>
            <height>87</height>
            <font>font12</font>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <label>[UPPERCASE]$INFO[Window.Property(hub.2144)][/UPPERCASE]</label>
        </control>
        <control type="list" id="2144">
            <posx>0</posx>
            <posy>30</posy>
            <width>1356</width>
            <height>440</height>
            <onleft>899</onleft>
            <onup>2143</onup>
            <ondown>2145</ondown>
            <scrolltime>200</scrolltime>
            <orientation>horizontal</orientation>
            <preloaditems>4</preloaditems>
            <!-- ITEM LAYOUT ########################################## -->
            <itemlayout width="240">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <posx>5</posx>
                        <posy>5</posy>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>180</width>
                            <height>270</height>
                            <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>180</width>
                            <height>270</height>
                            <texture background="true">$INFO[ListItem.Thumb]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="label">
                            <scroll>false</scroll>
                            <posx>0</posx>
                            <posy>280</posy>
                            <width>180</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <aligny>center</aligny>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label]</label>
                        </control>
                    </control>
                </control>
            </itemlayout>

            <!-- FOCUSED LAYOUT ####################################### -->
            <focusedlayout width="240">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <animation effect="zoom" start="100" end="110" time="100" center="95,140" reversible="false">Focus</animation>
                        <animation effect="zoom" start="110" end="100" time="100" center="95,140" reversible="false">UnFocus</animation>
                        <posx>0</posx>
                        <posy>0</posy>
                        <control type="image">
                            <visible>Control.HasFocus(2144)</visible>
                            <posx>-40</posx>
                            <posy>-40</posy>
                            <width>270</width>
                            <height>360</height>
                            <texture border="42">script.plex/drop-shadow.png</texture>
                        </control>
                        <control type="group">
                            <posx>5</posx>
                            <posy>5</posy>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>180</width>
                                <height>270</height>
                                <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>180</width>
                                <height>270</height>
                                <texture background="true">$INFO[ListItem.Thumb]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="label">
                                <scroll>false</scroll>
                                <posx>0</posx>
                                <posy>280</posy>
                                <width>180</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <aligny>center</aligny>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label]</label>
                            </control>
                        </control>
                        <control type="image">
                            <visible>Control.HasFocus(2144)</visible>
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>190</width>
                            <height>280</height>
                            <texture border="10">script.plex/home/selected.png</texture>
                        </control>
                    </control>
                </control>
            </focusedlayout>
        </control>
    </control>

    <control type="group" id="2045">
        <visible>Integer.IsGreater(Container(2145).NumItems,0) + String.IsEmpty(Window.Property(drawing))</visible>
        <width>1356</width>
        <height>420</height>
        <control type="image">
            <posx>60</posx>
            <posy>0</posy>
            <width>1236</width>
            <height>2</height>
            <texture>script.plex/white-square.png</texture>
            <colordiffuse>FF282828</colordiffuse>
        </control>
        <control type="label">
            <scroll>false</scroll>
            <posx>60</posx>
            <posy>0</posy>
            <width>1000</width>
            <height>87</height>
            <font>font12</font>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <label>[UPPERCASE]$INFO[Window.Property(hub.2145)][/UPPERCASE]</label>
        </control>
        <control type="list" id="2145">
            <posx>0</posx>
            <posy>30</posy>
            <width>1356</width>
            <height>440</height>
            <onleft>899</onleft>
            <onup>2144</onup>
            <ondown>2146</ondown>
            <scrolltime>200</scrolltime>
            <orientation>horizontal</orientation>
            <preloaditems>4</preloaditems>
            <!-- ITEM LAYOUT ########################################## -->
            <itemlayout width="330">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <posx>5</posx>
                        <posy>5</posy>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>270</width>
                            <height>270</height>
                            <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>270</width>
                            <height>270</height>
                            <texture background="true">$INFO[ListItem.Thumb]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="label">
                            <scroll>false</scroll>
                            <posx>0</posx>
                            <posy>280</posy>
                            <width>270</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <aligny>center</aligny>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label]</label>
                        </control>
                    </control>
                </control>
            </itemlayout>

            <!-- FOCUSED LAYOUT ####################################### -->
            <focusedlayout width="330">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <animation effect="zoom" start="100" end="110" time="100" center="140,140" reversible="false">Focus</animation>
                        <animation effect="zoom" start="110" end="100" time="100" center="140,140" reversible="false">UnFocus</animation>
                        <posx>0</posx>
                        <posy>0</posy>
                        <control type="image">
                            <visible>Control.HasFocus(2145)</visible>
                            <posx>-40</posx>
                            <posy>-40</posy>
                            <width>360</width>
                            <height>360</height>
                            <texture border="42">script.plex/drop-shadow.png</texture>
                        </control>
                        <control type="group">
                            <posx>5</posx>
                            <posy>5</posy>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>270</width>
                                <height>270</height>
                                <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>270</width>
                                <height>270</height>
                                <texture background="true">$INFO[ListItem.Thumb]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="label">
                                <scroll>false</scroll>
                                <posx>0</posx>
                                <posy>280</posy>
                                <width>270</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <aligny>center</aligny>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label]</label>
                            </control>
                        </control>
                        <control type="image">
                            <visible>Control.HasFocus(2145)</visible>
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>280</width>
                            <height>280</height>
                            <texture border="10">script.plex/home/selected.png</texture>
                        </control>
                    </control>
                </control>
            </focusedlayout>
        </control>
    </control>

    <control type="group" id="2046">
        <visible>Integer.IsGreater(Container(2146).NumItems,0) + String.IsEmpty(Window.Property(drawing))</visible>
        <width>1356</width>
        <height>320</height>
        <control type="image">
            <posx>60</posx>
            <posy>0</posy>
            <width>1236</width>
            <height>2</height>
            <texture>script.plex/white-square.png</texture>
            <colordiffuse>FF282828</colordiffuse>
        </control>
        <control type="label">
            <scroll>false</scroll>
            <posx>60</posx>
            <posy>0</posy>
            <width>1000</width>
            <height>87</height>
            <font>font12</font>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <label>[UPPERCASE]$INFO[Window.Property(hub.2146)][/UPPERCASE]</label>
        </control>
        <control type="list" id="2146">
            <posx>0</posx>
            <posy>30</posy>
            <width>1356</width>
            <height>440</height>
            <onleft>899</onleft>
            <onup>2145</onup>
            <ondown>2147</ondown>
            <scrolltime>200</scrolltime>
            <orientation>horizontal</orientation>
            <preloaditems>4</preloaditems>
            <!-- ITEM LAYOUT ########################################## -->
            <itemlayout width="360">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <posx>5</posx>
                        <posy>5</posy>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>300</width>
                            <height>169</height>
                            <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>300</width>
                            <height>169</height>
                            <texture background="true">$INFO[ListItem.Thumb]</texture>
                            <aspectratio>scale</aspectratio>
                        </control>
                        <control type="label">
                            <scroll>false</scroll>
                            <posx>0</posx>
                            <posy>179</posy>
                            <width>300</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <aligny>center</aligny>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label]</label>
                        </control>
                    </control>
                </control>
            </itemlayout>

            <!-- FOCUSED LAYOUT ####################################### -->
            <focusedlayout width="360">
                <control type="group">
                    <posx>55</posx>
                    <posy>64</posy>
                    <control type="group">
                        <animation effect="zoom" start="100" end="110" time="100" center="155,89.5" reversible="false">Focus</animation>
                        <animation effect="zoom" start="110" end="100" time="100" center="155,89.5" reversible="false">UnFocus</animation>
                        <posx>0</posx>
                        <posy>0</posy>
                        <control type="image">
                            <visible>Control.HasFocus(2146)</visible>
                            <posx>-40</posx>
                            <posy>-40</posy>
                            <width>390</width>
                            <height>259</height>
                            <texture border="42">script.plex/drop-shadow.png</texture>
                        </control>
                        <control type="group">
                            <posx>5</posx>
                            <posy>5</posy>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>300</width>
                                <height>169</height>
                                <texture>$INFO[ListItem.Property(thumb.fallback)]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>300</width>
                                <height>169</height>
                                <texture background="true">$INFO[ListItem.Thumb]</texture>
                                <aspectratio>scale</aspectratio>
                            </control>
                            <control type="label">
                                <scroll>false</scroll>
                                <posx>0</posx>
                                <posy>179</posy>
                                <width>300</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <aligny>center</aligny>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label]</label>
                            </control>
                        </control>
                        <control type="image">
                            <visible>Control.HasFocus(2146)</visible>
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>310</width>
                            <height>179</height>
                            <texture border="10">script.plex/home/selected.png</texture>
                        </control>
                    </control>
                </control>
            </focusedlayout>
        </control>
    </control>

    <control type="group" id="2047">
        <visible>Integer.IsGreater(Container(2147).NumItems,0) + String.IsEmpty(Window.Property(drawing))</visible>
        <width>1356</width>
        <height>420</height>
        <control type="image">
            <posx>60</posx>
            <posy>0</posy>
            <width>1236</width>
            <height>2</height>
            <texture>script.plex/white-square.png</texture>
            <colordiffuse>FF282828</colordiffuse>
        </control>
        <control type="label">
            <scroll>false</scroll>
            <posx>60</posx>
            <posy>0</posy>
            <width>1000</width>
            <height>87</height>
            <font>font12</font>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <label>[UPPERCASE]$INFO[Window.Property(hub.2147)][/UPPERCASE]</label>
        </control>
        <control type="list" id="2147">
            <posx>0</posx>
            <posy>30</posy>
            <width>1356</width>
            <height>440</height>
            <onleft>899</onleft>
            <onup>2146</onup>
            <scrolltime>200</scrolltime>
            <orientation>horizontal</orientation>
            <preloaditems>4</preloaditems>
            <!-- ITEM LAYOUT ########################################## -->
            <itemlayout width="304">
                <control type="group">
                   <posx>55</posx>
                    <posy>61</posy>
                    <control type="group">
                        <posx>5</posx>
                        <posy>5</posy>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>244</width>
                            <height>244</height>
                            <texture diffuse="script.plex/masks/role.png">$INFO[ListItem.Property(thumb.fallback)]</texture>
                        </control>
                        <control type="image">
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>244</width>
                            <height>244</height>
                            <texture background="true" diffuse="script.plex/masks/role.png">$INFO[ListItem.Thumb]</texture>
                            <aspectratio scalediffuse="false" aligny="top">scale</aspectratio>
                        </control>
                        <control type="label">
                            <scroll>false</scroll>
                            <posx>0</posx>
                            <posy>254</posy>
                            <width>244</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label]</label>
                        </control>
                        <control type="label">
                            <posx>0</posx>
                            <posy>282</posy>
                            <width>244</width>
                            <height>35</height>
                            <font>font10</font>
                            <align>center</align>
                            <textcolor>FFFFFFFF</textcolor>
                            <label>$INFO[ListItem.Label2]</label>
                        </control>
                    </control>
                </control>
            </itemlayout>

            <!-- FOCUSED LAYOUT ####################################### -->
            <focusedlayout width="304">
                <control type="group">
                    <posx>55</posx>
                    <posy>61</posy>
                    <control type="group">
                        <animation effect="zoom" start="100" end="110" time="100" center="127,127" reversible="false">Focus</animation>
                        <animation effect="zoom" start="110" end="100" time="100" center="127,127" reversible="false">UnFocus</animation>
                        <posx>0</posx>
                        <posy>0</posy>
                        <control type="image">
                            <visible>Control.HasFocus(2147)</visible>
                            <posx>-40</posx>
                            <posy>-40</posy>
                            <width>334</width>
                            <height>334</height>
                            <texture border="42">script.plex/buttons/role-shadow.png</texture>
                        </control>
                        <control type="group">
                            <posx>5</posx>
                            <posy>5</posy>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>244</width>
                                <height>244</height>
                                <texture diffuse="script.plex/masks/role.png">$INFO[ListItem.Property(thumb.fallback)]</texture>
                            </control>
                            <control type="image">
                                <posx>0</posx>
                                <posy>0</posy>
                                <width>244</width>
                                <height>244</height>
                                <texture background="true" diffuse="script.plex/masks/role.png">$INFO[ListItem.Thumb]</texture>
                                <aspectratio scalediffuse="false" aligny="top">scale</aspectratio>
                            </control>
                            <control type="label">
                                <scroll>false</scroll>
                                <posx>0</posx>
                                <posy>254</posy>
                                <width>244</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label]</label>
                            </control>
                            <control type="label">
                                <posx>0</posx>
                                <posy>282</posy>
                                <width>244</width>
                                <height>35</height>
                                <font>font10</font>
                                <align>center</align>
                                <textcolor>FFFFFFFF</textcolor>
                                <label>$INFO[ListItem.Label2]</label>
                            </control>
                        </control>
                        <control type="image">
                            <visible>Control.HasFocus(2147)</visible>
                            <posx>0</posx>
                            <posy>0</posy>
                            <width>254</width>
                            <height>254</height>
                            <texture>script.plex/buttons/role-selected.png</texture>
                        </control>
                    </control>
                </control>
            </focusedlayout>
        </control>
    </control>

</control>
{% endblock controls %}
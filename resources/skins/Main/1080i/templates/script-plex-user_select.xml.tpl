{% extends "base.xml.tpl" %}
{% block headers %}<defaultcontrol>100</defaultcontrol>{% endblock %}
{% block backgroundcolor %}<backgroundcolor>$INFO[Window.Property(background_colour_opaque)]</backgroundcolor>{% endblock %}
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
</control>

<control type="group">
    <animation effect="fade" time="100" start="100" end="20" condition="ControlGroup(400).HasFocus(0)">Conditional</animation>
    <visible>Player.HasAudio + String.IsEmpty(Window(10000).Property(script.plex.theme_playing))</visible>
    <posx>441</posx>
    <posy>780</posy>

    <control type="image">
        <posx>0</posx>
        <posy>0</posy>
        <width>225</width>
        <height>225</height>
        <texture>$INFO[Player.Art(thumb)]</texture>
    </control>

    <control type="group">
        <posx>255</posx>
        <posy>0</posy>
        <control type="label">
            <posx>0</posx>
            <posy>0</posy>
            <width>783</width>
            <height>40</height>
            <font>font10</font>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <info>MusicPlayer.Artist</info>
        </control>
        <control type="label">
            <posx>0</posx>
            <posy>40</posy>
            <width>783</width>
            <height>40</height>
            <font>font10</font>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <info>MusicPlayer.Album</info>
        </control>
        <control type="label">
            <posx>0</posx>
            <posy>80</posy>
            <width>783</width>
            <height>40</height>
            <font>font10</font>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <label>[B]$INFO[MusicPlayer.Title][/B]</label>
        </control>
    </control>

    <control type="grouplist" id="600">
        <defaultcontrol>406</defaultcontrol>
        <hitrect x="460" y="998" w="1000" h="55" />
        <posx>255</posx>
        <posy>134</posy>
        <width>783</width>
        <height>124</height>
        <align>center</align>
        <onup>101</onup>
        <itemgap>-40</itemgap>
        <orientation>horizontal</orientation>
        <scrolltime tween="quadratic" easing="out">200</scrolltime>
        <usecontrolcoords>true</usecontrolcoords>

        <control type="button" id="404">
            <enable>MusicPlayer.HasPrevious</enable>
            <animation effect="zoom" start="100" end="124" time="100" center="93,50" reversible="false">Focus</animation>
            <animation effect="zoom" start="124" end="100" time="100" center="93,50" reversible="false">UnFocus</animation>
            <hitrect x="28" y="28" w="69" h="45" />
            <posx>30</posx>
            <posy>0</posy>
            <width>125</width>
            <height>101</height>
            <font>font12</font>
            <texturefocus flipx="true" colordiffuse="FFE5A00D">script.plex/buttons/next-focus.png</texturefocus>
            <texturenofocus flipx="true" colordiffuse="99FFFFFF">script.plex/buttons/next.png</texturenofocus>
            <onclick>PlayerControl(Previous)</onclick>
            <label> </label>
        </control>
        <control type="togglebutton" id="406">
            <animation effect="zoom" start="100" end="124" time="100" center="63,50" reversible="false">Focus</animation>
            <animation effect="zoom" start="124" end="100" time="100" center="63,50" reversible="false">UnFocus</animation>
            <hitrect x="28" y="28" w="69" h="45" />
            <posx>0</posx>
            <posy>0</posy>
            <width>125</width>
            <height>101</height>
            <font>font12</font>
            <texturefocus colordiffuse="FFE5A00D">script.plex/buttons/pause-focus.png</texturefocus>
            <texturenofocus colordiffuse="99FFFFFF">script.plex/buttons/pause.png</texturenofocus>
            <usealttexture>Player.Paused | Player.Forwarding | Player.Rewinding</usealttexture>
            <alttexturefocus colordiffuse="FFE5A00D">script.plex/buttons/play-focus.png</alttexturefocus>
            <alttexturenofocus colordiffuse="99FFFFFF">script.plex/buttons/play.png</alttexturenofocus>
            <onclick>PlayerControl(Play)</onclick>
            <label> </label>
        </control>
        <control type="button" id="409">
            <enable>MusicPlayer.HasNext</enable>
            <animation effect="zoom" start="100" end="124" time="100" center="63,50" reversible="false">Focus</animation>
            <animation effect="zoom" start="124" end="100" time="100" center="63,50" reversible="false">UnFocus</animation>
            <hitrect x="28" y="28" w="69" h="45" />
            <posx>0</posx>
            <posy>0</posy>
            <width>125</width>
            <height>101</height>
            <font>font12</font>
            <texturefocus colordiffuse="FFE5A00D">script.plex/buttons/next-focus.png</texturefocus>
            <texturenofocus colordiffuse="99FFFFFF">script.plex/buttons/next.png</texturenofocus>
            <onclick>PlayerControl(Next)</onclick>
            <label> </label>
        </control>
        <control type="button" id="407">
            <animation effect="zoom" start="100" end="124" time="100" center="63,50" reversible="false">Focus</animation>
            <animation effect="zoom" start="124" end="100" time="100" center="63,50" reversible="false">UnFocus</animation>
            <hitrect x="28" y="28" w="69" h="45" />
            <posx>0</posx>
            <posy>0</posy>
            <width>125</width>
            <height>101</height>
            <font>font12</font>
            <texturefocus colordiffuse="FFE5A00D">script.plex/buttons/stop-focus.png</texturefocus>
            <texturenofocus colordiffuse="99FFFFFF">script.plex/buttons/stop.png</texturenofocus>
            <onclick>PlayerControl(Stop)</onclick>
            <label> </label>
        </control>
    </control>

    <control type="label">
        <posx>255</posx>
        <posy>177</posy>
        <width>783</width>
        <height>40</height>
        <font>font10</font>
        <align>left</align>
        <aligny>center</aligny>
        <textcolor>FFFFFFFF</textcolor>
        <info>MusicPlayer.Time</info>
    </control>
    <control type="label">
        <posx>1038</posx>
        <posy>177</posy>
        <width>783</width>
        <height>40</height>
        <font>font10</font>
        <align>right</align>
        <aligny>center</aligny>
        <textcolor>FFFFFFFF</textcolor>
        <info>MusicPlayer.TimeRemaining</info>
    </control>


    <control type="progress">
        <description>Progressbar</description>
        <posx>255</posx>
        <posy>222</posy>
        <width>783</width>
        <height>3</height>
        <texturebg colordiffuse="9AFFFFFF">script.plex/white-square-1px.png</texturebg>
        <lefttexture>-</lefttexture>
        <midtexture colordiffuse="FFCC7B19">script.plex/white-square-1px.png</midtexture>
        <righttexture>-</righttexture>
        <overlaytexture>-</overlaytexture>
        <info>Player.Progress</info>
    </control>
</control>

<control type="image" id="110">
    <visible>ControlGroup(400).HasFocus(0) + String.IsEmpty(Window.Property(busy))</visible>
    <posx>770</posx>
    <posy>275</posy>
    <width>380</width>
    <height>695</height>
    <texture border="42">script.plex/drop-shadow.png</texture>
</control>

<control type="group" id="100">
    <posx>0</posx>
    <posy>315</posy>
    <defaultcontrol always="true">101</defaultcontrol>

    <control type="fixedlist" id="101">
        <posx>-180</posx>
        <posy>-40</posy>
        <width>2100</width>
        <height>455</height>
        <scrolltime>200</scrolltime>
        <onup>500</onup>
        <ondown condition="Player.HasAudio">600</ondown>
        <ondown condition="!String.IsEmpty(Container(101).ListItem.Property(protected))">400</ondown>
        <orientation>horizontal</orientation>
        <focusposition>3</focusposition>

        <!-- ITEM LAYOUT ########################################## -->
        <itemlayout width="330">

            <control type="group">
                <visible>!String.IsEmpty(ListItem.Property(empty))</visible>
                <posx>0</posx>
                <posy>40</posy>
                <control type="image">
                    <visible>Control.HasFocus(101) | ControlGroup(400).HasFocus(0)</visible>
                    <posx>75</posx>
                    <posy>75</posy>
                    <width>150</width>
                    <height>150</height>
                    <texture>script.plex/user_select/refresh.png</texture>
                    <colordiffuse>FFA0A0A0</colordiffuse>
                </control>
            </control>

            <control type="group">
                <visible>String.IsEmpty(ListItem.Property(empty))</visible>
                <posx>0</posx>
                <posy>40</posy>
                <width>300</width>
                <height>300</height>
                <control type="image">
                    <posx>0</posx>
                    <posy>0</posy>
                    <texture diffuse="script.plex/user_select/item-background.png" fallback="script.plex/gray-square.png">$INFO[ListItem.Property(back.image)]</texture>
                    <colordiffuse>FFA0A0A0</colordiffuse>
                </control>

                <control type="image">
                    <posx>45</posx>
                    <posy>45</posy>
                    <width>210</width>
                    <height>210</height>
                    <texture>script.plex/user_select/avatar-background.png</texture>
                    <colordiffuse>E0C0C0C0</colordiffuse>
                </control>
                <control type="image">
                    <posx>54</posx>
                    <posy>54</posy>
                    <width>192</width>
                    <height>192</height>
                    <texture diffuse="script.plex/user_select/avatar-diffuse.png" fallback="script.plex/gray-square.png">$INFO[ListItem.Thumb]</texture>
                </control>
                <control type="label">
                    <visible>String.IsEmpty(ListItem.Thumb)</visible>
                    <posx>54</posx>
                    <posy>54</posy>
                    <width>192</width>
                    <height>192</height>
                    <font>WeatherTemp</font>
                    <align>center</align>
                    <aligny>center</aligny>
                    <textcolor>FFFFFFFF</textcolor>
                    <label>$INFO[ListItem.Label2]</label>
                </control>

                <control type="group">
                    <visible>!String.IsEmpty(ListItem.Property(protected))</visible>
                    <posx>15</posx>
                    <posy>231</posy>
                    <control type="image">
                        <posx>0</posx>
                        <posy>0</posy>
                        <width>54</width>
                        <height>54</height>
                        <texture>script.plex/user_select/protected-back.png</texture>
                        <colordiffuse>A0000000</colordiffuse>
                    </control>
                    <control type="image">
                        <posx>0</posx>
                        <posy>0</posy>
                        <width>54</width>
                        <height>54</height>
                        <texture>script.plex/user_select/protected-icon.png</texture>
                    </control>
                </control>

                <control type="group">
                    <visible>!String.IsEmpty(ListItem.Property(admin))</visible>
                    <posx>231</posx>
                    <posy>231</posy>
                    <control type="image">
                        <posx>0</posx>
                        <posy>0</posy>
                        <width>54</width>
                        <height>54</height>
                        <texture>script.plex/user_select/admin-back.png</texture>
                        <colordiffuse>A0000000</colordiffuse>
                    </control>
                    <control type="image">
                        <posx>0</posx>
                        <posy>0</posy>
                        <width>54</width>
                        <height>54</height>
                        <texture>script.plex/user_select/admin-icon.png</texture>
                    </control>
                </control>
            </control>

        </itemlayout>

        <!-- FOCUSED LAYOUT ####################################### -->
        <focusedlayout width="330">

            <control type="group">
                <visible>!String.IsEmpty(ListItem.Property(empty))</visible>
                <posx>0</posx>
                <posy>40</posy>
                <control type="image">
                    <visible>Control.HasFocus(101) | ControlGroup(400).HasFocus(0)</visible>
                    <posx>75</posx>
                    <posy>75</posy>
                    <width>150</width>
                    <height>150</height>
                    <texture>script.plex/user_select/refresh.png</texture>
                    <colordiffuse>FFFFFFFF</colordiffuse>
                </control>
            </control>

            <control type="group">
                <visible>String.IsEmpty(ListItem.Property(empty))</visible>
                <posx>0</posx>
                <posy>40</posy>
                <control type="image" id="110">
                    <visible>Control.HasFocus(101)</visible>
                    <posx>-40</posx>
                    <posy>-40</posy>
                    <width>380</width>
                    <height>455</height>
                    <texture border="42">script.plex/drop-shadow.png</texture>
                </control>
                <control type="image">
                    <visible>Control.HasFocus(101) | ControlGroup(400).HasFocus(0)</visible>
                    <posx>0</posx>
                    <posy>0</posy>
                    <width>300</width>
                    <height>300</height>
                    <texture diffuse="script.plex/user_select/item-background-top.png" fallback="script.plex/gray-square.png">$INFO[ListItem.Property(back.image)]</texture>
                    <colordiffuse>FFA0A0A0</colordiffuse>
                </control>
                <control type="image">
                    <visible>!Control.HasFocus(101) + !ControlGroup(400).HasFocus(0)</visible>
                    <posx>0</posx>
                    <posy>0</posy>
                    <width>300</width>
                    <height>300</height>
                    <texture diffuse="script.plex/user_select/item-background.png" fallback="script.plex/gray-square.png">$INFO[ListItem.Property(back.image)]</texture>
                    <colordiffuse>FFA0A0A0</colordiffuse>
                </control>
                <control type="group">
                    <visible>Control.HasFocus(101)</visible>
                    <control type="image">
                        <posx>0</posx>
                        <posy>300</posy>
                        <width>300</width>
                        <height>75</height>
                        <texture>script.plex/user_select/item-background-bottom.png</texture>
                        <colordiffuse>FF000000</colordiffuse>
                    </control>
                    <control type="image">
                        <posx>0</posx>
                        <posy>300</posy>
                        <width>300</width>
                        <height>75</height>
                        <texture diffuse="script.plex/user_select/item-background-bottom.png" fallback="script.plex/gray-square.png">$INFO[ListItem.Property(back.image)]</texture>
                        <aspectratio scalediffuse="false">stretch</aspectratio>
                        <colordiffuse>40FFFFFF</colordiffuse>
                    </control>
                </control>

                <control type="image">
                    <visible>!Control.HasFocus(101) + !ControlGroup(400).HasFocus(0)</visible>
                    <posx>45</posx>
                    <posy>45</posy>
                    <width>210</width>
                    <height>210</height>
                    <texture>script.plex/user_select/avatar-background.png</texture>
                    <colordiffuse>E0C0C0C0</colordiffuse>
                </control>
                <control type="image">
                    <visible>ControlGroup(400).HasFocus(0)</visible>
                    <posx>45</posx>
                    <posy>45</posy>
                    <width>210</width>
                    <height>210</height>
                    <texture>script.plex/user_select/avatar-background.png</texture>
                    <colordiffuse>FFCC7B19</colordiffuse>
                </control>
                <control type="image">
                    <visible>Control.HasFocus(101)</visible>
                    <posx>45</posx>
                    <posy>45</posy>
                    <width>210</width>
                    <height>210</height>
                    <texture>script.plex/user_select/avatar-background.png</texture>
                    <colordiffuse>FFE5A00D</colordiffuse>
                </control>

                <control type="image">
                    <posx>54</posx>
                    <posy>54</posy>
                    <width>192</width>
                    <height>192</height>
                    <texture diffuse="script.plex/user_select/avatar-diffuse.png" fallback="script.plex/gray-square.png">$INFO[ListItem.Thumb]</texture>
                </control>
                <control type="label">
                    <visible>String.IsEmpty(ListItem.Thumb)</visible>
                    <posx>54</posx>
                    <posy>54</posy>
                    <width>192</width>
                    <height>192</height>
                    <font>WeatherTemp</font>
                    <align>center</align>
                    <aligny>center</aligny>
                    <textcolor>FFFFFFFF</textcolor>
                    <label>$INFO[ListItem.Label2]</label>
                </control>

                <control type="group">
                    <visible>!String.IsEmpty(ListItem.Property(protected))</visible>
                    <posx>15</posx>
                    <posy>231</posy>
                    <control type="image">
                        <posx>0</posx>
                        <posy>0</posy>
                        <width>54</width>
                        <height>54</height>
                        <texture>script.plex/user_select/protected-back.png</texture>
                        <colordiffuse>A0000000</colordiffuse>
                    </control>
                    <control type="image">
                        <posx>0</posx>
                        <posy>0</posy>
                        <width>54</width>
                        <height>54</height>
                        <texture>script.plex/user_select/protected-icon.png</texture>
                    </control>
                </control>

                <control type="group">
                    <visible>!String.IsEmpty(ListItem.Property(admin))</visible>
                    <posx>231</posx>
                    <posy>231</posy>
                    <control type="image">
                        <posx>0</posx>
                        <posy>0</posy>
                        <width>54</width>
                        <height>54</height>
                        <texture>script.plex/user_select/admin-back.png</texture>
                        <colordiffuse>A0000000</colordiffuse>
                    </control>
                    <control type="image">
                        <posx>0</posx>
                        <posy>0</posy>
                        <width>54</width>
                        <height>54</height>
                        <texture>script.plex/user_select/admin-icon.png</texture>
                    </control>
                </control>

                <control type="label">
                    <visible>Control.HasFocus(101)</visible>
                    <posx>10</posx>
                    <posy>300</posy>
                    <width>280</width>
                    <height>75</height>
                    <font>font13</font>
                    <align>center</align>
                    <aligny>center</aligny>
                    <textcolor>FFCC7B19</textcolor>
                    <label>$INFO[ListItem.Label]</label>
                </control>
            </control>

        </focusedlayout>
    </control>

    <control type="group" id="400">
        <defaultcontrol always="true">205</defaultcontrol>
        <visible allowhiddenfocus="true">!String.IsEmpty(Container(101).ListItem.Property(protected)) + ControlGroup(400).HasFocus(0) + !String.IsEmpty(Window.Property(initialized))</visible>
        <posx>810</posx>
        <posy>375</posy>
        <control type="button">
            <posx>0</posx>
            <posy>0</posy>
            <width>300</width>
            <height>239</height>
            <onleft>400</onleft>
            <onright>400</onright>
            <onup>400</onup>
            <ondown>400</ondown>
            <texturefocus>-</texturefocus>
            <texturenofocus>-</texturenofocus>
            <label> </label>
        </control>
        <control type="image">
            <posx>0</posx>
            <posy>-75</posy>
            <width>300</width>
            <height>75</height>
            <texture>script.plex/white-square.png</texture>
            <colordiffuse>FF000000</colordiffuse>
        </control>
        <control type="image">
            <posx>0</posx>
            <posy>-75</posy>
            <width>300</width>
            <height>75</height>
            <texture fallback="script.plex/gray-square.png">$INFO[Container(101).ListItem.Property(back.image)]</texture>
            <colordiffuse>40FFFFFF</colordiffuse>
        </control>
        <control type="label">
            <visible>String.IsEmpty(Container(101).ListItem.Property(editing.pin))</visible>
            <posx>0</posx>
            <posy>-75</posy>
            <width>300</width>
            <height>75</height>
            <font>font13</font>
            <align>center</align>
            <aligny>center</aligny>
            <textcolor>FFCC7B19</textcolor>
            <label>$INFO[Container(101).ListItem.Label]</label>
        </control>
        <control type="label">
            <visible>!String.IsEmpty(Container(101).ListItem.Property(editing.pin))</visible>
            <posx>0</posx>
            <posy>-75</posy>
            <width>300</width>
            <height>75</height>
            <font>font13</font>
            <align>center</align>
            <aligny>center</aligny>
            <textcolor>FFCC7B19</textcolor>
            <label>[B]$INFO[Container(101).ListItem.Property(pin)][/B]</label>
        </control>
        <control type="image">
            <posx>0</posx>
            <posy>0</posy>
            <width>300</width>
            <height>239</height>
            <texture>script.plex/white-square.png</texture>
            <colordiffuse>FF000000</colordiffuse>
        </control>
        <control type="group" id="300">
            <defaultcontrol>205</defaultcontrol>
            <control type="group" id="200">
                <defaultcontrol>205</defaultcontrol>
                <control type="button" id="201">
                    <posx>0</posx>
                    <posy>0</posy>
                    <width>73</width>
                    <height>58</height>
                    <onright>202</onright>
                    <onup>101</onup>
                    <ondown>204</ondown>
                    <font>font12</font>
                    <textcolor>FFFFFFFF</textcolor>
                    <focusedcolor>FF000000</focusedcolor>
                    <align>center</align>
                    <aligny>center</aligny>
                    <texturefocus colordiffuse="FFCC7B19">script.plex/white-square.png</texturefocus>
                    <texturenofocus colordiffuse="FF333333">script.plex/white-square.png</texturenofocus>
                    <textoffsetx>0</textoffsetx>
                    <textoffsety>0</textoffsety>
                    <label>[B]1[/B]</label>
                </control>
                <control type="button" id="202">
                    <posx>75</posx>
                    <posy>0</posy>
                    <width>73</width>
                    <height>58</height>
                    <onright>203</onright>
                    <onleft>201</onleft>
                    <onup>101</onup>
                    <ondown>205</ondown>
                    <font>font12</font>
                    <textcolor>FFFFFFFF</textcolor>
                    <focusedcolor>FF000000</focusedcolor>
                    <align>center</align>
                    <aligny>center</aligny>
                    <texturefocus colordiffuse="FFCC7B19">script.plex/white-square.png</texturefocus>
                    <texturenofocus colordiffuse="FF333333">script.plex/white-square.png</texturenofocus>
                    <textoffsetx>0</textoffsetx>
                    <textoffsety>0</textoffsety>
                    <label>[B]2[/B]</label>
                </control>
                <control type="button" id="203">
                    <posx>150</posx>
                    <posy>0</posy>
                    <width>73</width>
                    <height>58</height>
                    <onright>211</onright>
                    <onleft>202</onleft>
                    <onup>101</onup>
                    <ondown>206</ondown>
                    <font>font12</font>
                    <textcolor>FFFFFFFF</textcolor>
                    <focusedcolor>FF000000</focusedcolor>
                    <align>center</align>
                    <aligny>center</aligny>
                    <texturefocus colordiffuse="FFCC7B19">script.plex/white-square.png</texturefocus>
                    <texturenofocus colordiffuse="FF333333">script.plex/white-square.png</texturenofocus>
                    <textoffsetx>0</textoffsetx>
                    <textoffsety>0</textoffsety>
                    <label>[B]3[/B]</label>
                </control>
                <control type="button" id="204">
                    <posx>0</posx>
                    <posy>60</posy>
                    <width>73</width>
                    <height>58</height>
                    <onright>205</onright>
                    <ondown>207</ondown>
                    <onup>201</onup>
                    <font>font12</font>
                    <textcolor>FFFFFFFF</textcolor>
                    <focusedcolor>FF000000</focusedcolor>
                    <align>center</align>
                    <aligny>center</aligny>
                    <texturefocus colordiffuse="FFCC7B19">script.plex/white-square.png</texturefocus>
                    <texturenofocus colordiffuse="FF333333">script.plex/white-square.png</texturenofocus>
                    <textoffsetx>0</textoffsetx>
                    <textoffsety>0</textoffsety>
                    <label>[B]4[/B]</label>
                </control>
                <control type="button" id="205">
                    <posx>75</posx>
                    <posy>60</posy>
                    <width>73</width>
                    <height>58</height>
                    <onright>206</onright>
                    <onleft>204</onleft>
                    <ondown>208</ondown>
                    <onup>202</onup>
                    <font>font12</font>
                    <textcolor>FFFFFFFF</textcolor>
                    <focusedcolor>FF000000</focusedcolor>
                    <align>center</align>
                    <aligny>center</aligny>
                    <texturefocus colordiffuse="FFCC7B19">script.plex/white-square.png</texturefocus>
                    <texturenofocus colordiffuse="FF333333">script.plex/white-square.png</texturenofocus>
                    <textoffsetx>0</textoffsetx>
                    <textoffsety>0</textoffsety>
                    <label>[B]5[/B]</label>
                </control>
                <control type="button" id="206">
                    <posx>150</posx>
                    <posy>60</posy>
                    <width>73</width>
                    <height>58</height>
                    <onright>211</onright>
                    <onleft>205</onleft>
                    <ondown>209</ondown>
                    <onup>203</onup>
                    <font>font12</font>
                    <textcolor>FFFFFFFF</textcolor>
                    <focusedcolor>FF000000</focusedcolor>
                    <align>center</align>
                    <aligny>center</aligny>
                    <texturefocus colordiffuse="FFCC7B19">script.plex/white-square.png</texturefocus>
                    <texturenofocus colordiffuse="FF333333">script.plex/white-square.png</texturenofocus>
                    <textoffsetx>0</textoffsetx>
                    <textoffsety>0</textoffsety>
                    <label>[B]6[/B]</label>
                </control>
                <control type="button" id="207">
                    <posx>0</posx>
                    <posy>120</posy>
                    <width>73</width>
                    <height>58</height>
                    <onright>208</onright>
                    <ondown>210</ondown>
                    <onup>204</onup>
                    <font>font12</font>
                    <textcolor>FFFFFFFF</textcolor>
                    <focusedcolor>FF000000</focusedcolor>
                    <align>center</align>
                    <aligny>center</aligny>
                    <texturefocus colordiffuse="FFCC7B19">script.plex/white-square.png</texturefocus>
                    <texturenofocus colordiffuse="FF333333">script.plex/white-square.png</texturenofocus>
                    <textoffsetx>0</textoffsetx>
                    <textoffsety>0</textoffsety>
                    <label>[B]7[/B]</label>
                </control>
                <control type="button" id="208">
                    <posx>75</posx>
                    <posy>120</posy>
                    <width>73</width>
                    <height>58</height>
                    <onright>209</onright>
                    <onleft>207</onleft>
                    <ondown>210</ondown>
                    <onup>205</onup>
                    <font>font12</font>
                    <textcolor>FFFFFFFF</textcolor>
                    <focusedcolor>FF000000</focusedcolor>
                    <align>center</align>
                    <aligny>center</aligny>
                    <texturefocus colordiffuse="FFCC7B19">script.plex/white-square.png</texturefocus>
                    <texturenofocus colordiffuse="FF333333">script.plex/white-square.png</texturenofocus>
                    <textoffsetx>0</textoffsetx>
                    <textoffsety>0</textoffsety>
                    <label>[B]8[/B]</label>
                </control>
                <control type="button" id="209">
                    <posx>150</posx>
                    <posy>120</posy>
                    <width>73</width>
                    <height>58</height>
                    <onright>211</onright>
                    <onleft>208</onleft>
                    <ondown>210</ondown>
                    <onup>206</onup>
                    <font>font12</font>
                    <textcolor>FFFFFFFF</textcolor>
                    <focusedcolor>FF000000</focusedcolor>
                    <align>center</align>
                    <aligny>center</aligny>
                    <texturefocus colordiffuse="FFCC7B19">script.plex/white-square.png</texturefocus>
                    <texturenofocus colordiffuse="FF333333">script.plex/white-square.png</texturenofocus>
                    <textoffsetx>0</textoffsetx>
                    <textoffsety>0</textoffsety>
                    <label>[B]9[/B]</label>
                </control>
            </control>
            <control type="button" id="210">
                <posx>0</posx>
                <posy>180</posy>
                <width>223</width>
                <height>59</height>
                <onright>211</onright>
                <onup>200</onup>
                <font>font12</font>
                <textcolor>FFFFFFFF</textcolor>
                <focusedcolor>FF000000</focusedcolor>
                <align>center</align>
                <aligny>center</aligny>
                <texturefocus colordiffuse="FFCC7B19">script.plex/white-square.png</texturefocus>
                <texturenofocus colordiffuse="FF333333">script.plex/white-square.png</texturenofocus>
                <textoffsetx>0</textoffsetx>
                <textoffsety>0</textoffsety>
                <label>[B]0[/B]</label>
            </control>
        </control>
        <control type="button" id="211">
            <posx>225</posx>
            <posy>0</posy>
            <width>75</width>
            <height>239</height>
            <onleft>300</onleft>
            <onup>101</onup>
            <font>font12</font>
            <textcolor>FFFFFFFF</textcolor>
            <focusedcolor>FF000000</focusedcolor>
            <align>center</align>
            <aligny>center</aligny>
            <texturefocus>script.plex/user_select/backspace.png</texturefocus>
            <texturenofocus>script.plex/user_select/backspace_nf.png</texturenofocus>
            <textoffsetx>0</textoffsetx>
            <textoffsety>0</textoffsety>
            <label> </label>
        </control>
    </control>

</control>

<control type="group">
    <defaultcontrol always="true">201</defaultcontrol>
    <posx>0</posx>
    <posy>0</posy>
    <width>1920</width>
    <height>135</height>
    <control type="image">
        <posx>0</posx>
        <posy>0</posy>
        <width>1920</width>
        <height>135</height>
        <texture>script.plex/white-square.png</texture>
        <colordiffuse>19000000</colordiffuse>
    </control>

    <control type="grouplist">
        <posx>60</posx>
        <posy>34.5</posy>
        <width>1000</width>
        <height>66</height>
        <align>left</align>
        <itemgap>60</itemgap>
        <orientation>horizontal</orientation>
        <ondown>101</ondown>
        <usecontrolcoords>true</usecontrolcoords>
        <control type="group">
            <posx>0</posx>
            <posy>0</posy>
            <width>124</width>
            <height>66</height>
            <control type="button" id="500">
                <posx>0</posx>
                <posy>0</posy>
                <width>124</width>
                <height>66</height>
                <ondown>101</ondown>
                <onright>101</onright>
                <align>right</align>
                <aligny>center</aligny>
                <texturefocus colordiffuse="FFE5A00D" border="10">script.plex/white-square-rounded.png</texturefocus>
                <texturenofocus>-</texturenofocus>
                <label> </label>
            </control>
            <control type="image">
                <visible>!String.IsEmpty(Window.Property(dropdown))</visible>
                <posx>0</posx>
                <posy>0</posy>
                <width>124</width>
                <height>66</height>
                <texture colordiffuse="FFCC7B19" border="10">script.plex/white-square-rounded.png</texture>
            </control>
            <control type="group">
                <posx>27</posx>
                <posy>13</posy>
                <control type="group">
                    <visible>!Control.HasFocus(500) + String.IsEmpty(Window.Property(dropdown))</visible>
                    <posx>0</posx>
                    <posy>0</posy>
                    <control type="image">
                        <posx>0</posx>
                        <posy>0</posy>
                        <width>40</width>
                        <height>40</height>
                        <texture colordiffuse="99FFFFFF">script.plex/buttons/power.png</texture>
                    </control>
                    <control type="image">
                        <posx>55</posx>
                        <posy>13.5</posy>
                        <width>15</width>
                        <height>13</height>
                        <texture colordiffuse="99FFFFFF">script.plex/indicators/dropdown-triangle.png</texture>
                    </control>
                </control>
                <control type="group">
                    <visible>Control.HasFocus(500) | !String.IsEmpty(Window.Property(dropdown))</visible>
                    <posx>0</posx>
                    <posy>0</posy>
                    <control type="image">
                        <posx>0</posx>
                        <posy>0</posy>
                        <width>40</width>
                        <height>40</height>
                        <texture colordiffuse="FF000000">script.plex/buttons/power.png</texture>
                    </control>
                    <control type="image">
                        <posx>55</posx>
                        <posy>13.5</posy>
                        <width>15</width>
                        <height>13</height>
                        <texture colordiffuse="FF000000">script.plex/indicators/dropdown-triangle.png</texture>
                    </control>
                </control>
            </control>
        </control>
        <control type="label">
            <posx>-27</posx>
            <posy>0</posy>
            <width max="500">auto</width>
            <height>66</height>
            <font>font12</font>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>FFFFFFFF</textcolor>
            <label>[UPPERCASE]$ADDON[script.plexmod 32437][/UPPERCASE]</label>
        </control>
    </control>

    <control type="label">
        <right>213</right>
        <posy>35</posy>
        <width>200</width>
        <height>65</height>
        <font>font12</font>
        <align>right</align>
        <aligny>center</aligny>
        <textcolor>FFFFFFFF</textcolor>
        <label>$INFO[System.Time]</label>
    </control>
    <control type="image">
        <posx>153r</posx>
        <posy>47.5</posy>
        <width>93</width>
        <height>43</height>
        <texture>script.plex/home/plex.png</texture>
    </control>
</control>

<control type="group">
    <visible>!String.IsEmpty(Window.Property(busy))</visible>
    <animation effect="fade" start="0" end="100">Visible</animation>
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
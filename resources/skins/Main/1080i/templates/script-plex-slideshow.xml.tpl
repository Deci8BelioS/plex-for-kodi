{% extends "base.xml.tpl" %}
{% block headers %}<zorder>6</zorder>{% endblock %}
{% block backgroundcolor %}{% endblock %}
{% block coordinates %}{% endblock %}
{% block controls %}
<control type="group">
	<control type="image" id="1">
		<posx>0</posx>
		<posy>0</posy>
		<width>1920</width>
		<height>1080</height>
		<texture background="true"></texture>
		<aspectratio>keep</aspectratio>
		<fadetime>1000</fadetime>
		<texture>$INFO[Window.Property(thumb)]</texture>
	</control>
	<control type="group" id="100">
		<posx>20</posx>
		<posy>20</posy>
		<height>100</height>
		<width>1880</width>
		<control type="label" id="101">
			<visible>String.IsEqual(Window.Property(align),0)</visible>
			<posy>0</posy>
			<height>50</height>
			<font>font45</font>
			<align>left</align>
			<textcolor>FFFFFFFF</textcolor>
			<shadowcolor>FF000000</shadowcolor>
			<label>$INFO[Window.Property(clock)]</label>
		</control>
		<control type="label" id="105">
			<visible>String.IsEqual(Window.Property(align),0)</visible>
			<posy>50</posy>
			<height>20</height>
			<font>font13</font>
			<align>left</align>
			<textcolor>FFFFFFFF</textcolor>
			<shadowcolor>FF000000</shadowcolor>
			<label>$INFO[Window.Property(title)]</label>
		</control>
		<control type="label" id="111">
			<visible>String.IsEqual(Window.Property(align),1)</visible>
			<posy>0</posy>
			<height>50</height>
			<font>font45</font>
			<align>right</align>
			<textcolor>FFFFFFFF</textcolor>
			<shadowcolor>FF000000</shadowcolor>
			<label>$INFO[Window.Property(clock)]</label>
		</control>
		<control type="label" id="115">
			<visible>String.IsEqual(Window.Property(align),1)</visible>
			<posy>50</posy>
			<height>20</height>
			<font>font13</font>
			<align>right</align>
			<textcolor>FFFFFFFF</textcolor>
			<shadowcolor>FF000000</shadowcolor>
			<label>$INFO[Window.Property(title)]</label>
		</control>
	</control>
</control>
{% endblock controls %}
package defold;

@:native("_G.label") extern class Label {
	/**
		set the text for a label
		
		Sets the text of a label component
		
		@param url the label that should have a constant set (url)
		@param text the text (string|hash)
	**/
	static function set_text(url:TODO, text:TODO):TODO;
}

@:publicFields class LabelProperties {
	/**
		label color (vector4)
		
		The color of the label. The type of the property is vector4.
	**/
	static var Color(default, never) : Property<TODO> = new Property("color");
	/**
		label outline (vector4)
		
		The outline color of the label. The type of the property is vector4.
	**/
	static var Outline(default, never) : Property<TODO> = new Property("outline");
	/**
		label scale (vector3|number)
		
		The scale of the label. The type of the property is vector3.
	**/
	static var Scale(default, never) : Property<TODO> = new Property("scale");
	/**
		label shadow (vector4)
		
		The shadow color of the label. The type of the property is vector4.
	**/
	static var Shadow(default, never) : Property<TODO> = new Property("shadow");
	/**
		label size (vector3)
		
		Returns the size of the label. THe size will constrain the text if line break is enabled
		The type of the property is vector3.
	**/
	static var Size(default, never) : Property<TODO> = new Property("size");
}
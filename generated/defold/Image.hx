package defold;

@:native("_G.image") extern class Image {
	/**
		load image from buffer
		
		Load image (PNG or JPEG) from buffer.
		
		@param buffer image data buffer
		@param premult premultiply alpha. optional and defaults to false
	**/
	static function load(buffer:TODO, ?premult:TODO):TODO;
}

@:native("_G.image") extern class ImageVariables {
	/**
		luminance image type
	**/
	static var TYPE_LUMINANCE(default, never) : TODO;
	/**
		RGB image type
	**/
	static var TYPE_RGB(default, never) : TODO;
	/**
		RGBA image type
	**/
	static var TYPE_RGBA(default, never) : TODO;
}
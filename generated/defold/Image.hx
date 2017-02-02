package defold;

/**
    Functions for creating image objects.

    See `ImageVariables` for related variables.
**/
@:native("_G.image")
extern class Image {
    /**
        Load image from buffer.
        
        Load image (PNG or JPEG) from buffer.
        
        @param buffer image data buffer
        @param premult premultiply alpha. optional and defaults to false
        @return object with the following fields: width, height, type and buffer (raw data). nil is returned if loading fails.
    **/
    static function load(buffer:TODO, ?premult:TODO):TODO;
}

@:native("_G.image")
extern class ImageVariables {
    /**
        Luminance image type.
    **/
    static var TYPE_LUMINANCE(default, never):TODO;

    /**
        RGB image type.
    **/
    static var TYPE_RGB(default, never):TODO;

    /**
        RGBA image type.
    **/
    static var TYPE_RGBA(default, never):TODO;
}
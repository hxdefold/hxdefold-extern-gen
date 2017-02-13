package defold;

/**
    <p>Functions for creating image objects.</p>

    See `ImageVariables` for related variables.
**/
@:native("_G.image")
extern class Image {
    /**
        Load image from buffer.
        
        Load image (PNG or JPEG) from buffer.
        
        @param buffer 
        <span class="type">string</span> image data buffer
        
        @param premult 
        <span class="type">boolean</span> optional flag if alpha should be premultiplied. Defaults to `false`
        
        @return image 
        <span class="type">table</span> object or `nil` if loading fails. The object is a table with the following fields:
        
         * <span class="type">number</span> `width`: image width
         * <span class="type">number</span> `height`: image height
         * <span class="type">constant</span> `type`: image type
        
         * `image.TYPE_RGB`
         * `image.TYPE_RGBA`
         * `image.TYPE_LUMINANCE`
        
         * <span class="type">string</span> `buffer`: the raw image data
    **/
    static function load(buffer:String, ?premult:TODO<"boolean">):TODO;
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
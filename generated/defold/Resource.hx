package defold;

/**
    <p>Functions and constants to access resources.</p>

    See `ResourceVariables` for related variables.
**/
@:native("_G.resource")
extern class Resource {
    /**
        Return a reference to the Manifest that is currently loaded.
        
        Return a reference to the Manifest that is currently loaded.
        
        @return manifest_reference 
        <span class="type">number</span> reference to the Manifest that is currently loaded
    **/
    static function get_current_manifest():TODO;

    /**
        Load a resource.
        
        Loads the resource data for a specific resource.
        
        @param path 
        <span class="type">string | hash</span> The path to the resource
        
        @return buffer 
        <span class="type">buffer</span> Returns the buffer stored on disc
    **/
    static function load(path:EitherType<Hash, String>):TODO;

    /**
        Set a resource.
        
        Sets the resource data for a specific resource
        
        @param path 
        <span class="type">string | hash</span> The path to the resource
        
        @param buffer 
        <span class="type">buffer</span> The buffer of precreated data, suitable for the intended resource type
    **/
    static function set(path:EitherType<Hash, String>, buffer:TODO<"buffer">):Void;

    /**
        Set a texture.
        
        Sets the pixel data for a specific texture.
        
        @param path 
        <span class="type">hash | string</span> The path to the resource
        
        @param table 
        <span class="type">table</span> A table containing info about the texture. Supported entries:
        
        <dl>
        <dt>`type`</dt>
        <dd><span class="type">number</span> The texture type. Supported values:</dd>
        </dl>
        
         * `resource.TEXTURE_TYPE_2D`
        
        <dl>
        <dt>`width`</dt>
        <dd><span class="type">number</span> The width of the texture (in pixels)</dd>
        <dt>`height`</dt>
        <dd><span class="type">number</span> The width of the texture (in pixels)</dd>
        <dt>`format`</dt>
        <dd><span class="type">number</span> The texture format. Supported values:</dd>
        </dl>
        
         * `resource.TEXTURE_FORMAT_LUMINANCE`
         * `resource.TEXTURE_FORMAT_RGB`
         * `resource.TEXTURE_FORMAT_RGBA`
        
        @param buffer 
        <span class="type">buffer</span> The buffer of precreated pixel data
        
        <span class="icon-attention"></span> Currently, only 1 mipmap is generated.
    **/
    static function set_texture(path:EitherType<String, Hash>, table:TODO<"table">, buffer:TODO<"buffer">):Void;

    /**
        Add a resource to the data archive and runtime index.
        
        add a resource to the data archive and runtime index. The resource will be verified
        internally before being added to the data archive.
        
        @param manifest_reference 
        <span class="type">number</span> The manifest to check against.
        
        @param data 
        <span class="type">string</span> The resource data that should be stored.
        
        @param hexdigest 
        <span class="type">string</span> The expected hash for the resource,
        retrieved through collectionproxy.missing_resources.
        
        @param callback 
        <span class="type">function(self, hexdigest, status)</span> The callback
        function that is executed once the engine has been attempted to store
        the resource.
        
        <dl>
        <dt>`self`</dt>
        <dd><span class="type">object</span> The current object.</dd>
        <dt>`hexdigest`</dt>
        <dd><span class="type">string</span> The hexdigest of the resource.</dd>
        <dt>`status`</dt>
        <dd><span class="type">boolean</span> Whether or not the resource was successfully stored.</dd>
        </dl>
    **/
    static function store_resource(manifest_reference:Float, data:String, hexdigest:String, callback:TODO<"function(self, hexdigest, status)">):Void;
}

@:native("_G.resource")
extern class ResourceVariables {
    /**
        Luminance type texture format.
    **/
    static var TEXTURE_FORMAT_LUMINANCE(default, never):TODO;

    /**
        RGB type texture format.
    **/
    static var TEXTURE_FORMAT_RGB(default, never):TODO;

    /**
        RGBA type texture format.
    **/
    static var TEXTURE_FORMAT_RGBA(default, never):TODO;

    /**
        2D texture type.
    **/
    static var TEXTURE_TYPE_2D(default, never):TODO;
}
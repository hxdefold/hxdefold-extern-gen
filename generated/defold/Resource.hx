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
        <span class="type">string</span> The path to the resource
        
        @return buffer 
        <span class="type">buffer</span> Returns the buffer stored on disc
    **/
    static function load(path:String):TODO;

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
        Create, verify, and store a manifest to device.
        
        Create a new manifest from a buffer. The created manifest is verified
        by ensuring that the manifest was signed using the bundled public/private
        key-pair during the bundle process and that the manifest supports the current
        running engine version. Once the manifest is verified it is stored on device.
        The next time the engine starts (or is rebooted) it will look for the stored
        manifest before loading resources. Storing a new manifest allows the
        developer to update the game, modify existing resources, or add new
        resources to the game through LiveUpdate.
        
        @param manifest_buffer 
        <span class="type">string</span> the binary data that represents the manifest
        
        @param callback 
        <span class="type">function(self, status)</span> the callback function
        executed once the engine has attempted to store the manifest.
        
        <dl>
        <dt>`self`</dt>
        <dd><span class="type">object</span> The current object.</dd>
        <dt>`status`</dt>
        <dd><span class="type">constant</span> the status of the store operation:</dd>
        </dl>
        
         * `resource.LIVEUPATE_OK`
         * `resource.LIVEUPATE_INVALID_RESOURCE`
         * `resource.LIVEUPATE_VERSION_MISMATCH`
         * `resource.LIVEUPATE_ENGINE_VERSION_MISMATCH`
         * `resource.LIVEUPATE_SIGNATURE_MISMATCH`
         * `resource.LIVEUPDATE_BUNDLED_RESOURCE_MISMATCH`
         * `resource.LIVEUPDATE_FORMAT_ERROR`
    **/
    static function store_manifest(manifest_buffer:String, callback:TODO<"function(self, status)">):Void;

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
        LIVEUPDATE_BUNDLED_RESOURCE_MISMATCH.
        
        Mismatch between between expected bundled resources and actual bundled resources. The manifest expects a resource to be in the bundle, but it was not found in the bundle. This is typically the case when a non-excluded resource was modified between publishing the bundle and publishing the manifest.
    **/
    static var LIVEUPDATE_BUNDLED_RESOURCE_MISMATCH(default, never):TODO;

    /**
        LIVEUPDATE_ENGINE_VERSION_MISMATCH.
        
        Mismatch between running engine version and engine versions supported by manifest.
    **/
    static var LIVEUPDATE_ENGINE_VERSION_MISMATCH(default, never):TODO;

    /**
        LIVEUPDATE_FORMAT_ERROR.
        
        Failed to parse manifest data buffer. The manifest was probably produced by a different engine version.
    **/
    static var LIVEUPDATE_FORMAT_ERROR(default, never):TODO;

    /**
        LIVEUPDATE_INVALID_RESOURCE.
        
        The handled resource is invalid.
    **/
    static var LIVEUPDATE_INVALID_RESOURCE(default, never):TODO;

    /**
        LIVEUPDATE_OK.
    **/
    static var LIVEUPDATE_OK(default, never):TODO;

    /**
        LIVEUPDATE_SCHEME_MISMATCH.
        
        Mismatch between scheme used to load resources. Resources are loaded with a different scheme than from manifest, for example over HTTP or directly from file. This is typically the case when running the game directly from the editor instead of from a bundle.
    **/
    static var LIVEUPDATE_SCHEME_MISMATCH(default, never):TODO;

    /**
        LIVEUPDATE_SIGNATURE_MISMATCH.
        
        Mismatch between manifest expected signature and actual signature.
    **/
    static var LIVEUPDATE_SIGNATURE_MISMATCH(default, never):TODO;

    /**
        LIVEUPDATE_VERSION_MISMATCH.
        
        Mismatch between manifest expected version and actual version.
    **/
    static var LIVEUPDATE_VERSION_MISMATCH(default, never):TODO;

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
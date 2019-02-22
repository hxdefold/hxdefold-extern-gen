package defold;

/**
    <p>Functions for controlling factory components which are used to
    dynamically spawn game objects into the runtime.</p>

    See `FactoryVariables` for related variables.
**/
@:native("_G.factory")
extern class Factory {
    /**
        Make a factory create a new game object.
        
        The URL identifies which factory should create the game object.
        If the game object is created inside of the frame (e.g. from an update callback), the game object will be created instantly, but none of its component will be updated in the same frame.
        
        Properties defined in scripts in the created game object can be overridden through the properties-parameter below.
        See go.property for more information on script properties.
        
        <span class="icon-attention"></span> Calling `factory.create` on a factory that is marked as dynamic without having loaded resources
        using `factory.load` will synchronously load and create resources which may affect application performance.
        
        @param url 
        <span class="type">string | hash | url</span> the factory that should create a game object.
        
        @param position 
        <span class="type">vector3</span> the position of the new game object, the position of the game object calling `factory.create()` is used by default, or if the value is `nil`.
        
        @param rotation 
        <span class="type">quaternion</span> the rotation of the new game object, the rotation of the game object calling `factory.create()` is used by default, or if the value is `nil`.
        
        @param properties 
        <span class="type">table</span> the properties defined in a script attached to the new game object.
        
        @param scale 
        <span class="type">number | vector3</span> the scale of the new game object (must be greater than 0), the scale of the game object containing the factory is used by default, or if the value is `nil`
        
        @return id 
        <span class="type">hash</span> the global id of the spawned game object
    **/
    static function create(url:EitherType<Url, EitherType<Hash, String>>, ?position:Vector3, ?rotation:TODO<"quaternion">, ?properties:TODO<"table">, ?scale:EitherType<Vector3, Float>):TODO;

    /**
        Get factory status.
        
        This returns status of the factory.
        
        Calling this function when the factory is not marked as dynamic loading always returns
        factory.STATUS_LOADED.
        
        @param url 
        <span class="type">string | hash | url</span> the factory component to get status from
        
        @return status 
        <span class="type">constant</span> status of the factory component
        
         * `factory.STATUS_UNLOADED`
         * `factory.STATUS_LOADING`
         * `factory.STATUS_LOADED`
    **/
    static function get_status(?url:EitherType<Url, EitherType<Hash, String>>):TODO;

    /**
        Load resources of a factory prototype..
        
        Resources are referenced by the factory component until the existing (parent) collection is destroyed or factory.unload is called.
        
        Calling this function when the factory is not marked as dynamic loading does nothing.
        
        @param url 
        <span class="type">string | hash | url</span> the factory component to load
        
        @param complete_function 
        <span class="type">function(self, url, result))</span> function to call when resources are loaded.
        
        <dl>
        <dt>`self`</dt>
        <dd><span class="type">object</span> The current object.</dd>
        <dt>`url`</dt>
        <dd><span class="type">url</span> url of the factory component</dd>
        <dt>`result`</dt>
        <dd><span class="type">boolean</span> True if resources were loaded successfully</dd>
        </dl>
    **/
    static function load(?url:EitherType<Url, EitherType<Hash, String>>, ?complete_function:TODO<"function(self, url, result))">):Void;

    /**
        Unload resources previously loaded using factory.load.
        
        This decreases the reference count for each resource loaded with factory.load. If reference is zero, the resource is destroyed.
        
        Calling this function when the factory is not marked as dynamic loading does nothing.
        
        @param url 
        <span class="type">string | hash | url</span> the factory component to unload
    **/
    static function unload(?url:EitherType<Url, EitherType<Hash, String>>):Void;
}

@:native("_G.factory")
extern class FactoryVariables {
    /**
        Loaded.
    **/
    static var STATUS_LOADED(default, never):TODO;

    /**
        Loading.
    **/
    static var STATUS_LOADING(default, never):TODO;

    /**
        Unloaded.
    **/
    static var STATUS_UNLOADED(default, never):TODO;
}
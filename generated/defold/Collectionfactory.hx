package defold;

/**
    <p>Functions for controlling collection factory components which are
    used to dynamically spawn collections into the runtime.</p>

    See `CollectionfactoryVariables` for related variables.
**/
@:native("_G.collectionfactory")
extern class Collectionfactory {
    /**
        Spawn a new instance of a collection into the existing collection..
        
        The URL identifies the collectionfactory component that should do the spawning.
        
        Spawning is instant, but spawned game objects get their first update calls the following frame. The supplied parameters for position, rotation and scale
        will be applied to the whole collection when spawned.
        
        Script properties in the created game objects can be overridden through
        a properties-parameter table. The table should contain game object ids
        (hash) as keys and property tables as values to be used when initiating each
        spawned game object.
        
        See go.property for more information on script properties.
        
        The function returns a table that contains a key for each game object
        id (hash), as addressed if the collection file was top level, and the
        corresponding spawned instance id (hash) as value with a unique path
        prefix added to each instance.
        
        <span class="icon-attention"></span> Calling `collectionfactory.create` create on a collection factory that is marked as dynamic without having loaded resources
        using `collectionfactory.load` will synchronously load and create resources which may affect application performance.
        
        @param url 
        <span class="type">string | hash | url</span> the collection factory component to be used
        
        @param position 
        <span class="type">vector3</span> position to assign to the newly spawned collection
        
        @param rotation 
        <span class="type">quaternion</span> rotation to assign to the newly spawned collection
        
        @param properties 
        <span class="type">table</span> table of script properties to propagate to any new game object instances
        
        @param scale 
        <span class="type">number</span> uniform scaling to apply to the newly spawned collection (must be greater than 0).
        
        @return ids 
        <span class="type">table</span> a table mapping the id:s from the collection to the new instance id:s
    **/
    static function create(url:EitherType<Url, EitherType<Hash, String>>, ?position:Vector3, ?rotation:TODO<"quaternion">, ?properties:TODO<"table">, ?scale:Float):TODO;

    /**
        Get collection factory status.
        
        This returns status of the collection factory.
        
        Calling this function when the factory is not marked as dynamic loading always returns COMP_COLLECTION_FACTORY_STATUS_LOADED.
        
        @param url 
        <span class="type">string | hash | url</span> the collection factory component to get status from
        
        @return status 
        <span class="type">constant</span> status of the collection factory component
        
         * `collectionfactory.STATUS_UNLOADED`
         * `collectionfactory.STATUS_LOADING`
         * `collectionfactory.STATUS_LOADED`
    **/
    static function get_status(?url:EitherType<Url, EitherType<Hash, String>>):TODO;

    /**
        Load resources of a collection factory prototype..
        
        Resources loaded are referenced by the collection factory component until the existing (parent) collection is destroyed or collectionfactory.unload is called.
        
        Calling this function when the factory is not marked as dynamic loading does nothing.
        
        @param url 
        <span class="type">string | hash | url</span> the collection factory component to load
        
        @param complete_function 
        <span class="type">function(self, url, result))</span> function to call when resources are loaded.
        
        <dl>
        <dt>`self`</dt>
        <dd><span class="type">object</span> The current object.</dd>
        <dt>`url`</dt>
        <dd><span class="type">url</span> url of the collection factory component</dd>
        <dt>`result`</dt>
        <dd><span class="type">boolean</span> True if resource were loaded successfully</dd>
        </dl>
    **/
    static function load(?url:EitherType<Url, EitherType<Hash, String>>, ?complete_function:TODO<"function(self, url, result))">):Void;

    /**
        Unload resources previously loaded using collectionfactory.load.
        
        This decreases the reference count for each resource loaded with collectionfactory.load. If reference is zero, the resource is destroyed.
        
        Calling this function when the factory is not marked as dynamic loading does nothing.
        
        @param url 
        <span class="type">string | hash | url</span> the collection factory component to unload
    **/
    static function unload(?url:EitherType<Url, EitherType<Hash, String>>):Void;
}

@:native("_G.collectionfactory")
extern class CollectionfactoryVariables {
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
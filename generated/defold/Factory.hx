package defold;

/**
    <p>Functions for controlling factory components which are used to
    dynamically spawn game objects into the runtime.</p>
**/
@:native("_G.factory")
extern class Factory {
    /**
        Make a factory create a new game object.
        
        The URL identifies which factory should create the game object.
        If the game object is created inside of the frame (e.g. from an update callback), the game object will be created instantly, but none of its component will be updated in the same frame.
        
        Properties defined in scripts in the created game object can be overridden through the properties-parameter below.
        See go.property for more information on script properties.
        
        @param url 
        <span class="type">string | hash | url</span> the factory that should create a game object.
        
        @param position 
        <span class="type">vector3</span> the position of the new game object, the position of the game object calling `factory.create()` is used by default.
        
        @param rotation 
        <span class="type">quaternion</span> the rotation of the new game object, the rotation of the game object calling `factory.create()` is is used by default.
        
        @param properties 
        <span class="type">table</span> the properties defined in a script attached to the new game object.
        
        @param scale 
        <span class="type">number | vector3</span> the scale of the new game object (must be greater than 0), the scale of the game object containing the factory is used by default
        
        @return id 
        <span class="type">hash</span> the global id of the spawned game object
    **/
    static function create(url:EitherType<Url, EitherType<Hash, String>>, ?position:Vector3, ?rotation:TODO<"quaternion">, ?properties:TODO<"table">, ?scale:EitherType<Vector3, Float>):TODO;
}
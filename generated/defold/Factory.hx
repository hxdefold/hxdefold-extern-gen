package defold;

/**
    Functions for controlling factory components which are used to
    dynamically spawn game objects into the runtime.
**/
@:native("_G.factory") extern class Factory {
	/**
		Make a factory create a new game object.
		
		The URL identifies which factory should create the game object.
		If the game object is created inside of the frame (e.g. from an update callback), the game object will be created instantly, but none of its component will be updated in the same frame.
		
		Properties defined in scripts in the created game object can be overridden through the properties-parameter below.
		See go.property for more information on script properties.
		
		@param url the factory that should create a game object (url)
		@param position the position of the new game object, the position of the game object containing the factory is used by default (vector3)
		@param rotation the rotation of the new game object, the rotation of the game object containing the factory is used by default (quat)
		@param properties the properties defined in a script attached to the new game object (table)
		@param scale the scale of the new game object (must be greater than 0), the scale of the game object containing the factory is used by default (number or vector3)
		@return the global id of the spawned game object (hash)
	**/
	static function create(url:Url, ?position:Vector3, ?rotation:TODO<"quat">, ?properties:TODO<"table">, ?scale:EitherType<Vector3, TODO<"must be greater than 0), the scale of the game object containing the factory is used by default (number">>):TODO;
}
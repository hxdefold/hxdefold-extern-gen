package defold;

@:native("_G.collectionfactory") extern class Collectionfactory {
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
		
		@param url the collection factory component to be used (url)
		@param position position to assign to the newly spawned collection (vector3)
		@param rotation rotation to assign to the newly spawned collection (quat)
		@param properties table of script properties to propagate to any new game object instances (table)
		@param scale uniform scaling to apply to the newly spawned collection (must be greater than 0). (number)
	**/
	static function create(url:TODO, ?position:TODO, ?rotation:TODO, ?properties:TODO, ?scale:TODO):TODO;
}
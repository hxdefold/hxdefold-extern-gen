package defold;

/**
    Manipulation of JSON data strings.
**/
@:native("_G.json") extern class Json {
	/**
		Decode JSON from a string to a lua-table.
		
		Decode a string of JSON data into a Lua table.
		A Lua error is raised for syntax errors.
		
		@param json json data (string)
		@return decoded json (table)
	**/
	static function decode(json:String):TODO;
}
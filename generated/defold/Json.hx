package defold;

@:native("_G.json") extern class Json {
	/**
		Decode JSON from a string to a lua-table.
		
		Decode a string of JSON data into a Lua table.
		A Lua error is raised for syntax errors.
		
		@param json json data (string)
	**/
	static function decode(json:TODO):TODO;
}
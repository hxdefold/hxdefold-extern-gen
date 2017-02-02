package defold;

/**
	Functions for passing messages and constructing URL objects.
**/
@:native("_G.msg") extern class Msg {
	/**
		Posts a message to a receiving URL.
		
		@param receiver The receiver must be a string in URL-format, a URL object, a hashed string or nil. Nil is a short way of sending the message back to the calling script. (string|url|hash|nil)
		@param message_id The id must be a string or a hashed string. (string|hash)
		@param message lua table message to send (table)
	**/
	static function post(receiver:EitherType<TODO<"nil">, EitherType<Hash, EitherType<Url, String>>>, message_id:EitherType<Hash, String>, ?message:TODO<"table">):Void;

	/**
		Creates a new URL.
		
		This is equivalent to msg.url("").
		
		@return a new URL (url)
	**/
	static function url():TODO;

	/**
		Creates a new URL from a string.
		
		The format of the string must be `"[socket:][path][#fragment]"`, which is similar to a http URL.
		When addressing instances, `socket` is the name of the collection. `path` is the id of the instance,
		which can either be relative the instance of the calling script or global. `fragment` would be the id of the desired component.
		
		@param urlstring string to create the url from (string)
		@return a new URL (url)
	**/
	static function url(urlstring:String):TODO;

	/**
		Creates a new URL from separate arguments.
		
		@param socket socket of the URL (string|socket)
		@param path path of the URL (string|hash)
		@param fragment fragment of the URL (string|hash)
		@return a new URL (url)
	**/
	static function url(?socket:EitherType<TODO<"socket">, String>, ?path:EitherType<Hash, String>, ?fragment:EitherType<Hash, String>):TODO;
}
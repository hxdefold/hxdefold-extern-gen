package defold;

@:native("_G.msg") extern class Msg {
	/**
		posts a message to a receiving URL
		
		@param receiver The receiver must be a string in URL-format, a URL object, a hashed string or nil. Nil is a short way of sending the message back to the calling script. (string|url|hash|nil)
		@param message_id The id must be a string or a hashed string. (string|hash)
		@param message lua table message to send (table)
	**/
	static function post(receiver:TODO, message_id:TODO, ?message:TODO):TODO;
	/**
		creates a new URL
		
		This is equivalent to msg.url("").
	**/
	static function url():TODO;
	/**
		creates a new URL from a string
		
		The format of the string must be <code>"[socket:][path][#fragment]"</code>, which is similar to a http URL.
		When addressing instances, <code>socket</code> is the name of the collection. <code>path</code> is the id of the instance,
		which can either be relative the instance of the calling script or global. <code>fragment</code> would be the id of the desired component.
		
		@param urlstring string to create the url from (string)
	**/
	static function url(urlstring:TODO):TODO;
	/**
		creates a new URL from separate arguments
		
		@param socket socket of the URL (string|socket)
		@param path path of the URL (string|hash)
		@param fragment fragment of the URL (string|hash)
	**/
	static function url(?socket:TODO, ?path:TODO, ?fragment:TODO):TODO;
}
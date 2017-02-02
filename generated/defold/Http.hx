package defold;

/**
	Functions for performing HTTP and HTTPS requests.
**/
@:native("_G.http") extern class Http {
	/**
		Perform a HTTP/HTTPS request.
		
		Perform a HTTP/HTTPS request.
		
		If no timeout value is passed, the configuration value "network.http_timeout" is used. If that is not set, the timeout value is 0. (0 == blocks indefinitely)
		
		@param url target url
		@param method HTTP/HTTPS method, e.g. GET/PUT/POST/DELETE/...
		@param callback response callback
		@param headers optional lua-table with custom headers
		@param post_data optional data to send
		@param options optional lua-table with request parameters. Supported entries: 'timeout'=<number> (in seconds)
	**/
	static function request(url:TODO, method:TODO, callback:TODO, ?headers:TODO, ?post_data:TODO, ?options:TODO):Void;
}
package defold;

@:native("_G.http") extern class Http {
	/**
		perform a HTTP request
		
		Perform a HTTP request.
		
		If no timeout value is passed, the configuration value "network.http_timeout" is used. If that is not set, the timeout value is 0. (0 == blocks indefinitely)
		
		@param url target url
		@param method HTTP method, e.g. GET/PUT/POST/DELETE/...
		@param callback response callback
		@param headers optional lua-table with custom headers
		@param post_data optional data to send
		@param options optional lua-table with request parameters. Supported entries: 'timeout'=<number> (in seconds)
	**/
	static function request(url:TODO, method:TODO, callback:TODO, ?headers:TODO, ?post_data:TODO, ?options:TODO):TODO;
}
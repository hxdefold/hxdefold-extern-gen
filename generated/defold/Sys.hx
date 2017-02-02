package defold;

/**
	Functions and messages for using system resources, controlling the engine
	and for debugging.
**/
@:native("_G.sys") extern class Sys {
	/**
		Get application information.
		
		Returns a table with the following members:
		installed.
		
		@return table with application information (table)
	**/
	static function get_application_info():TODO;
	/**
		Get config value.
		
		Get config value from the game.project configuration file.
		
		@param key key to get value for. The syntax is SECTION.KEY (string)
		@return config value as a string. nil if the config key doesn't exists (string)
	**/
	static function get_config(key:String):TODO;
	/**
		Get config value with default value.
		
		Get config value from the game.project configuration file with default value
		
		@param key key to get value for. The syntax is SECTION.KEY (string)
		@param default_value default value to return if the value does not exist (string)
		@return config value as a string. default_value if the config key does not exist (string)
	**/
	static function get_config(key:String, default_value:String):TODO;
	/**
		Get current network connectivity status.
		
		@return sys.NETWORK_DISCONNECTED if no network connection is found, sys.NETWORK_CONNECTED_CELLULAR if connected through mobile cellular, otherwise sys.NETWORK_CONNECTED (number)
	**/
	static function get_connectivity():TODO;
	/**
		Get engine information.
		
		Returns a table with the following members:
		version, engine_sha1.
		
		@return table with engine information (table)
	**/
	static function get_engine_info():TODO;
	/**
		Enumerate network cards.
		
		returns an array of tables with the following members:
		name, address (ip-string), mac (hardware address, colon separated string), up (bool), running (bool). NOTE: ip and mac might be nil if not available
		
		@return an array of tables (table)
	**/
	static function get_ifaddrs():TODO;
	/**
		Gets the save-file path.
		
		The save-file path is operating system specific and is typically located under the users home directory.
		
		@param application_id user defined id of the application, which helps define the location of the save-file (string)
		@param file_name file-name to get path for (string)
		@return path to save-file (string)
	**/
	static function get_save_file(application_id:String, file_name:String):TODO;
	/**
		Get system information.
		
		Returns a table with the following members:
		device_model, manufacturer, system_name, system_version, api_version, language, device_language, territory, gmt_offset (minutes), device_ident, ad_ident, ad_tracking_enabled and user_agent.
		
		`device_model` and `manufacturer` is currently only available on iOS and Android.
		
		`language` is in ISO-639 format (two characters) and `territory` in ISO-3166 format (two characters).
		
		`device_language` is in ISO-639 format (two characters) and if applicable by a dash (-) and an ISO 15924 script code. Reflects device preferred language.
		
		`device_ident` is "identifierForVendor" and `ad_ident` is "advertisingIdentifier" on iOS
		
		`device_ident` is "android_id" and `ad_ident` is advertising ID provided by Google Play on Android.
		
		@return table with system information (table)
	**/
	static function get_sys_info():TODO;
	/**
		Loads a lua table from a file on disk.
		
		If the file exists, it must have been created by `sys.save` to be loaded.
		
		@param filename file to read from (string)
		@return loaded lua table, which is empty if the file could not be found (table)
	**/
	static function load(filename:String):TODO;
	/**
		Loads resource from game data.
		
		Loads a custom resource. Specify the full filename of the resource that you want
		to load. When loaded, it is returned as a string.
		
		In order for the engine to include custom resources in the build process, you need
		to specify them in the "game.project" settings file:
		<pre>
		[project]
		title = My project
		version = 0.1
		custom_resources = main/data/,assets/level_data.json
		</pre>
		
		@param filename resource to load, full path (string)
		@return loaded data, which is empty if the file could not be found (string)
	**/
	static function load_resource(filename:String):TODO;
	/**
		Open url in default application.
		
		Open URL in default application, typically a browser
		
		@param url url to open (string)
		@return a boolean indicating if the url could be opened or not (boolean)
	**/
	static function open_url(url:String):TODO;
	/**
		Saves a lua table to a file stored on disk.
		
		The table can later be loaded by `sys.load`.
		Use `sys.get_save_file` to obtain a valid location for the file.
		Internally, this function uses a workspace buffer sized output file sized 128kb. This size reflects the output file size which must not exceed this limit.
		Additionally, the total number of rows that any one table may contain is limited to 65536 (i.e. a 16 bit range). When tables are used to represent arrays, the values of
		keys are permitted to fall within a 32 bit range, supporting sparse arrays, however the limit on the total number of rows remains in effect.
		
		@param filename file to write to (string)
		@param table lua table to save (table)
		@return a boolean indicating if the table could be saved or not (boolean)
	**/
	static function save(filename:String, table:TODO<"table">):TODO;
	/**
		Set host to check for network connectivity against.
		
		@param host hostname to check against (string)
	**/
	static function set_connectivity_host(host:String):Void;
	/**
		Set the error handler. The error handler is a function which is called whenever a lua runtime error occurs..
		
		@param error_handler the function to be called on error (function)
	**/
	static function set_error_handler(error_handler:TODO<"function">):Void;
}
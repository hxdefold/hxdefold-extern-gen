package defold;

@:native("_G.sys") extern class Sys {
	/**
		get application information
		
		<p>
		Returns a table with the following members:
		installed.
		</p>
	**/
	static function get_application_info():TODO;
	/**
		get config value
		
		Get config value from the game.project configuration file.
		
		@param key key to get value for. The syntax is SECTION.KEY (string)
	**/
	static function get_config(key:TODO):TODO;
	/**
		get config value with default value
		
		Get config value from the game.project configuration file with default value
		
		@param key key to get value for. The syntax is SECTION.KEY (string)
		@param default_value default value to return if the value does not exist (string)
	**/
	static function get_config(key:TODO, default_value:TODO):TODO;
	/**
		get current network connectivity status
	**/
	static function get_connectivity():TODO;
	/**
		get engine information
		
		<p>
		Returns a table with the following members:
		version, engine_sha1.
		</p>
	**/
	static function get_engine_info():TODO;
	/**
		enumerate network cards
		
		returns an array of tables with the following members:
		name, address (ip-string), mac (hardware address, colon separated string), up (bool), running (bool). NOTE: ip and mac might be nil if not available
	**/
	static function get_ifaddrs():TODO;
	/**
		gets the save-file path
		
		The save-file path is operating system specific and is typically located under the users home directory.
		
		@param application_id user defined id of the application, which helps define the location of the save-file (string)
		@param file_name file-name to get path for (string)
	**/
	static function get_save_file(application_id:TODO, file_name:TODO):TODO;
	/**
		get system information
		
		<p>
		Returns a table with the following members:
		device_model, manufacturer, system_name, system_version, api_version, language, device_language, territory, gmt_offset (minutes), device_ident, ad_ident, ad_tracking_enabled and user_agent.
		</p>
		<p><code>device_model</code> and <code>manufacturer</code> is currently only available on iOS and Android.</p>
		<p><code>language</code> is in ISO-639 format (two characters) and <code>territory</code> in ISO-3166 format (two characters).</p>
		<p><code>device_language</code> is in ISO-639 format (two characters) and if applicable by a dash (-) and an ISO 15924 script code. Reflects device preferred language.</p>
		<p><code>device_ident</code> is "identifierForVendor" and <code>ad_ident</code> is "advertisingIdentifier" on iOS</p>
		<p><code>device_ident</code> is "android_id" and <code>ad_ident</code> is advertising ID provided by Google Play on Android.</p>
	**/
	static function get_sys_info():TODO;
	/**
		loads a lua table from a file on disk
		
		If the file exists, it must have been created by <code>sys.save</code> to be loaded.
		
		@param filename file to read from (string)
	**/
	static function load(filename:TODO):TODO;
	/**
		loads resource from game data
		
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
	**/
	static function load_resource(filename:TODO):TODO;
	/**
		open url in default application
		
		Open URL in default application, typically a browser
		
		@param url url to open (string)
	**/
	static function open_url(url:TODO):TODO;
	/**
		saves a lua table to a file stored on disk
		
		The table can later be loaded by <code>sys.load</code>.
		Use <code>sys.get_save_file</code> to obtain a valid location for the file.
		Internally, this function uses a workspace buffer sized output file sized 128kb. This size reflects the output file size which must not exceed this limit.
		Additionally, the total number of rows that any one table may contain is limited to 65536 (i.e. a 16 bit range). When tables are used to represent arrays, the values of
		keys are permitted to fall within a 32 bit range, supporting sparse arrays, however the limit on the total number of rows remains in effect.
		
		@param filename file to write to (string)
		@param table lua table to save (table)
	**/
	static function save(filename:TODO, table:TODO):TODO;
	/**
		set host to check for network connectivity against
		
		@param host hostname to check against (string)
	**/
	static function set_connectivity_host(host:TODO):TODO;
	/**
		set the error handler. The error handler is a function which is called whenever a lua runtime error occurs.
		
		@param error_handler the function to be called on error (function)
	**/
	static function set_error_handler(error_handler:TODO):TODO;
}
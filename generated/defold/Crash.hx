package defold;

@:native("_G.crash") extern class Crash {
	/**
		read backtrace recorded in a loaded crash dump
		
		A table is returned containing the addresses of the call stack.
		
		@param handle crash dump handle (number)
	**/
	static function get_backtrace(handle:TODO):TODO;
	/**
		read text blob recorded in a crash dump
		
		The format of read text blob is platform specific
		and not guaranteed
		but can be useful for manual inspection.
		
		@param handle crash dump handle (number)
	**/
	static function get_extra_data(handle:TODO):TODO;
	/**
		get all loaded modules from when the crash occured
		
		The function returns a table containing entries with sub-tables that
		have 'name' and 'address' set for all loaded modules.
		
		@param handle crash dump handle (number)
	**/
	static function get_modules(handle:TODO):TODO;
	/**
		read signal number from a crash report
		
		@param handle crash dump handle (number)
	**/
	static function get_signum(handle:TODO):TODO;
	/**
		reads a system field from a loaded crash dump
		
		@param handle crash dump handle (number)
		@param index system field enum (number)
	**/
	static function get_sys_field(handle:TODO, index:TODO):TODO;
	/**
		reads user field from a loaded crash dump
		
		@param handle crash dump handle (number)
		@param index user data slot index (number)
	**/
	static function get_user_field(handle:TODO, index:TODO):TODO;
	/**
		loads a previously written crash dump
		
		The crash dump will be removed from disk upon a successful
		load, so loading is one-shot.
	**/
	static function load_previous():TODO;
	/**
		releases a previously loaded crash dump
		
		@param handle handle to loaded crash dump (number)
	**/
	static function release(handle:TODO):TODO;
	/**
		sets the file location for crash dumps
		
		Crashes occuring before the path is set will be stored to a default engine location.
		
		@param path file path to use (string)
	**/
	static function set_file_path(path:TODO):TODO;
	/**
		stores user-defined string value
		
		Store a user value that will get written to a crash dump when
		a crash occurs. This can be user id:s, breadcrumb data etc.
		There are 32 slots indexed from 0. Each slot stores at most 255 characters.
		
		@param index slot index. 0-indexed. (number)
		@param value string value to store (string)
	**/
	static function set_user_field(index:TODO, value:TODO):TODO;
	/**
		writes crash dump
		
		Performs the same steps as if a crash had just occured but
		allows the program to continue.
		The generated dump can be read by crash.load_previous
	**/
	static function write_dump():TODO;
}

@:native("_G.crash") extern class CrashVariables {
	/**
		android build fingerprint
	**/
	static var SYSFIELD_ANDROID_BUILD_FINGERPRINT(default, never) : TODO;
	/**
		system device language as reported by sys.get_sys_info
	**/
	static var SYSFIELD_DEVICE_LANGUAGE(default, never) : TODO;
	/**
		device manufacturer as reported by sys.get_sys_info
	**/
	static var SYSFIELD_DEVICE_MANUFACTURER(default, never) : TODO;
	/**
		device model as reported by sys.get_sys_info
	**/
	static var SYSFIELD_DEVICE_MODEL(default, never) : TODO;
	/**
		engine version as hash
	**/
	static var SYSFIELD_ENGINE_HASH(default, never) : TODO;
	/**
		engine version as release number
	**/
	static var SYSFIELD_ENGINE_VERSION(default, never) : TODO;
	/**
		system language as reported by sys.get_sys_info
	**/
	static var SYSFIELD_LANGUAGE(default, never) : TODO;
	/**
		system name as reported by sys.get_sys_info
	**/
	static var SYSFIELD_SYSTEM_NAME(default, never) : TODO;
	/**
		system version as reported by sys.get_sys_info
	**/
	static var SYSFIELD_SYSTEM_VERSION(default, never) : TODO;
	/**
		system territory as reported by sys.get_sys_info
	**/
	static var SYSFIELD_TERRITORY(default, never) : TODO;
}
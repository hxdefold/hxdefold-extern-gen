package defold;

/**
	Native crash logging functions and constants.

	See `CrashVariables` for related variables.
**/
@:native("_G.crash") extern class Crash {
	/**
		Read backtrace recorded in a loaded crash dump.
		
		A table is returned containing the addresses of the call stack.
		
		@param handle crash dump handle (number)
		@return backtrace table containing the backtrace (table)
	**/
	static function get_backtrace(handle:Float):TODO;
	/**
		Read text blob recorded in a crash dump.
		
		The format of read text blob is platform specific
		and not guaranteed
		but can be useful for manual inspection.
		
		@param handle crash dump handle (number)
		@return blob string with the platform specific data (string)
	**/
	static function get_extra_data(handle:Float):TODO;
	/**
		Get all loaded modules from when the crash occured.
		
		The function returns a table containing entries with sub-tables that
		have 'name' and 'address' set for all loaded modules.
		
		@param handle crash dump handle (number)
		@return modules module table (table)
	**/
	static function get_modules(handle:Float):TODO;
	/**
		Read signal number from a crash report.
		
		@param handle crash dump handle (number)
		@return signal signal number (number)
	**/
	static function get_signum(handle:Float):TODO;
	/**
		Reads a system field from a loaded crash dump.
		
		@param handle crash dump handle (number)
		@param index system field enum (number)
		@return value value recorded in the crash dump (string)
	**/
	static function get_sys_field(handle:Float, index:Float):TODO;
	/**
		Reads user field from a loaded crash dump.
		
		@param handle crash dump handle (number)
		@param index user data slot index (number)
		@return value user data value recorded in the crash dump (string)
	**/
	static function get_user_field(handle:Float, index:Float):TODO;
	/**
		Loads a previously written crash dump.
		
		The crash dump will be removed from disk upon a successful
		load, so loading is one-shot.
		
		@return handle handle to the loaded dump, or nil if no dump was found. (number)
	**/
	static function load_previous():TODO;
	/**
		Releases a previously loaded crash dump.
		
		@param handle handle to loaded crash dump (number)
	**/
	static function release(handle:Float):Void;
	/**
		Sets the file location for crash dumps.
		
		Crashes occuring before the path is set will be stored to a default engine location.
		
		@param path file path to use (string)
	**/
	static function set_file_path(path:String):Void;
	/**
		Stores user-defined string value.
		
		Store a user value that will get written to a crash dump when
		a crash occurs. This can be user id:s, breadcrumb data etc.
		There are 32 slots indexed from 0. Each slot stores at most 255 characters.
		
		@param index slot index. 0-indexed. (number)
		@param value string value to store (string)
	**/
	static function set_user_field(index:Float, value:String):Void;
	/**
		Writes crash dump.
		
		Performs the same steps as if a crash had just occured but
		allows the program to continue.
		The generated dump can be read by crash.load_previous
	**/
	static function write_dump():Void;
}

@:native("_G.crash") extern class CrashVariables {
	/**
		Android build fingerprint.
	**/
	static var SYSFIELD_ANDROID_BUILD_FINGERPRINT(default, never) : TODO;
	/**
		System device language as reported by sys.get_sys_info.
	**/
	static var SYSFIELD_DEVICE_LANGUAGE(default, never) : TODO;
	/**
		Device manufacturer as reported by sys.get_sys_info.
	**/
	static var SYSFIELD_DEVICE_MANUFACTURER(default, never) : TODO;
	/**
		Device model as reported by sys.get_sys_info.
	**/
	static var SYSFIELD_DEVICE_MODEL(default, never) : TODO;
	/**
		Engine version as hash.
	**/
	static var SYSFIELD_ENGINE_HASH(default, never) : TODO;
	/**
		Engine version as release number.
	**/
	static var SYSFIELD_ENGINE_VERSION(default, never) : TODO;
	/**
		System language as reported by sys.get_sys_info.
	**/
	static var SYSFIELD_LANGUAGE(default, never) : TODO;
	/**
		System name as reported by sys.get_sys_info.
	**/
	static var SYSFIELD_SYSTEM_NAME(default, never) : TODO;
	/**
		System version as reported by sys.get_sys_info.
	**/
	static var SYSFIELD_SYSTEM_VERSION(default, never) : TODO;
	/**
		System territory as reported by sys.get_sys_info.
	**/
	static var SYSFIELD_TERRITORY(default, never) : TODO;
}
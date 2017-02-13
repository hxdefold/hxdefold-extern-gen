package defold;

/**
    <p>Native crash logging functions and constants.</p>

    See `CrashVariables` for related variables.
**/
@:native("_G.crash")
extern class Crash {
    /**
        Read backtrace recorded in a loaded crash dump.
        
        A table is returned containing the addresses of the call stack.
        
        @param handle 
        <span class="type">number</span> crash dump handle
        
        @return backtrace 
        <span class="type">table</span> table containing the backtrace
    **/
    static function get_backtrace(handle:Float):TODO;

    /**
        Read text blob recorded in a crash dump.
        
        The format of read text blob is platform specific
        and not guaranteed
        but can be useful for manual inspection.
        
        @param handle 
        <span class="type">number</span> crash dump handle
        
        @return blob 
        <span class="type">string</span> string with the platform specific data
    **/
    static function get_extra_data(handle:Float):TODO;

    /**
        Get all loaded modules from when the crash occured.
        
        The function returns a table containing entries with sub-tables that
        have fields 'name' and 'address' set for all loaded modules.
        
        @param handle 
        <span class="type">number</span> crash dump handle
        
        @return modules 
        <span class="type">table</span> module table
    **/
    static function get_modules(handle:Float):TODO;

    /**
        Read signal number from a crash report.
        
        @param handle 
        <span class="type">number</span> crash dump handle
        
        @return signal 
        <span class="type">number</span> signal number
    **/
    static function get_signum(handle:Float):TODO;

    /**
        Reads a system field from a loaded crash dump.
        
        @param handle 
        <span class="type">number</span> crash dump handle
        
        @param index 
        <span class="type">number</span> system field enum
        
        @return value 
        <span class="type">string</span> value recorded in the crash dump
    **/
    static function get_sys_field(handle:Float, index:Float):TODO;

    /**
        Reads user field from a loaded crash dump.
        
        @param handle 
        <span class="type">number</span> crash dump handle
        
        @param index 
        <span class="type">number</span> user data slot index
        
        @return value 
        <span class="type">string</span> user data value recorded in the crash dump
    **/
    static function get_user_field(handle:Float, index:Float):TODO;

    /**
        Loads a previously written crash dump.
        
        The crash dump will be removed from disk upon a successful
        load, so loading is one-shot.
        
        @return handle 
        <span class="type">number</span> handle to the loaded dump, or nil if no dump was found
    **/
    static function load_previous():TODO;

    /**
        Releases a previously loaded crash dump.
        
        @param handle 
        <span class="type">number</span> handle to loaded crash dump
    **/
    static function release(handle:Float):Void;

    /**
        Sets the file location for crash dumps.
        
        Crashes occuring before the path is set will be stored to a default engine location.
        
        @param path 
        <span class="type">string</span> file path to use
    **/
    static function set_file_path(path:String):Void;

    /**
        Stores user-defined string value.
        
        Store a user value that will get written to a crash dump when
        a crash occurs. This can be user id:s, breadcrumb data etc.
        There are 32 slots indexed from 0. Each slot stores at most 255 characters.
        
        @param index 
        <span class="type">number</span> slot index. 0-indexed
        
        @param value 
        <span class="type">string</span> string value to store
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

@:native("_G.crash")
extern class CrashVariables {
    /**
        Android build fingerprint.
    **/
    static var SYSFIELD_ANDROID_BUILD_FINGERPRINT(default, never):TODO;

    /**
        System device language as reported by sys.get_sys_info.
    **/
    static var SYSFIELD_DEVICE_LANGUAGE(default, never):TODO;

    /**
        Device manufacturer as reported by sys.get_sys_info.
    **/
    static var SYSFIELD_DEVICE_MANUFACTURER(default, never):TODO;

    /**
        Device model as reported by sys.get_sys_info.
    **/
    static var SYSFIELD_DEVICE_MODEL(default, never):TODO;

    /**
        Engine version as hash.
    **/
    static var SYSFIELD_ENGINE_HASH(default, never):TODO;

    /**
        Engine version as release number.
    **/
    static var SYSFIELD_ENGINE_VERSION(default, never):TODO;

    /**
        System language as reported by sys.get_sys_info.
    **/
    static var SYSFIELD_LANGUAGE(default, never):TODO;

    /**
        System name as reported by sys.get_sys_info.
    **/
    static var SYSFIELD_SYSTEM_NAME(default, never):TODO;

    /**
        System version as reported by sys.get_sys_info.
    **/
    static var SYSFIELD_SYSTEM_VERSION(default, never):TODO;

    /**
        System territory as reported by sys.get_sys_info.
    **/
    static var SYSFIELD_TERRITORY(default, never):TODO;
}
package defold;

/**
    <p>Functions and messages for using system resources, controlling the engine,
    error handling and debugging.</p>

    See `SysMessages` for related messages.
    See `SysVariables` for related variables.
**/
@:native("_G.sys")
extern class Sys {
    /**
        Exits application.
        
        Terminates the game application and reports the specified `code` to the OS.
        
        @param code 
        <span class="type">number</span> exit code to report to the OS, 0 means clean exit
    **/
    static function exit(code:Float):Void;

    /**
        Reboot engine with arguments.
        
        Reboots the game engine with a specified set of arguments.
        Arguments will be translated into command line arguments. Calling reboot
        function is equivalent to starting the engine with the same arguments.
        
        On startup the engine reads configuration from "game.project" in the
        project root.
        
        @param arg1 
        <span class="type">string</span> argument 1
        
        @param arg2 
        <span class="type">string</span> argument 2
        
        @param arg3 
        <span class="type">string</span> argument 3
        
        @param arg4 
        <span class="type">string</span> argument 4
        
        @param arg5 
        <span class="type">string</span> argument 5
        
        @param arg6 
        <span class="type">string</span> argument 6
    **/
    static function reboot(arg1:String, arg2:String, arg3:String, arg4:String, arg5:String, arg6:String):Void;

    /**
        Set update frequency.
        
        Set game update-frequency (frame cap). This option is equivalent to `display.update_frequency` in
        the "game.project" settings but set in run-time. If `Vsync` checked in "game.project", the rate will
        be clamped to a swap interval that matches any detected main monitor refresh rate. If `Vsync` is
        unchecked the engine will try to respect the rate in software using timers. There is no
        guarantee that the frame cap will be achieved depending on platform specifics and hardware settings.
        
        @param frequency 
        target frequency. 60 for 60 fps
    **/
    static function set_update_frequency(frequency:TODO):Void;

    /**
        Set vsync swap interval.
        
        Set the vsync swap interval. The interval with which to swap the front and back buffers
        in sync with vertical blanks (v-blank), the hardware event where the screen image is updated
        with data from the front buffer. A value of 1 swaps the buffers at every v-blank, a value of
        2 swaps the buffers every other v-blank and so on. A value of 0 disables waiting for v-blank
        before swapping the buffers. Default value is 1.
        
        When setting the swap interval to 0 and having `vsync` disabled in
        "game.project", the engine will try to respect the set frame cap value from
        "game.project" in software instead.
        
        This setting may be overridden by driver settings.
        
        @param swap_interval 
        target swap interval.
    **/
    static function set_vsync_swap_interval(swap_interval:TODO):Void;

    /**
        Get application information.
        
        Returns a table with application information for the requested app.
        
        <span class="icon-ios"></span> On iOS, the `app_string` is an url scheme for the app that is queried. Your
        game needs to list the schemes that are queried in an `LSApplicationQueriesSchemes` array
        in a custom "Info.plist".
        
        <span class="icon-android"></span> On Android, the `app_string` is the package identifier for the app.
        
        @param app_string 
        <span class="type">string</span> platform specific string with application package or query, see above for details.
        
        @return app_info 
        <span class="type">table</span> table with application information in the following fields:
        
        <dl>
        <dt>`installed`</dt>
        <dd><span class="type">boolean</span> `true` if the application is installed, `false` otherwise.</dd>
        </dl>
    **/
    static function get_application_info(app_string:String):TODO;

    /**
        Get config value.
        
        Get config value from the game.project configuration file.
        
        In addition to the project file, configuration values can also be passed
        to the runtime as command line arguments with the `--config` argument.
        
        @param key 
        <span class="type">string</span> key to get value for. The syntax is SECTION.KEY
        
        @return value 
        <span class="type">string</span> config value as a string. nil if the config key doesn't exists
    **/
    static function get_config(key:String):TODO;

    /**
        Get config value with default value.
        
        Get config value from the game.project configuration file with default value
        
        @param key 
        <span class="type">string</span> key to get value for. The syntax is SECTION.KEY
        
        @param default_value 
        <span class="type">string</span> default value to return if the value does not exist
        
        @return value 
        <span class="type">string</span> config value as a string. default_value if the config key does not exist
    **/
    static function get_config(key:String, default_value:String):TODO;

    /**
        Get current network connectivity status.
        
        <span class="icon-ios"></span> <span class="icon-android"></span> Returns the current network connectivity status
        on mobile platforms.
        
        On desktop, this function always return `sys.NETWORK_CONNECTED`.
        
        @return status 
        <span class="type">constant</span> network connectivity status:
        
         * `sys.NETWORK_DISCONNECTED` (no network connection is found)
         * `sys.NETWORK_CONNECTED_CELLULAR` (connected through mobile cellular)
         * `sys.NETWORK_CONNECTED` (otherwise, Wifi)
    **/
    static function get_connectivity():TODO;

    /**
        Get engine information.
        
        Returns a table with engine information.
        
        @return engine_info 
        <span class="type">table</span> table with engine information in the following fields:
        
        <dl>
        <dt>`version`</dt>
        <dd><span class="type">string</span> The current Defold engine version, i.e. "1.2.96"</dd>
        <dt>`version_sha1`</dt>
        <dd><span class="type">string</span> The SHA1 for the current engine build, i.e. "0060183cce2e29dbd09c85ece83cbb72068ee050"</dd>
        <dt>`is_debug`</dt>
        <dd><span class="type">boolean</span> If the engine is a debug or release version</dd>
        </dl>
    **/
    static function get_engine_info():TODO;

    /**
        Enumerate network interfaces.
        
        Returns an array of tables with information on network interfaces.
        
        @return ifaddrs 
        <span class="type">table</span> an array of tables. Each table entry contain the following fields:
        
        <dl>
        <dt>`name`</dt>
        <dd><span class="type">string</span> Interface name</dd>
        <dt>`address`</dt>
        <dd><span class="type">string</span> IP address. <span class="icon-attention"></span> might be `nil` if not available.</dd>
        <dt>`mac`</dt>
        <dd><span class="type">string</span> Hardware MAC address. <span class="icon-attention"></span> might be nil if not available.</dd>
        <dt>`up`</dt>
        <dd><span class="type">boolean</span> `true` if the interface is up (available to transmit and receive data), `false` otherwise.</dd>
        <dt>`running`</dt>
        <dd><span class="type">boolean</span> `true` if the interface is running, `false` otherwise.</dd>
        </dl>
    **/
    static function get_ifaddrs():TODO;

    /**
        Gets the save-file path.
        
        The save-file path is operating system specific and is typically located under the user's home directory.
        
        @param application_id 
        <span class="type">string</span> user defined id of the application, which helps define the location of the save-file
        
        @param file_name 
        <span class="type">string</span> file-name to get path for
        
        @return path 
        <span class="type">string</span> path to save-file
    **/
    static function get_save_file(application_id:String, file_name:String):TODO;

    /**
        Get system information.
        
        Returns a table with system information.
        
        @return sys_info 
        <span class="type">table</span> table with system information in the following fields:
        
        <dl>
        <dt>`device_model`</dt>
        <dd><span class="type">string</span> <span class="icon-ios"></span><span class="icon-android"></span> Only available on iOS and Android.</dd>
        <dt>`manufacturer`</dt>
        <dd><span class="type">string</span> <span class="icon-ios"></span><span class="icon-android"></span> Only available on iOS and Android.</dd>
        <dt>`system_name`</dt>
        <dd><span class="type">string</span> The system OS name: "Darwin", "Linux", "Windows", "HTML5", "Android" or "iPhone OS"</dd>
        <dt>`system_version`</dt>
        <dd><span class="type">string</span> The system OS version.</dd>
        <dt>`api_version`</dt>
        <dd><span class="type">string</span> The API version on the system.</dd>
        <dt>`language`</dt>
        <dd><span class="type">string</span> Two character ISO-639 format, i.e. "en".</dd>
        <dt>`device_language`</dt>
        <dd><span class="type">string</span> Two character ISO-639 format (i.e. "sr") and, if applicable, followed by a dash (-) and an ISO 15924 script code (i.e. "sr-Cyrl" or "sr-Latn"). Reflects the device preferred language.</dd>
        <dt>`territory`</dt>
        <dd><span class="type">string</span> Two character ISO-3166 format, i.e. "US".</dd>
        <dt>`gmt_offset`</dt>
        <dd><span class="type">number</span> The current offset from GMT (Greenwich Mean Time), in minutes.</dd>
        <dt>`device_ident`</dt>
        <dd><span class="type">string</span> <span class="icon-ios"></span> "identifierForVendor" on iOS. <span class="icon-android"></span> "android_id" on Android.</dd>
        <dt>`ad_ident`</dt>
        <dd><span class="type">string</span> <span class="icon-ios"></span> "advertisingIdentifier" on iOS. <span class="icon-android"></span> advertising ID provided by Google Play on Android.</dd>
        <dt>`ad_tracking_enabled`</dt>
        <dd><span class="type">boolean</span> `true` if ad tracking is enabled, `false` otherwise.</dd>
        <dt>`user_agent`</dt>
        <dd><span class="type">string</span> <span class="icon-html5"></span> The HTTP user agent, i.e. "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_3) AppleWebKit/602.4.8 (KHTML, like Gecko) Version/10.0.3 Safari/602.4.8"</dd>
        </dl>
    **/
    static function get_sys_info():TODO;

    /**
        Loads a lua table from a file on disk.
        
        If the file exists, it must have been created by `sys.save` to be loaded.
        
        @param filename 
        <span class="type">string</span> file to read from
        
        @return loaded 
        <span class="type">table</span> lua table, which is empty if the file could not be found
    **/
    static function load(filename:String):TODO;

    /**
        Loads resource from game data.
        
        Loads a custom resource. Specify the full filename of the resource that you want
        to load. When loaded, the file data is returned as a string.
        If loading fails, the function returns nil.
        
        In order for the engine to include custom resources in the build process, you need
        to specify them in the "custom_resources" key in your "game.project" settings file.
        You can specify single resource files or directories. If a directory is included
        in the resource list, all files and directories in that directory is recursively
        included:
        
        For example "main/data/,assets/level_data.json".
        
        @param filename 
        <span class="type">string</span> resource to load, full path
        
        @return data 
        <span class="type">string</span> loaded data, or nil if the resource could not be loaded
    **/
    static function load_resource(filename:String):TODO;

    /**
        Open url in default application.
        
        Open URL in default application, typically a browser
        
        @param url 
        <span class="type">string</span> url to open
        
        @return success 
        <span class="type">boolean</span> a boolean indicating if the url could be opened or not
    **/
    static function open_url(url:String):TODO;

    /**
        Saves a lua table to a file stored on disk.
        
        The table can later be loaded by `sys.load`.
        Use `sys.get_save_file` to obtain a valid location for the file.
        Internally, this function uses a workspace buffer sized output file sized 512kb.
        This size reflects the output file size which must not exceed this limit.
        Additionally, the total number of rows that any one table may contain is limited to 65536
        (i.e. a 16 bit range). When tables are used to represent arrays, the values of
        keys are permitted to fall within a 32 bit range, supporting sparse arrays, however
        the limit on the total number of rows remains in effect.
        
        @param filename 
        <span class="type">string</span> file to write to
        
        @param table 
        <span class="type">table</span> lua table to save
        
        @return success 
        <span class="type">boolean</span> a boolean indicating if the table could be saved or not
    **/
    static function save(filename:String, table:TODO<"table">):TODO;

    /**
        Set host to check for network connectivity against.
        
        Sets the host that is used to check for network connectivity against.
        
        @param host 
        <span class="type">string</span> hostname to check against
    **/
    static function set_connectivity_host(host:String):Void;

    /**
        Set the error handler.
        
        Set the Lua error handler function.
        The error handler is a function which is called whenever a lua runtime error occurs.
        
        @param error_handler 
        <span class="type">function(source, message, traceback)</span> the function to be called on error
        
        <dl>
        <dt>`source`</dt>
        <dd><span class="type">string</span> The runtime context of the error. Currently, this is always `"lua"`.</dd>
        <dt>`message`</dt>
        <dd><span class="type">string</span> The source file, line number and error message.</dd>
        <dt>`traceback`</dt>
        <dd><span class="type">string</span> The stack traceback.</dd>
        </dl>
    **/
    static function set_error_handler(error_handler:TODO<"function(source, message, traceback)">):Void;
}

/**
    Messages related to the `Sys` module.
**/
@:publicFields
class SysMessages {
    /**
        Exits application.
        
        Terminates the game application and reports the specified `code` to the OS.
        This message can only be sent to the designated `@system` socket.
    **/
    static var exit(default, never) = new Message<SysMessageExit>("exit");

    /**
        Reboot engine with arguments.
        
        Reboots the game engine with a specified set of arguments.
        Arguments will be translated into command line arguments. Sending the reboot
        command is equivalent to starting the engine with the same arguments.
        
        On startup the engine reads configuration from "game.project" in the
        project root.
        
        This message can only be sent to the designated `@system` socket.
    **/
    static var reboot(default, never) = new Message<SysMessageReboot>("reboot");

    /**
        Set update frequency.
        
        Set game update-frequency (frame cap). This option is equivalent to `display.update_frequency` in
        the "game.project" settings but set in run-time. If `Vsync` checked in "game.project", the rate will
        be clamped to a swap interval that matches any detected main monitor refresh rate. If `Vsync` is
        unchecked the engine will try to respect the rate in software using timers. There is no
        guarantee that the frame cap will be achieved depending on platform specifics and hardware settings.
        
        This message can only be sent to the designated `@system` socket.
    **/
    static var set_update_frequency(default, never) = new Message<SysMessageSetUpdateFrequency>("set_update_frequency");

    /**
        Set vsync swap interval.
        
        Set the vsync swap interval. The interval with which to swap the front and back buffers
        in sync with vertical blanks (v-blank), the hardware event where the screen image is updated
        with data from the front buffer. A value of 1 swaps the buffers at every v-blank, a value of
        2 swaps the buffers every other v-blank and so on. A value of 0 disables waiting for v-blank
        before swapping the buffers. Default value is 1.
        
        When setting the swap interval to 0 and having `vsync` disabled in
        "game.project", the engine will try to respect the set frame cap value from
        "game.project" in software instead.
        
        This setting may be overridden by driver settings.
        
        This message can only be sent to the designated `@system` socket.
    **/
    static var set_vsync(default, never) = new Message<SysMessageSetVsync>("set_vsync");

    /**
        Starts video recording.
        
        Starts video recording of the game frame-buffer to file. Current video format is the
        open vp8 codec in the ivf container. It's possible to upload this format directly
        to YouTube. The VLC video player has native support but with the known issue that
        not the entire file is played back. It's probably an issue with VLC.
        The Miro Video Converter has support for vp8/ivf.
        
        <span class="icon-macos"></span> <span class="icon-windows"></span> <span class="icon-linux"></span> Video recording is only supported on desktop platforms.
        
        <span class="icon-attention"></span> Audio is currently not supported
        
        <span class="icon-attention"></span> Window width and height must be a multiple of 8 to be able to record video.
        
        This message can only be sent to the designated `@system` socket.
    **/
    static var start_record(default, never) = new Message<SysMessageStartRecord>("start_record");

    /**
        Stop current video recording.
        
        Stops the currently active video recording.
        
        <span class="icon-macos"></span> <span class="icon-windows"></span> <span class="icon-linux"></span> Video recording is only supported on desktop platforms.
        
        This message can only be sent to the designated `@system` socket.
    **/
    static var stop_record(default, never) = new Message<Void>("stop_record");

    /**
        Shows/hides the on-screen physics visual debugging.
        
        Toggles the on-screen physics visual debugging mode which is very useful for
        tracking down issues related to physics. This mode visualizes
        all collision object shapes and normals at detected contact points. Toggling
        this mode on is equal to setting `physics.debug` in the "game.project" settings,
        but set in run-time.
        
        This message can only be sent to the designated `@system` socket.
    **/
    static var toggle_physics_debug(default, never) = new Message<Void>("toggle_physics_debug");

    /**
        Shows/hides the on-screen profiler.
        
        Toggles the on-screen profiler.
        The profiler is a real-time tool that shows the numbers of milliseconds spent
        in each scope per frame as well as counters. The profiler is very useful for
        tracking down performance and resource problems.
        
        In addition to the on-screen profiler, Defold includes a web-based profiler that
        allows you to sample a series of data points and then analyze them in detail.
        The web profiler is available at `http://&lt;device IP&gt;:8002` where <device IP> is
        the IP address of the device you are running your game on.
        
        This message can only be sent to the designated `@system` socket.
    **/
    static var toggle_profile(default, never) = new Message<Void>("toggle_profile");
}

/**
    Data for the `SysMessages.exit` message.
**/
typedef SysMessageExit = {
    /**
        
        <span class="type">number</span> exit code to report to the OS, 0 means clean exit
        
    **/
    var code:Float;
}

/**
    Data for the `SysMessages.reboot` message.
**/
typedef SysMessageReboot = {
    /**
        
        <span class="type">string</span> argument 1
        
    **/
    var arg1:String;

    /**
        
        <span class="type">string</span> argument 2
        
    **/
    var arg2:String;

    /**
        
        <span class="type">string</span> argument 3
        
    **/
    var arg3:String;

    /**
        
        <span class="type">string</span> argument 4
        
    **/
    var arg4:String;

    /**
        
        <span class="type">string</span> argument 5
        
    **/
    var arg5:String;

    /**
        
        <span class="type">string</span> argument 6
        
    **/
    var arg6:String;
}

/**
    Data for the `SysMessages.set_update_frequency` message.
**/
typedef SysMessageSetUpdateFrequency = {
    /**
        
        target frequency. 60 for 60 fps
        
    **/
    var frequency:TODO;
}

/**
    Data for the `SysMessages.set_vsync` message.
**/
typedef SysMessageSetVsync = {
    /**
        
        target swap interval.
        
    **/
    var swap_interval:TODO;
}

/**
    Data for the `SysMessages.start_record` message.
**/
typedef SysMessageStartRecord = {
    /**
        
        <span class="type">string</span> file name to write the video to
        
    **/
    var file_name:String;

    /**
        
        <span class="type">number</span> frame period to record, ie write every nth frame. Default value is `2`
        
    **/
    var frame_period:Float;

    /**
        
        <span class="type">number</span> frames per second. Playback speed for the video. Default value is `30`. The fps value doens't affect the recording. It's only meta-data in the written video file.
        
    **/
    var fps:Float;
}

@:native("_G.sys")
extern class SysVariables {
    /**
        Network connected through other, non cellular, connection.
    **/
    static var NETWORK_CONNECTED(default, never):TODO;

    /**
        Network connected through mobile cellular.
    **/
    static var NETWORK_CONNECTED_CELLULAR(default, never):TODO;

    /**
        No network connection found.
    **/
    static var NETWORK_DISCONNECTED(default, never):TODO;
}
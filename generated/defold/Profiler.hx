package defold;

/**
    <p>Functions for getting profiling data in runtime.
    More detailed profiling and debugging information can be found under the <a href="http://www.defold.com/manuals/debugging/">Debugging</a> section in the manuals.</p>
**/
@:native("_G.profiler")
extern class Profiler {
    /**
        Enables or disables the on-screen profiler ui.
        
        Creates and shows or hides and destroys the on-sceen profiler ui
        
        The profiler is a real-time tool that shows the numbers of milliseconds spent
        in each scope per frame as well as counters. The profiler is very useful for
        tracking down performance and resource problems.
        
        @param enabled 
        <span class="type">boolean</span> true to enable, false to disable
    **/
    static function enable_ui(enabled:TODO<"boolean">):Void;

    /**
        Get current CPU usage for app reported by OS.
        
        Get the percent of CPU usage by the application, as reported by the OS.
        
        <span class="icon-attention"></span> This function is not available on <span class="icon-html5"></span> HTML5.
        
        For some platforms (<span class="icon-android"></span> Android, <span class="icon-linux"></span> Linux and <span class="icon-windows"></span> Windows), this information is only available
        by default in the debug version of the engine. It can be enabled in release version as well
        by checking `track_cpu` under `profiler` in the `game.project` file.
        (This means that the engine will sample the CPU usage in intervalls during execution even in release mode.)
        
        @return percent 
        <span class="type">number</span> of CPU used by the application
    **/
    static function get_cpu_usage():TODO;

    /**
        Get current memory usage for app reported by OS.
        
        Get the amount of memory used (resident/working set) by the application in bytes, as reported by the OS.
        
        <span class="icon-attention"></span> This function is not available on <span class="icon-html5"></span> HTML5.
        
        The values are gathered from internal OS functions which correspond to the following;
        
        <table>
        <thead>
        <tr>
        <th>OS</th>
        <th>Value</th>
        </tr>
        </thead>
        <tbody>
        <tr>
        <td><span class="icon-ios"></span> iOS<br/><span class="icon-macos"></span> MacOS<br/><span class="icon-android"></span><br/>Androd<br/><span class="icon-linux"></span> Linux</td>
        <td>`Resident memory`</td>
        </tr>
        <tr>
        <td><span class="icon-windows"></span> Windows</td>
        <td>`Working set`</td>
        </tr>
        <tr>
        <td><span class="icon-html5"></span> HTML5</td>
        <td><span class="icon-attention"></span> Not available</td>
        </tr>
        </tbody>
        </table>
        
        @return bytes 
        <span class="type">number</span> used by the application
    **/
    static function get_memory_usage():TODO;

    /**
        Get the number of recorded frames in the on-screen profiler ui.
        
        Get the number of recorded frames in the on-screen profiler ui recording buffer
        
        @return [type:number] 
        the number of recorded frames, zero if on-screen profiler is disabled
    **/
    static function recorded_frame_count():TODO;

    /**
        Sets the the on-screen profiler ui mode.
        
        Set the on-screen profile mode - run, pause, record or show peak frame
        
        @param mode 
        <span class="type">constant</span> the mode to set the ui profiler in
        
         * `profiler.MODE_RUN` This is default mode that continously shows the last frame
         * `profiler.MODE_PAUSE` Pauses on the currently displayed frame
         * `profiler.MODE_SHOW_PEAK_FRAME` Pauses on the currently displayed frame but shows a new frame if that frame is slower
         * `profiler.MODE_RECORD` Records all incoming frames to the recording buffer
        
        To stop recording, switch to a different mode such as `MODE_PAUSE` or `MODE_RUN`.
        You can also use the `view_recorded_frame` function to display a recorded frame. Doing so stops the recording as well.
        
        Every time you switch to recording mode the recording buffer is cleared.
        The recording buffer is also cleared when setting the `MODE_SHOW_PEAK_FRAME` mode.
    **/
    static function set_ui_mode(mode:TODO<"constant">):Void;

    /**
        Sets the the on-screen profiler ui view mode.
        
        Set the on-screen profile view mode - minimized or expanded
        
        @param mode 
        <span class="type">constant</span> the view mode to set the ui profiler in
        
         * `profiler.VIEW_MODE_FULL` The default mode which displays all the ui profiler details
         * `profiler.VIEW_MODE_MINIMIZED` Minimized mode which only shows the top header (fps counters and ui profiler mode)
    **/
    static function set_ui_view_mode(mode:TODO<"constant">):Void;

    /**
        Shows or hides the vsync wait time in the on-screen profiler ui.
        
        Shows or hides the time the engine waits for vsync in the on-screen profiler
        
        Each frame the engine waits for vsync and depending on your vsync settings and how much time
        your game logic takes this time can dwarf the time in the game logic making it hard to
        see details in the on-screen profiler graph and lists.
        
        Also, by hiding this the FPS times in the header show the time spent each time excuding the
        time spent waiting for vsync. This shows you how long time your game is spending actively
        working each frame.
        
        This setting also effects the display of recorded frames but does not affect the actual
        recorded frames so it is possible to toggle this on and off when viewing recorded frames.
        
        By default the vsync wait times is displayed in the profiler.
        
        @param visible 
        <span class="type">boolean</span> true to include it in the display, false to hide it.
    **/
    static function set_ui_vsync_wait_visible(visible:TODO<"boolean">):Void;

    /**
        Displays a previously recorded frame in the on-screen profiler ui.
        
        Pauses and displays a frame from the recording buffer in the on-screen profiler ui
        
        The frame to show can either be an absolute frame or a relative frame to the current frame.
        
        @param frame_index 
        <span class="type">table</span> a table where you specify one of the following parameters:
        
         * `distance` The offset from the currently displayed frame (this is truncated between zero and the number of recorded frames)
         * `frame` The frame index in the recording buffer (1 is first recorded frame)
    **/
    static function view_recorded_frame(frame_index:TODO<"table">):Void;
}
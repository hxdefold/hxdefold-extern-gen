package defold;

/**
    <p>Functions for getting profiling data in runtime.
    More detailed profiling and debugging information can be found under the <a href="http://www.defold.com/manuals/debugging/">Debugging</a> section in the manuals.</p>
**/
@:native("_G.profiler")
extern class Profiler {
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
}
package defold;

/**
    <p>Timers allow you to set a delay and a callback to be called when the timer completes.</p>
    <p>The timers created with this API are updated with the collection timer where they
    are created. If you pause or speed up the collection (using <code>set_time_step</code>) it will
    also affect the new timer.</p>

    See `TimerVariables` for related variables.
**/
@:native("_G.timer")
extern class Timer {
    /**
        Cancel a timer.
        
        You may cancel a timer from inside a timer callback.
        Cancelling a timer that is already executed or cancelled is safe.
        
        @param handle 
        the timer handle returned by timer.delay()
        
        @return true 
        if the timer was active, false if the timer is already cancelled / complete
    **/
    static function cancel(handle:TODO):TODO;

    /**
        Create a timer.
        
        Adds a timer and returns a unique handle
        
        You may create more timers from inside a timer callback.
        
        Using a delay of 0 will result in a timer that triggers at the next frame just before
        script update functions.
        
        If you want a timer that triggers on each frame, set delay to 0.0f and repeat to true.
        
        Timers created within a script will automatically die when the script is deleted.
        
        @param delay 
        time interval in seconds
        
        @param repeat 
        true = repeat timer until cancel, false = one-shot timer
        
        @param callback 
        <span class="type">function(self, handle, time_elapsed)</span> timer callback function
        
        <dl>
        <dt>`self`</dt>
        <dd><span class="type">object</span> The current object</dd>
        <dt>`handle`</dt>
        <dd><span class="type">number</span> The handle of the timer</dd>
        <dt>`time_elapsed`</dt>
        <dd><span class="type">number</span> The elapsed time - on first trigger it is time since timer.delay call, otherwise time since last trigger</dd>
        </dl>
        @return handle 
        identifier for the create timer, returns timer.INVALID_TIMER_HANDLE if the timer can not be created
    **/
    static function delay(delay:TODO, repeat:TODO, callback:TODO<"function(self, handle, time_elapsed)">):TODO;
}

@:native("_G.timer")
extern class TimerVariables {
    /**
        Indicates an invalid timer handle.
    **/
    static var INVALID_TIMER_HANDLE(default, never):TODO;
}
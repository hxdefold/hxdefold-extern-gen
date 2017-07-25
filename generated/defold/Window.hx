package defold;

/**
    <p>Functions and constants to access the window, window event listeners
    and screen dimming.</p>

    See `WindowVariables` for related variables.
**/
@:native("_G.window")
extern class Window {
    /**
        Get the mode for screen dimming.
        
        <span class="icon-ios"></span> <span class="icon-android"></span> Returns the current dimming mode set on a mobile device.
        
        The dimming mode specifies whether or not a mobile device should dim the screen after a period without user interaction.
        
        On platforms that does not support dimming, `window.DIMMING_UNKNOWN` is always returned.
        
        @return mode 
        <span class="type">constant</span> The mode for screen dimming
        
         * `window.DIMMING_UNKNOWN`
         * `window.DIMMING_ON`
         * `window.DIMMING_OFF`
    **/
    static function get_dim_mode():TODO;

    /**
        Set the mode for screen dimming.
        
        <span class="icon-ios"></span> <span class="icon-android"></span> Sets the dimming mode on a mobile device.
        
        The dimming mode specifies whether or not a mobile device should dim the screen after a period without user interaction. The dimming mode will only affect the mobile device while the game is in focus on the device, but not when the game is running in the background.
        
        This function has no effect on platforms that does not support dimming.
        
        @param mode 
        <span class="type">constant</span> The mode for screen dimming
        
         * `window.DIMMING_ON`
         * `window.DIMMING_OFF`
    **/
    static function set_dim_mode(mode:TODO<"constant">):Void;

    /**
        Sets a window event listener.
        
        Sets a window event listener.
        
        @param callback 
        <span class="type">function(self, event, data)</span> A callback which receives info about window events. Pass an empty function if you no longer wish to receive callbacks.
        
        <dl>
        <dt>`self`</dt>
        <dd><span class="type">object</span> The calling script</dd>
        <dt>`event`</dt>
        <dd><span class="type">constant</span> The type of event. Can be one of these:</dd>
        </dl>
        
         * `window.WINDOW_EVENT_FOCUS_LOST`
         * `window.WINDOW_EVENT_FOCUS_GAINED`
         * `window.WINDOW_EVENT_RESIZED`
        
        <dl>
        <dt>`data`</dt>
        <dd><span class="type">table</span> The callback value `data` is a table which currently holds these values</dd>
        </dl>
        
         * <span class="type">number</span> `width`: The width of a resize event. nil otherwise.
         * <span class="type">number</span> `height`: The height of a resize event. nil otherwise.
    **/
    static function set_listener(callback:TODO<"function(self, event, data)">):Void;
}

@:native("_G.window")
extern class WindowVariables {
    /**
        Dimming mode off.
        
        Dimming mode is used to control whether or not a mobile device should dim the screen after a period without user interaction.
    **/
    static var DIMMING_OFF(default, never):TODO;

    /**
        Dimming mode on.
        
        Dimming mode is used to control whether or not a mobile device should dim the screen after a period without user interaction.
    **/
    static var DIMMING_ON(default, never):TODO;

    /**
        Dimming mode unknown.
        
        Dimming mode is used to control whether or not a mobile device should dim the screen after a period without user interaction.
        This mode indicates that the dim mode can't be determined, or that the platform doesn't support dimming.
    **/
    static var DIMMING_UNKNOWN(default, never):TODO;

    /**
        Focus gained window event.
        
        This event is sent to a window event listener when the game window or app screen has
        gained focus.
        This event is also sent at game startup and the engine gives focus to the game.
    **/
    static var WINDOW_EVENT_FOCUS_GAINED(default, never):TODO;

    /**
        Focus lost window event.
        
        This event is sent to a window event listener when the game window or app screen has lost focus.
    **/
    static var WINDOW_EVENT_FOCUS_LOST(default, never):TODO;

    /**
        Resized window event.
        
        This event is sent to a window event listener when the game window or app screen is resized.
        The new size is passed along in the data field to the event listener.
    **/
    static var WINDOW_EVENT_RESIZED(default, never):TODO;
}
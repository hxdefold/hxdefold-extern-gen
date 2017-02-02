package defold;

/**
	Functions and constants to access the window, window event listeners
	and screen dimming.

	See `WindowVariables` for related variables.
**/
@:native("_G.window") extern class Window {
	/**
		Get the mode for screen dimming.
		
		The dimming mode specifies whether or not a mobile device should dim the screen after a period without user interaction.
	**/
	static function get_dim_mode():TODO;
	/**
		Set the mode for screen dimming.
		
		The dimming mode specifies whether or not a mobile device should dim the screen after a period without user interaction. The dimming mode will only affect the mobile device while the game is in focus on the device, but not when the game is running in the background.
		
		@param mode (constant) The mode for screen dimming
		
		     * `window.DIMMING_ON`
		     * `window.DIMMING_OFF`
	**/
	static function set_dim_mode(mode:TODO):TODO;
	/**
		Sets a window event listener.
		
		Sets a window event listener.
		
		@param callback (function) A callback which receives info about window events. Can be nil.
		
		     * self (object) The calling script
		     * event (number) The type of event. Can be one of these:
		    
		
		         * window.WINDOW_EVENT_FOCUS_LOST
		         * window.WINDOW_EVENT_FOCUS_GAINED
		         * window.WINDOW_EVENT_RESIZED
		    
		
		     * data (table) The callback value ''data'' is a table which currently holds these values
		    
		
		         * width (number) The width of a resize event. nil otherwise.
		         * height (number) The height of a resize event. nil otherwise.
	**/
	static function set_listener(callback:TODO):TODO;
}

@:native("_G.window") extern class WindowVariables {
	/**
		Dimming mode off.
		
		Dimming mode is used to control whether or not a mobile device should dim the screen after a period without user interaction.
	**/
	static var DIMMING_OFF(default, never) : TODO;
	/**
		Dimming mode on.
		
		Dimming mode is used to control whether or not a mobile device should dim the screen after a period without user interaction.
	**/
	static var DIMMING_ON(default, never) : TODO;
	/**
		Dimming mode unknown.
		
		Dimming mode is used to control whether or not a mobile device should dim the screen after a period without user interaction.
		This mode indicates that the dim mode can't be determined, or that the platform doesn't support dimming.
	**/
	static var DIMMING_UNKNOWN(default, never) : TODO;
}
package defold;

@:native("_G.window") extern class Window {
	/**
		Get the mode for screen dimming
		
		The dimming mode specifies whether or not a mobile device should dim the screen after a period without user interaction.
	**/
	static function get_dim_mode():TODO;
	/**
		Set the mode for screen dimming
		
		The dimming mode specifies whether or not a mobile device should dim the screen after a period without user interaction. The dimming mode will only affect the mobile device while the game is in focus on the device, but not when the game is running in the background.
		
		@param mode (constant) The mode for screen dimming
		<ul>
		    <li><code>window.DIMMING_ON</code></li>
		    <li><code>window.DIMMING_OFF</code></li>
		</ul>
	**/
	static function set_dim_mode(mode:TODO):TODO;
	/**
		Sets a window event listener
		
		Sets a window event listener.
		
		@param callback (function) A callback which receives info about window events. Can be nil.
		
		<ul>
		    <li>self (object) The calling script</li>
		    <li>event (number) The type of event. Can be one of these:</li>
		    <ul>
		        <li>window.WINDOW_EVENT_FOCUS_LOST</li>
		        <li>window.WINDOW_EVENT_FOCUS_GAINED</li>
		        <li>window.WINDOW_EVENT_RESIZED</li>
		    </ul>
		    <li>data (table) The callback value ''data'' is a table which currently holds these values</li>
		    <ul>
		        <li>width (number) The width of a resize event. nil otherwise.</li>
		        <li>height (number) The height of a resize event. nil otherwise.</li>
		    </ul>
		</ul>
	**/
	static function set_listener(callback:TODO):TODO;
}

@:native("_G.window") extern class WindowVariables {
	/**
		dimming mode off
		
		Dimming mode is used to control whether or not a mobile device should dim the screen after a period without user interaction.
	**/
	static var DIMMING_OFF(default, never) : TODO;
	/**
		dimming mode on
		
		Dimming mode is used to control whether or not a mobile device should dim the screen after a period without user interaction.
	**/
	static var DIMMING_ON(default, never) : TODO;
	/**
		dimming mode unknown
		
		Dimming mode is used to control whether or not a mobile device should dim the screen after a period without user interaction.
		This mode indicates that the dim mode can't be determined, or that the platform doesn't support dimming.
	**/
	static var DIMMING_UNKNOWN(default, never) : TODO;
}
package defold;

/**
    Messages for controlling and interacting with collection proxies
    which are used to dynamically load collections into the runtime.

    This module currently has no functions.

    See `CollectionProxyMessages` for related messages.
**/
@:native("_G") extern class CollectionProxy {

}

/**
    Data for the `CollectionProxyMessages.set_time_step` message.
**/
typedef CollectionProxyMessageSetTimeStep = {
	/**
		time-step scaling factor (number)
	**/
	var factor:TODO;
	/**
		time-step mode: 0 for continuous and 1 for discrete (number)
	**/
	var mode:TODO;
}

/**
    Messages related to the `CollectionProxy` module.
**/
@:publicFields class CollectionProxyMessages {
	/**
		Tells a collection proxy to start asynchronous loading of the referenced collection.
		
		Post this message to a collection-proxy-component to start background loading of the referenced collection.
		When the loading has completed, the message `proxy_loaded` will be sent back to the script.
		
		A loaded collection must be initialized (message `init`) and enabled (message `enable`) in order to be simulated and drawn.
	**/
	static var async_load(default, never):Message<Void> = new Message("async_load");

	/**
		Tells a collection proxy to disable the referenced collection.
		
		Post this message to a collection-proxy-component to disable the referenced collection, which in turn disables the contained game objects and components.
	**/
	static var disable(default, never):Message<Void> = new Message("disable");

	/**
		Tells a collection proxy to enable the referenced collection.
		
		Post this message to a collection-proxy-component to enable the referenced collection, which in turn enables the contained game objects and components.
		If the referenced collection was not initialized prior to this call, it will automatically be initialized.
	**/
	static var enable(default, never):Message<Void> = new Message("enable");

	/**
		Tells a collection proxy to finalize the referenced collection.
		
		Post this message to a collection-proxy-component to finalize the referenced collection, which in turn finalizes the contained game objects and components.
	**/
	static var final(default, never):Message<Void> = new Message("final");

	/**
		Tells a collection proxy to initialize the loaded collection.
		
		Post this message to a collection-proxy-component to initialize the game objects and components in the referenced collection.
		Sending `enable` to an uninitialized collection proxy automatically initializes it.
		The `init` message simply provides a higher level of control.
	**/
	static var init(default, never):Message<Void> = new Message("init");

	/**
		Tells a collection proxy to start loading the referenced collection.
		
		Post this message to a collection-proxy-component to start the loading of the referenced collection.
		When the loading has completed, the message `proxy_loaded` will be sent back to the script.
		
		A loaded collection must be initialized (message `init`) and enabled (message `enable`) in order to be simulated and drawn.
	**/
	static var load(default, never):Message<Void> = new Message("load");

	/**
		Reports that a collection proxy has loaded its referenced collection.
		
		This message is sent back to the script that initiated a collection proxy load when the referenced
		collection is loaded. See documentation for "load" for examples how to use.
	**/
	static var proxy_loaded(default, never):Message<Void> = new Message("proxy_loaded");

	/**
		Reports that a collection proxy has unloaded its referenced collection.
		
		This message is sent back to the script that initiated an unload with a collection proxy when
		the referenced collection is unloaded. See documentation for "unload" for examples how to use.
	**/
	static var proxy_unloaded(default, never):Message<Void> = new Message("proxy_unloaded");

	/**
		Sets the time-step for update.
		
		Post this message to a collection-proxy-component to modify the time-step used when updating the collection controlled by the proxy.
		The time-step is modified by a scaling `factor` and can be incremented either continuously or in discrete steps.
		
		The continuous mode can be used for slow-motion or fast-forward effects.
		
		The discrete mode is only useful when scaling the time-step to pass slower than real time (`factor` is below 1).
		The time-step will then be set to 0 for as many frames as the scaling demands and then take on the full real-time-step for one frame,
		to simulate pulses. E.g. if `factor` is set to `0.1` the time-step would be 0 for 9 frames, then be 1/60 for one
		frame, 0 for 9 frames, and so on. The result in practice is that the game looks like it's updated at a much lower frequency than 60 Hz,
		which can be useful for debugging when each frame needs to be inspected.
	**/
	static var set_time_step(default, never):Message<CollectionProxyMessageSetTimeStep> = new Message("set_time_step");

	/**
		Tells a collection proxy to start unloading the referenced collection.
		
		Post this message to a collection-proxy-component to start the unloading of the referenced collection.
		When the unloading has completed, the message `proxy_unloaded` will be sent back to the script.
	**/
	static var unload(default, never):Message<Void> = new Message("unload");
}
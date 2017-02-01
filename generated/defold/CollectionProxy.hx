package defold;

@:publicFields class CollectionProxyMessages {
	/**
		tells a collection proxy to start asynchronous loading of the referenced collection
		
		Post this message to a collection-proxy-component to start background loading of the referenced collection.
		When the loading has completed, the message `proxy_loaded` will be sent back to the script.
		
		A loaded collection must be initialized (message `init`) and enabled (message `enable`) in order to be simulated and drawn.
	**/
	static var AsyncLoad(default, never) : Message<{ }> = new Message("async_load");
	/**
		tells a collection proxy to disable the referenced collection
		
		Post this message to a collection-proxy-component to disable the referenced collection, which in turn disables the contained game objects and components.
	**/
	static var Disable(default, never) : Message<{ }> = new Message("disable");
	/**
		tells a collection proxy to enable the referenced collection
		
		Post this message to a collection-proxy-component to enable the referenced collection, which in turn enables the contained game objects and components.
		If the referenced collection was not initialized prior to this call, it will automatically be initialized.
	**/
	static var Enable(default, never) : Message<{ }> = new Message("enable");
	/**
		tells a collection proxy to finalize the referenced collection
		
		Post this message to a collection-proxy-component to finalize the referenced collection, which in turn finalizes the contained game objects and components.
	**/
	static var Final(default, never) : Message<{ }> = new Message("final");
	/**
		tells a collection proxy to initialize the loaded collection
		
		Post this message to a collection-proxy-component to initialize the game objects and components in the referenced collection.
		Sending `enable` to an uninitialized collection proxy automatically initializes it.
		The `init` message simply provides a higher level of control.
	**/
	static var Init(default, never) : Message<{ }> = new Message("init");
	/**
		tells a collection proxy to start loading the referenced collection
		
		Post this message to a collection-proxy-component to start the loading of the referenced collection.
		When the loading has completed, the message `proxy_loaded` will be sent back to the script.
		
		A loaded collection must be initialized (message `init`) and enabled (message `enable`) in order to be simulated and drawn.
	**/
	static var Load(default, never) : Message<{ }> = new Message("load");
	/**
		reports that a collection proxy has loaded its referenced collection
		
		This message is sent back to the script that initiated a collection proxy load when the referenced
		collection is loaded. See documentation for "load" for examples how to use.
	**/
	static var ProxyLoaded(default, never) : Message<{ }> = new Message("proxy_loaded");
	/**
		reports that a collection proxy has unloaded its referenced collection
		
		This message is sent back to the script that initiated an unload with a collection proxy when
		the referenced collection is unloaded. See documentation for "unload" for examples how to use.
	**/
	static var ProxyUnloaded(default, never) : Message<{ }> = new Message("proxy_unloaded");
	/**
		sets the time-step for update
		
		Post this message to a collection-proxy-component to modify the time-step used when updating the collection controlled by the proxy.
		The time-step is modified by a scaling `factor` and can be incremented either continuously or in discrete steps.
		
		The continuous mode can be used for slow-motion or fast-forward effects.
		
		The discrete mode is only useful when scaling the time-step to pass slower than real time (`factor` is below 1).
		The time-step will then be set to 0 for as many frames as the scaling demands and then take on the full real-time-step for one frame,
		to simulate pulses. E.g. if `factor` is set to `0.1` the time-step would be 0 for 9 frames, then be 1/60 for one
		frame, 0 for 9 frames, and so on. The result in practice is that the game looks like it's updated at a much lower frequency than 60 Hz,
		which can be useful for debugging when each frame needs to be inspected.
		
		@param factor time-step scaling factor (number)
		@param mode time-step mode: 0 for continuous and 1 for discrete (number)
	**/
	static var SetTimeStep(default, never) : Message<{ var factor : TODO; var mode : TODO; }> = new Message("set_time_step");
	/**
		tells a collection proxy to start unloading the referenced collection
		
		Post this message to a collection-proxy-component to start the unloading of the referenced collection.
		When the unloading has completed, the message `proxy_unloaded` will be sent back to the script.
	**/
	static var Unload(default, never) : Message<{ }> = new Message("unload");
}
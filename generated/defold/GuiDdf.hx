package defold;

/**
	This module currently has no functions.


	See `GuiDdfMessages` for related messages.
**/
@:native("_G") extern class GuiDdf {

}

/**
	Data for the `GuiDdfMessages.layout_changed` message.
**/
typedef GuiDdfMessageLayoutChanged = {
	/**
		the id of the layout the engine is changing to (hash)
	**/
	var id : TODO;
	/**
		the id of the layout the engine is changing from (hash)
	**/
	var previous_id : TODO;
}

/**
	Messages related to the `GuiDdf` module.
**/
@:publicFields class GuiDdfMessages {
	/**
		Reports a layout change.
		
		This message is broadcast to every GUI component when a layout change has been initiated
		on device.
	**/
	static var layout_changed(default, never) : Message<GuiDdfMessageLayoutChanged> = new Message("layout_changed");
}
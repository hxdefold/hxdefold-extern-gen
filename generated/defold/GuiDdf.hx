package defold;

@:publicFields class GuiDdfMessages {
	/**
		reports a layout change
		
		<p>
		This message is broadcast to every GUI component when a layout change has been initiated
		on device.
		</p>
		
		@param id the id of the layout the engine is changing to (hash)
		@param previous_id the id of the layout the engine is changing from (hash)
	**/
	static var LayoutChanged(default, never) : Message<{ var id : TODO; var previous_id : TODO; }> = new Message("layout_changed");
}
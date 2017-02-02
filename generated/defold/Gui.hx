package defold;

/**
	GUI core hooks, functions, messages, properties and constants for
	creation and manipulation of GUI nodes. The "gui" namespace is
	accessible only from gui scripts.

	See `GuiVariables` for related variables.
**/
@:native("_G.gui") extern class Gui {
	/**
		Called when a gui component is finalized.
		
		This is a callback-function, which is called by the engine when a gui component is finalized (destroyed). It can
		be used to e.g. take some last action, report the finalization to other game object instances
		or release user input focus (see `release_input_focus`). There is no use in starting any animations or similar
		from this function since the gui component is about to be destroyed.
		
		@param self reference to the script state to be used for storing data (script_ref)
	**/
	static function final(self:TODO):Void;
	/**
		Animates a node property.
		
		This starts an animation of a node property according to the specified parameters. If the node property is already being
		animated, that animation will be canceled and replaced by the new one. Note however that several different node properties
		can be animated simultaneously. Use `gui.cancel_animation` to stop the animation before it has completed.
		
		Composite properties of type vector3, vector4 or quaternion also expose their sub-components (x, y, z and w).
		You can address the components individually by suffixing the name with a dot '.' and the name of the component.
		For instance, "position.x" (the position x coordinate) or "color.w" (the color alpha value).
		
		If a `complete_function` (Lua function) is specified, that function will be called when the animation has completed.
		By starting a new animation in that function, several animations can be sequenced together. See the examples for more information.
		
		@param node node to animate (node)
		@param property property to animate (string|constant)
		
		   * `"position"`
		   * `"rotation"`
		   * `"scale"`
		   * `"color"`
		   * `"outline"`
		   * `"shadow"`
		   * `"size"`
		   * `"fill_angle"` (pie nodes)
		   * `"inner_radius"` (pie nodes)
		   * `"slice9"` (slice9 nodes)
		
		The following property constants are also defined equalling the corresponding property string names.
		
		   * `gui.PROP_POSITION`
		   * `gui.PROP_ROTATION`
		   * `gui.PROP_SCALE`
		   * `gui.PROP_COLOR`
		   * `gui.PROP_OUTLINE`
		   * `gui.PROP_SHADOW`
		   * `gui.PROP_SIZE`
		   * `gui.PROP_FILL_ANGLE`
		   * `gui.PROP_INNER_RADIUS`
		   * `gui.PROP_SLICE9`
		
		@param to target property value (vector3|vector4)
		@param easing easing to use during animation. Either specify one of the gui.EASING_* constants or provide a vmath.vector with a custom curve. (constant|vector)
		@param duration duration of the animation (number)
		@param delay delay before the animation starts (number)
		@param complete_function function to call when the animation has completed (function)
		@param playback playback mode (constant)
		
		   * `gui.PLAYBACK_ONCE_FORWARD`
		   * `gui.PLAYBACK_ONCE_BACKWARD`
		   * `gui.PLAYBACK_ONCE_PINGPONG`
		   * `gui.PLAYBACK_LOOP_FORWARD`
		   * `gui.PLAYBACK_LOOP_BACKWARD`
		   * `gui.PLAYBACK_LOOP_PINGPONG`
	**/
	static function animate(node:TODO, property:TODO, to:TODO, easing:TODO, duration:TODO, ?delay:TODO, ?complete_function:TODO, ?playback:TODO):Void;
	/**
		Cancels an ongoing animation.
		
		If an animation of the specified node is currently running (started by `gui.animate`), it will immediately be canceled.
		
		@param node node that should have its animation canceled (node)
		@param property property for which the animation should be canceled (string|constant)
		
		   * `"position"`
		   * `"rotation"`
		   * `"scale"`
		   * `"color"`
		   * `"outline"`
		   * `"shadow"`
		   * `"size"`
		   * `"fill_angle"` (pie nodes)
		   * `"inner_radius"` (pie nodes)
		   * `"slice9"` (slice9 nodes)
	**/
	static function cancel_animation(node:TODO, property:TODO):Void;
	/**
		Cancel a node flipbook animation.
		
		Cancels any running flipbook animation on the specified node.
		
		@param node node cancel flipbook animation for (node)
	**/
	static function cancel_flipbook(node:TODO):Void;
	/**
		Cancel a spine animation.
		
		@param node spine node that should cancel its animation
	**/
	static function cancel_spine(node:TODO):Void;
	/**
		Clone a node.
		
		This does not include its children. Use gui.clone_tree for that purpose.
		
		@param node node to clone (node)
		@return the cloned node (node)
	**/
	static function clone(node:TODO):TODO;
	/**
		Clone a node including its children.
		
		Use gui.clone to clone a node excluding its children.
		
		@param node root node to clone (node)
		@return a table mapping node ids to the corresponding cloned nodes (table)
	**/
	static function clone_tree(node:TODO):TODO;
	/**
		Deletes a node.
		
		@param node node to delete (node)
	**/
	static function delete_node(node:TODO):Void;
	/**
		Delete texture.
		
		Delete a dynamically created texture.
		
		@param texture texture id (string|hash)
	**/
	static function delete_texture(texture:TODO):Void;
	/**
		Gets the node adjust mode.
		
		Adjust mode defines how the node will adjust itself to a screen resolution which differs from the project settings.
		
		@param node node from which to get the adjust mode (node)
		@return node adjust mode (constant)
		
		   * `gui.ADJUST_FIT`
		   * `gui.ADJUST_ZOOM`
		   * `gui.ADJUST_STRETCH`
	**/
	static function get_adjust_mode(node:TODO):TODO;
	/**
		Gets the node blend mode.
		
		Blend mode defines how the node will be blended with the background.
		
		@param node node from which to get the blend mode (node)
		@return node blend mode (constant)
		
		   * `gui.BLEND_ALPHA`
		   * `gui.BLEND_ADD`
		   * `gui.BLEND_ADD_ALPHA`
		   * `gui.BLEND_MULT`
	**/
	static function get_blend_mode(node:TODO):TODO;
	/**
		Gets node clipping inverted state.
		
		If node is set as an inverted clipping node, it will clip anything inside as opposed to outside.
		
		@param node node from which to get the clipping inverted state (node)
		@return true or false
	**/
	static function get_clipping_inverted(node:TODO):TODO;
	/**
		Gets the node clipping mode.
		
		Clipping mode defines how the node will clipping it's children nodes
		
		@param node node from which to get the clipping mode (node)
		@return node clipping mode (constant)
		
		   * `gui.CLIPPING_MODE_NONE`
		   * `gui.CLIPPING_MODE_STENCIL`
	**/
	static function get_clipping_mode(node:TODO):TODO;
	/**
		Gets node clipping visibility state.
		
		If node is set as visible clipping node, it will be shown as well as clipping. Otherwise, it will only clip but not show visually.
		
		@param node node from which to get the clipping visibility state (node)
		@return true or false
	**/
	static function get_clipping_visible(node:TODO):TODO;
	/**
		Gets the node color.
		
		@param node node to get the color from (node)
		@return node color (vector4)
	**/
	static function get_color(node:TODO):TODO;
	/**
		Gets the angle for the filled pie sector.
		
		@param node node from which to get the fill angle (node)
		@return sector angle
	**/
	static function get_fill_angle(node:TODO):TODO;
	/**
		Gets the node flipbook animation.
		
		Get node flipbook animation.
		
		@param node node to get flipbook animation from (node)
		@return animation animation id (hash)
	**/
	static function get_flipbook(node:TODO):TODO;
	/**
		Gets the node font.
		
		This is only useful for text nodes. The font must be mapped to the gui scene in the gui editor.
		
		@param node node from which to get the font (node)
		@return font id (hash)
	**/
	static function get_font(node:TODO):TODO;
	/**
		Gets the scene height.
		
		@return scene height (number)
	**/
	static function get_height():TODO;
	/**
		Gets the id of the specified node.
		
		@param node node to retrieve the id from (node)
		@return id of the node (hash)
	**/
	static function get_id(node:TODO):TODO;
	/**
		Gets the index of the specified node.
		
		The index defines the order in which a node appear in a gui scene.
		Higher index means the node is drawn above lower indexed nodes.
		
		@param node node to retrieve the id from (node)
		@return id of the node (hash)
	**/
	static function get_index(node:TODO):TODO;
	/**
		Gets the pie inner radius (defined along the x dimension).
		
		@param node node from where to get the inner radius (node)
		@return inner radius
	**/
	static function get_inner_radius(node:TODO):TODO;
	/**
		Gets the node layer.
		
		The layer must be mapped to the gui scene in the gui editor.
		
		@param node node from which to get the layer (node)
		@return layer id (hash)
	**/
	static function get_layer(node:TODO):TODO;
	/**
		Gets the scene current layout.
		
		@return layout id (hash)
	**/
	static function get_layout():TODO;
	/**
		Gets the leading of the text node.
		
		@param node node from where to get the leading (node)
		@return scaling number (default=1) (number)
	**/
	static function get_leading(node:TODO):TODO;
	/**
		Get line-break mode.
		
		This is only useful for text nodes.
		
		@param node node from which to get the line-break for (node)
		@return line-break (bool)
	**/
	static function get_line_break(node:TODO):TODO;
	/**
		Gets the node with the specified id.
		
		@param id id of the node to retrieve (string|hash)
		@return node instance (node)
	**/
	static function get_node(id:TODO):TODO;
	/**
		Gets the pie outer bounds mode.
		
		@param node node from where to get the outer bounds mode (node)
		@return gui.PIEBOUNDS_RECTANGLE or gui.PIEBOUNDS_ELLIPSE
	**/
	static function get_outer_bounds(node:TODO):TODO;
	/**
		Gets the node outline color.
		
		@param node node to get the outline color from (node)
		@return node outline color (vector4)
	**/
	static function get_outline(node:TODO):TODO;
	/**
		Gets the parent of the specified node.
		
		If the specified node does not have a parent, nil is returned.
		
		@param node the node from which to retrieve its parent (node)
		@return parent instance (node)
	**/
	static function get_parent(node:TODO):TODO;
	/**
		Gets the number of generarted vertices around the perimeter.
		
		@return vertex count (number)
	**/
	static function get_perimeter_vertices():TODO;
	/**
		Gets the pivot of a node.
		
		The pivot specifies how the node is drawn and rotated from its position.
		
		@param node node to get pivot from (node)
		@return pivot constant (constant)
		
		   * `gui.PIVOT_CENTER`
		   * `gui.PIVOT_N`
		   * `gui.PIVOT_NE`
		   * `gui.PIVOT_E`
		   * `gui.PIVOT_SE`
		   * `gui.PIVOT_S`
		   * `gui.PIVOT_SW`
		   * `gui.PIVOT_W`
		   * `gui.PIVOT_NW`
	**/
	static function get_pivot(node:TODO):TODO;
	/**
		Gets the node position.
		
		@param node node to get the position from (node)
		@return node position (vector3)
	**/
	static function get_position(node:TODO):TODO;
	/**
		Gets the node rotation.
		
		@param node node to get the rotation from (node)
		@return node rotation (vector3)
	**/
	static function get_rotation(node:TODO):TODO;
	/**
		Gets the node scale.
		
		@param node node to get the scale from (node)
		@return node scale (vector3)
	**/
	static function get_scale(node:TODO):TODO;
	/**
		Gets the node screen position.
		
		@param node node to get the screen position from (node)
		@return node screen position (vector3)
	**/
	static function get_screen_position(node:TODO):TODO;
	/**
		Gets the node shadow color.
		
		@param node node to get the shadow color from (node)
		@return node shadow color (vector4)
	**/
	static function get_shadow(node:TODO):TODO;
	/**
		Gets the node size.
		
		@param node node to get the size from (node)
		@return node size (vector3)
	**/
	static function get_size(node:TODO):TODO;
	/**
		Gets the node size mode.
		
		Size mode defines how the node will adjust itself in size according to mode.
		
		@param node node from which to get the size mode (node)
		@return node size mode (constant)
		
		   * `gui.SIZE_MODE_MANUAL`
		   * `gui.SIZE_MODE_AUTO`
	**/
	static function get_size_mode(node:TODO):TODO;
	/**
		Get the slice9 values for the node.
		
		@param node node to manipulate
		@return vector4 with configuration values
	**/
	static function get_slice9(node:TODO):TODO;
	/**
		Retrieve the GUI node corresponding to a spine skeleton bone.
		
		The returned node can be used for parenting and transform queries.
		This function has complexity O(n), where n is the number of bones in the spine model skeleton.
		
		@param node spine node to query for bone node (node)
		@param bone_id id of the corresponding bone (string|hash)
		@return node corresponding to the spine bone (node)
	**/
	static function get_spine_bone(node:TODO, bone_id:TODO):TODO;
	/**
		Gets the normalized cursor of the animation on a spine node.
		
		This is only useful for spine nodes. Gets the normalized cursor of the animation on a spine node.
		
		@param node spine node to set the cursor for (node)
		@return cursor value (number)
	**/
	static function get_spine_cursor(node:TODO):TODO;
	/**
		Gets the playback rate of the animation on a spine node.
		
		This is only useful for spine nodes. Gets the playback rate of the animation on a spine node.
		
		@param node spine node to set the cursor for (node)
		@return playack rate (number)
	**/
	static function get_spine_playback_rate(node:TODO):TODO;
	/**
		Gets the spine scene of a node.
		
		This is currently only useful for spine nodes. The spine scene must be mapped to the gui scene in the gui editor.
		
		@param node node to get spine scene from (node)
		@return spine scene id (hash)
	**/
	static function get_spine_scene(node:TODO):TODO;
	/**
		Gets the skin of a spine node.
		
		Gets the spine skin of a spine node
		
		@param node node to get spine skin from (node)
		@return spine skin id, 0 if no explicit skin is set (hash)
	**/
	static function get_spine_skin(node:TODO):TODO;
	/**
		Gets the node text.
		
		This is only useful for text nodes.
		
		@param node node from which to get the text (node)
		@return text value (string)
	**/
	static function get_text(node:TODO):TODO;
	/**
		Get text metrics.
		
		Get text metrics
		
		@param font font id. (hash|string)
		@param text text to measure
		@param width max-width. use for line-breaks (default=FLT_MAX)
		@param line_breaks true to break lines accordingly to width (default=false)
		@param leading scale value for line spacing (default=1)
		@param tracking scale value for letter spacing (default=0)
		@return a table with the following fields: width, height, max_ascent, max_descent
	**/
	static function get_text_metrics(font:TODO, text:TODO, width:TODO, line_breaks:TODO, leading:TODO, tracking:TODO):TODO;
	/**
		Get text metrics from node.
		
		Get text metrics
		
		@param node text node to measure text from
		@return a table with the following fields: width, height, max_ascent, max_descent
	**/
	static function get_text_metrics_from_node(node:TODO):TODO;
	/**
		Gets the node texture.
		
		This is currently only useful for box or pie nodes. The texture must be mapped to the gui scene in the gui editor.
		
		@param node node to get texture from (node)
		@return texture id (hash)
	**/
	static function get_texture(node:TODO):TODO;
	/**
		Gets the tracking of the text node.
		
		@param node node from where to get the tracking (node)
		@return scaling number (default=0) (number)
	**/
	static function get_tracking(node:TODO):TODO;
	/**
		Gets the scene width.
		
		@return scene width (number)
	**/
	static function get_width():TODO;
	/**
		Gets the x-anchor of a node.
		
		The x-anchor specifies how the node is moved when the game is run in a different resolution.
		
		@param node node to get x-anchor from (node)
		@return anchor anchor constant (constant)
		
		   * `gui.ANCHOR_NONE`
		   * `gui.ANCHOR_LEFT`
		   * `gui.ANCHOR_RIGHT`
	**/
	static function get_xanchor(node:TODO):TODO;
	/**
		Gets the y-anchor of a node.
		
		The y-anchor specifies how the node is moved when the game is run in a different resolution.
		
		@param node node to get y-anchor from (node)
		@return anchor anchor constant (constant)
		
		   * `gui.ANCHOR_NONE`
		   * `gui.ANCHOR_TOP`
		   * `gui.ANCHOR_BOTTOM`
	**/
	static function get_yanchor(node:TODO):TODO;
	/**
		Hide on-display keyboard if available.
		
		Hide the on-display keyboard on the device.
	**/
	static function hide_keyboard():Void;
	/**
		Retrieves if a node is enabled or not.
		
		Disabled nodes are not rendered and animations acting on them are not evaluated.
		
		@param node node to query (node)
		@return whether the node is enabled or not (boolean)
	**/
	static function is_enabled(node:TODO):TODO;
	/**
		Moves the first node above the second.
		
		Supply nil as the second argument to move the first node to the top.
		
		@param node to move (node)
		@param ref reference node above which the first node should be moved (node)
	**/
	static function move_above(node:TODO, ref:TODO):Void;
	/**
		Moves the first node below the second.
		
		Supply nil as the second argument to move the first node to the bottom.
		
		@param node to move (node)
		@param ref reference node below which the first node should be moved (node)
	**/
	static function move_below(node:TODO, ref:TODO):Void;
	/**
		Creates a new box node.
		
		@param pos node position (vector3|vector4)
		@param size node size (vector3)
		@return new box node (node)
	**/
	static function new_box_node(pos:TODO, size:TODO):TODO;
	/**
		Creates a new pie node.
		
		@param pos node position (vector3|vector4)
		@param size node size (vector3)
		@return new box node (node)
	**/
	static function new_pie_node(pos:TODO, size:TODO):TODO;
	/**
		Creates a new spine node.
		
		@param pos node position (vector3|vector4)
		@param spine_scene spine scene id (string|hash)
		@return new spine node (node)
	**/
	static function new_spine_node(pos:TODO, spine_scene:TODO):TODO;
	/**
		Creates a new text node.
		
		@param pos node position (vector3|vector4)
		@param text node text (string)
		@return new text node (node)
	**/
	static function new_text_node(pos:TODO, text:TODO):TODO;
	/**
		Create new texture.
		
		Dynamically create a new texture.
		
		@param texture texture id (string|hash)
		@param width texture width (number)
		@param height texture height (number)
		@param type texture type (string|constant)
		
		   * `"rgb"` - RGB
		   * `"rgba"` - RGBA
		   * `"l"` - LUMINANCE
		
		@param buffer texture data (string)
		@param flip flip texture vertically (boolean)
		@return texture creation was successful (boolean)
	**/
	static function new_texture(texture:TODO, width:TODO, height:TODO, type:TODO, buffer:TODO, flip:TODO):TODO;
	/**
		Determines if the node is pickable by the supplied coordinates.
		
		@param node node to be tested for picking (node)
		@param x x-coordinate (see <a href="#on_input">on_input</a> )
		@param y y-coordinate (see <a href="#on_input">on_input</a> )
		@return pick result (boolean)
	**/
	static function pick_node(node:TODO, x:TODO, y:TODO):TODO;
	/**
		Play node flipbook animation.
		
		Play flipbook animation on a box or pie node. The current node texture must contain the animation.
		
		@param node node to set animation for (node)
		@param animation animation id (string|hash)
		@param complete_function function to call when the animation has completed (function)
	**/
	static function play_flipbook(node:TODO, animation:TODO, ?complete_function:TODO):Void;
	/**
		Play a spine animation.
		
		@param node spine node that should play the animation (node)
		@param animation_id id of the animation to play (string|hash)
		@param playback playback mode (constant)
		
		   * `gui.PLAYBACK_ONCE_FORWARD`
		   * `gui.PLAYBACK_ONCE_BACKWARD`
		   * `gui.PLAYBACK_ONCE_PINGPONG`
		   * `gui.PLAYBACK_LOOP_FORWARD`
		   * `gui.PLAYBACK_LOOP_BACKWARD`
		   * `gui.PLAYBACK_LOOP_PINGPONG`
		
		@param play_properties optional table with properties (table)
		
		   * `blend_duration` duration of a linear blend between the current and new animation (number)
		   * `offset` the normalized initial value of the animation cursor when the animation starts playing (number)
		   * `playback_rate` the rate with which the animation will be played. Must be positive (number)
		
		@param complete_function function to call when the animation has completed (function)
	**/
	static function play_spine_anim(node:TODO, animation_id:TODO, playback:TODO, ?play_properties:TODO, ?complete_function:TODO):Void;
	/**
		Reset on-display keyboard if available.
		
		Reset input context of keyboard. This will clear marked text.
	**/
	static function reset_keyboard():Void;
	/**
		Reset all nodes to initial state.
		
		reset only applies to static node loaded from the scene. Nodes created dynamically from script are not affected
	**/
	static function reset_nodes():Void;
	/**
		Sets node adjust mode.
		
		Adjust mode defines how the node will adjust itself to a screen resolution which differs from the project settings.
		
		@param node node to set adjust mode for (node)
		@param adjust_mode adjust mode to set (constant)
		
		   * `gui.ADJUST_FIT`
		   * `gui.ADJUST_ZOOM`
		   * `gui.ADJUST_STRETCH`
	**/
	static function set_adjust_mode(node:TODO, adjust_mode:TODO):Void;
	/**
		Sets node blend mode.
		
		Blend mode defines how the node will be blended with the background.
		
		@param node node to set blend mode for (node)
		@param blend_mode blend mode to set (constant)
		
		   * `gui.BLEND_ALPHA`
		   * `gui.BLEND_ADD`
		   * `gui.BLEND_ADD_ALPHA`
		   * `gui.BLEND_MULT`
	**/
	static function set_blend_mode(node:TODO, blend_mode:TODO):Void;
	/**
		Sets node clipping visibility.
		
		If node is set as an inverted clipping node, it will clip anything inside as opposed to outside.
		
		@param node node to set clipping inverted state for (node)
		@param visible true or false
	**/
	static function set_clipping_inverted(node:TODO, visible:TODO):Void;
	/**
		Sets node clipping mode state.
		
		Clipping mode defines how the node will clipping it's children nodes
		
		@param node node to set clipping mode for (node)
		@param clipping_mode clipping mode to set (constant)
		
		   * `gui.CLIPPING_MODE_NONE`
		   * `gui.CLIPPING_MODE_STENCIL`
	**/
	static function set_clipping_mode(node:TODO, clipping_mode:TODO):Void;
	/**
		Sets node clipping visibility.
		
		If node is set as an visible clipping node, it will be shown as well as clipping. Otherwise, it will only clip but not show visually.
		
		@param node node to set clipping visibility for (node)
		@param visible true or false
	**/
	static function set_clipping_visible(node:TODO, visible:TODO):Void;
	/**
		Sets the node color.
		
		@param node node to set the color for (node)
		@param color new color (vector3|vector4)
	**/
	static function set_color(node:TODO, color:TODO):Void;
	/**
		Enables/disables a node.
		
		Disabled nodes are not rendered and animations acting on them are not evaluated.
		
		@param node node to be enabled/disabled (node)
		@param enabled whether the node should be enabled or not (boolean)
	**/
	static function set_enabled(node:TODO, enabled:TODO):Void;
	/**
		Sets the angle for the filled pie sector.
		
		@param node node to set the fill angle for (node)
		@param sector angle
	**/
	static function set_fill_angle(node:TODO, sector:TODO):Void;
	/**
		Sets the node font.
		
		This is only useful for text nodes. The font must be mapped to the gui scene in the gui editor.
		
		@param node node for which to set the font (node)
		@param font font id (string|hash)
	**/
	static function set_font(node:TODO, font:TODO):Void;
	/**
		Sets the id of the specified node.
		
		@param node node to set the id for (node)
		@param id id to set (string|hash)
	**/
	static function set_id(node:TODO, id:TODO):Void;
	/**
		Sets the pie inner radius (defined along the x dimension).
		
		@param node node to set the inner radius for (node)
		@param inner radius
	**/
	static function set_inner_radius(node:TODO, inner:TODO):Void;
	/**
		Sets the node layer.
		
		The layer must be mapped to the gui scene in the gui editor.
		
		@param node node for which to set the layer (node)
		@param layer layer id (string|hash)
	**/
	static function set_layer(node:TODO, layer:TODO):Void;
	/**
		Sets the leading of the text node.
		
		@param node node for which to set the leading (node)
		@param leading a scaling number for the line spacing (default=1) (number)
	**/
	static function set_leading(node:TODO, leading:TODO):Void;
	/**
		Set line-break mode.
		
		This is only useful for text nodes.
		
		@param node node to set line-break for (node)
		@param text text to set (string)
	**/
	static function set_line_break(node:TODO, text:TODO):Void;
	/**
		Sets the pie outer bounds mode.
		
		@param node node for which to set the outer bounds mode (node)
		@param bounds gui.PIEBOUNDS_RECTANGLE or gui.PIEBOUNDS_ELLIPSE
	**/
	static function set_outer_bounds(node:TODO, bounds:TODO):Void;
	/**
		Sets the node outline color.
		
		@param node node to set the outline color for (node)
		@param color new outline color (vector3|vector4)
	**/
	static function set_outline(node:TODO, color:TODO):Void;
	/**
		Set the parent of the node.
		
		@param node node for which to set its parent (node)
		@param parent parent node to set (node)
	**/
	static function set_parent(node:TODO, parent:TODO):Void;
	/**
		Sets the number of generarted vertices around the perimeter.
		
		@param vertex count (number)
	**/
	static function set_perimeter_vertices(vertex:TODO):Void;
	/**
		Sets the pivot of a node.
		
		The pivot specifies how the node is drawn and rotated from its position.
		
		@param node node to set pivot for (node)
		@param pivot pivot constant (constant)
		
		   * `gui.PIVOT_CENTER`
		   * `gui.PIVOT_N`
		   * `gui.PIVOT_NE`
		   * `gui.PIVOT_E`
		   * `gui.PIVOT_SE`
		   * `gui.PIVOT_S`
		   * `gui.PIVOT_SW`
		   * `gui.PIVOT_W`
		   * `gui.PIVOT_NW`
	**/
	static function set_pivot(node:TODO, pivot:TODO):Void;
	/**
		Sets the node position.
		
		@param node node to set the position for (node)
		@param position new position (vector3|vector4)
	**/
	static function set_position(node:TODO, position:TODO):Void;
	/**
		Set the render ordering for the current GUI scene.
		
		Set the order number for the current GUI scene. The number dictates the sorting of the "gui" render predicate, in other words
		in which order the scene will be rendered in relation to other currently rendered GUI scenes.
		
		The number must be in the range 0 to 15.
		
		@param order rendering order (number)
	**/
	static function set_render_order(order:TODO):Void;
	/**
		Sets the node rotation.
		
		@param node node to set the rotation for (node)
		@param rotation new rotation (vector3|vector4)
	**/
	static function set_rotation(node:TODO, rotation:TODO):Void;
	/**
		Sets the node scale.
		
		@param node node to set the scale for (node)
		@param scale new scale (vector3|vector4)
	**/
	static function set_scale(node:TODO, scale:TODO):Void;
	/**
		Sets the node shadow color.
		
		@param node node to set the shadow color for (node)
		@param color new shadow color (vector3|vector4)
	**/
	static function set_shadow(node:TODO, color:TODO):Void;
	/**
		Sets the node size.
		
		*NOTE!* You can only set size on nodes with size mode set to SIZE_MODE_MANUAL
		
		@param node node to set the size for (node)
		@param size new size (vector3|vector4)
	**/
	static function set_size(node:TODO, size:TODO):Void;
	/**
		Sets node size mode.
		
		Size mode defines how the node will adjust itself in size according to mode.
		
		@param node node to set size mode for (node)
		@param size_mode size mode to set (constant)
		
		   * `gui.SIZE_MODE_MANUAL`
		   * `gui.SIZE_MODE_AUTO`
	**/
	static function set_size_mode(node:TODO, size_mode:TODO):Void;
	/**
		Set the slice9 configuration for the node.
		
		@param node node to manipulate
		@param params new value (vector4)
	**/
	static function set_slice9(node:TODO, params:TODO):Void;
	/**
		Sets the normalized cursor of the animation on a spine node.
		
		This is only useful for spine nodes. The cursor is normalized.
		
		@param node spine node to set the cursor for (node)
		@param cursor cursor value (number)
	**/
	static function set_spine_cursor(node:TODO, cursor:TODO):Void;
	/**
		Sets the playback rate of the animation on a spine node.
		
		This is only useful for spine nodes. Sets the playback rate of the animation on a spine node. Must be positive.
		
		@param node spine node to set the cursor for (node)
		@param playback_rate playback rate (number)
	**/
	static function set_spine_playback_rate(node:TODO, playback_rate:TODO):Void;
	/**
		Sets the spine scene of a node.
		
		Set the spine scene on a spine node. The spine scene must be mapped to the gui scene in the gui editor.
		
		@param node node to set spine scene for (node)
		@param spine_scene spine scene id (string|hash)
	**/
	static function set_spine_scene(node:TODO, spine_scene:TODO):Void;
	/**
		Sets the spine skin.
		
		Sets the spine skin on a spine node.
		
		@param node node to set the spine skin on (node)
		@param spine_skin spine skin id (string|hash)
	**/
	static function set_spine_skin(node:TODO, spine_skin:TODO):Void;
	/**
		Sets the node text.
		
		This is only useful for text nodes.
		
		@param node node to set text for (node)
		@param text text to set (string)
	**/
	static function set_text(node:TODO, text:TODO):Void;
	/**
		Sets the node texture.
		
		Set the texture on a box or pie node. The texture must be mapped to the gui scene in the gui editor.
		
		@param node node to set texture for (node)
		@param texture texture id (string|hash)
	**/
	static function set_texture(node:TODO, texture:TODO):Void;
	/**
		Set the buffer data for a texture.
		
		Set the texture buffer data for a dynamically created texture.
		
		@param texture texture id (string|hash)
		@param width texture width (number)
		@param height texture height (number)
		@param type texture type (string|constant)
		
		   * `"rgb"` - RGB
		   * `"rgba"` - RGBA
		   * `"l"` - LUMINANCE
		
		@param buffer texture data (string)
		@param flip flip texture vertically (boolean)
		@return setting the data was successful (boolean)
	**/
	static function set_texture_data(texture:TODO, width:TODO, height:TODO, type:TODO, buffer:TODO, flip:TODO):TODO;
	/**
		Sets the tracking of the text node.
		
		@param node node for which to set the tracking (node)
		@param tracking a scaling number for the letter spacing (default=0) (number)
	**/
	static function set_tracking(node:TODO, tracking:TODO):Void;
	/**
		Sets the x-anchor of a node.
		
		The x-anchor specifies how the node is moved when the game is run in a different resolution.
		
		@param node node to set x-anchor for (node)
		@param anchor anchor constant (constant)
		
		   * `gui.ANCHOR_NONE`
		   * `gui.ANCHOR_LEFT`
		   * `gui.ANCHOR_RIGHT`
	**/
	static function set_xanchor(node:TODO, anchor:TODO):Void;
	/**
		Sets the y-anchor of a node.
		
		The y-anchor specifies how the node is moved when the game is run in a different resolution.
		
		@param node node to set y-anchor for (node)
		@param anchor anchor constant (constant)
		
		   * `gui.ANCHOR_NONE`
		   * `gui.ANCHOR_TOP`
		   * `gui.ANCHOR_BOTTOM`
	**/
	static function set_yanchor(node:TODO, anchor:TODO):Void;
	/**
		Display on-display keyboard if available.
		
		The specified type of keyboard is displayed, if it is available on
		the device.
		
		@param type keyboard type (constant)
		
		   * `gui.KEYBOARD_TYPE_DEFAULT`
		   * `gui.KEYBOARD_TYPE_EMAIL`
		   * `gui.KEYBOARD_TYPE_NUMBER_PAD`
		   * `gui.KEYBOARD_TYPE_PASSWORD`
		
		@param autoclose close keyboard automatically when clicking outside
	**/
	static function show_keyboard(type:TODO, autoclose:TODO):Void;
	/**
		Called when a gui component is initialized.
		
		This is a callback-function, which is called by the engine when a gui component is initialized. It can be used
		to set the initial state of the script and gui scene.
		
		@param self reference to the script state to be used for storing data (script_ref)
	**/
	static function init(self:TODO):Void;
	/**
		Called when user input is received.
		
		This is a callback-function, which is called by the engine when user input is sent to the instance of the gui component.
		It can be used to take action on the input, e.g. modify the gui according to the input.
		
		For an instance to obtain user input, it must first acquire input focuse through the message `acquire_input_focus`.
		See the documentation of that message for more information.
		
		The `action` parameter is a table containing data about the input mapped to the `action_id`.
		For mapped actions it specifies the value of the input and if it was just pressed or released.
		Actions are mapped to input in an input_binding-file.
		
		Mouse movement is specifically handled and uses `nil` as its `action_id`.
		The `action` only contains positional parameters in this case, such as x and y of the pointer.
		
		Here is a brief description of the available table fields:
		
		<table>
		  <th>Field</th>
		  <th>Description</th>
		  <tr><td>`value`</td><td>The amount of input given by the user. This is usually 1 for buttons and 0-1 for analogue inputs. This is not present for mouse movement.</td></tr>
		  <tr><td>`pressed`</td><td>If the input was pressed this frame, 0 for false and 1 for true. This is not present for mouse movement.</td></tr>
		  <tr><td>`released`</td><td>If the input was released this frame, 0 for false and 1 for true. This is not present for mouse movement.</td></tr>
		  <tr><td>`repeated`</td><td>If the input was repeated this frame, 0 for false and 1 for true. This is similar to how a key on a keyboard is repeated when you hold it down. This is not present for mouse movement.</td></tr>
		  <tr><td>`x`</td><td>The x value of a pointer device, if present.</td></tr>
		  <tr><td>`y`</td><td>The y value of a pointer device, if present.</td></tr>
		  <tr><td>`screen_x`</td><td>The screen space x value of a pointer device, if present.</td></tr>
		  <tr><td>`screen_y`</td><td>The screen space y value of a pointer device, if present.</td></tr>
		  <tr><td>`dx`</td><td>The change in x value of a pointer device, if present.</td></tr>
		  <tr><td>`dy`</td><td>The change in y value of a pointer device, if present.</td></tr>
		  <tr><td>`screen_dx`</td><td>The change in screen space x value of a pointer device, if present.</td></tr>
		  <tr><td>`screen_dy`</td><td>The change in screen space y value of a pointer device, if present.</td></tr>
		  <tr><td>`touch`</td><td>List of touch input, one element per finger, if present. See table below about touch input</td></tr>
		</table>
		
		Touch input table:
		
		<table>
		  <th>Field</th>
		  <th>Description</th>
		  <tr><td>`pressed`</td><td>True if the finger was pressed this frame.</td></tr>
		  <tr><td>`released`</td><td>True if the finger was released this frame.</td></tr>
		  <tr><td>`tap_count`</td><td>Number of taps, one for single, two for double-tap, etc</td></tr>
		  <tr><td>`x`</td><td>The x touch location.</td></tr>
		  <tr><td>`y`</td><td>The y touch location.</td></tr>
		  <tr><td>`dx`</td><td>The change in x value.</td></tr>
		  <tr><td>`dy`</td><td>The change in y value.</td></tr>
		  <tr><td>`acc_x`</td><td>Accelerometer x value (if present).</td></tr>
		  <tr><td>`acc_y`</td><td>Accelerometer y value (if present).</td></tr>
		  <tr><td>`acc_z`</td><td>Accelerometer z value (if present).</td></tr>
		</table>
		
		@param self reference to the script state to be used for storing data (script_ref)
		@param action_id id of the received input action, as mapped in the input_binding-file (hash)
		@param action a table containing the input data, see above for a description (table)
	**/
	static function on_input(self:TODO, action_id:TODO, action:TODO):Void;
	/**
		Called when a message has been sent to the gui component.
		
		This is a callback-function, which is called by the engine whenever a message has been sent to the gui component.
		It can be used to take action on the message, e.g. update the gui or send a response back to the sender of the message.
		
		The `message` parameter is a table containing the message data. If the message is sent from the engine, the
		documentation of the message specifies which data is supplied.
		
		See the `update` function for examples on how to use this callback-function.
		
		@param self reference to the script state to be used for storing data (script_ref)
		@param message_id id of the received message (hash)
		@param message a table containing the message data (table)
	**/
	static function on_message(self:TODO, message_id:TODO, message:TODO):Void;
	/**
		Called when the gui script is reloaded.
		
		This is a callback-function, which is called by the engine when the gui script is reloaded, e.g. from the editor.
		It can be used for live development, e.g. to tweak constants or set up the state properly for the script.
		
		@param self reference to the script state to be used for storing data (script_ref)
	**/
	static function on_reload(self:TODO):Void;
	/**
		Called every frame to update the gui component.
		
		This is a callback-function, which is called by the engine every frame to update the state of a gui component.
		It can be used to perform any kind of gui related tasks, e.g. animating nodes.
		
		@param self reference to the script state to be used for storing data (script_ref)
		@param dt the time-step of the frame update
	**/
	static function update(self:TODO, dt:TODO):Void;
}

@:native("_G.gui") extern class GuiVariables {
	/**
		Fit adjust mode.
		
		Adjust mode is used when the screen resolution differs from the project settings.
		The fit mode ensures that the entire node is visible in the adjusted gui scene.
	**/
	static var ADJUST_FIT(default, never) : TODO;
	/**
		Stretch adjust mode.
		
		Adjust mode is used when the screen resolution differs from the project settings.
		The stretch mode ensures that the node is displayed as is in the adjusted gui scene, which might scale it non-uniformally.
	**/
	static var ADJUST_STRETCH(default, never) : TODO;
	/**
		Zoom adjust mode.
		
		Adjust mode is used when the screen resolution differs from the project settings.
		The zoom mode ensures that the node fills its entire area and might make the node exceed it.
	**/
	static var ADJUST_ZOOM(default, never) : TODO;
	/**
		Bottom y-anchor.
	**/
	static var ANCHOR_BOTTOM(default, never) : TODO;
	/**
		Left x-anchor.
	**/
	static var ANCHOR_LEFT(default, never) : TODO;
	/**
		Right x-anchor.
	**/
	static var ANCHOR_RIGHT(default, never) : TODO;
	/**
		Top y-anchor.
	**/
	static var ANCHOR_TOP(default, never) : TODO;
	/**
		Additive blending.
	**/
	static var BLEND_ADD(default, never) : TODO;
	/**
		Additive alpha blending.
	**/
	static var BLEND_ADD_ALPHA(default, never) : TODO;
	/**
		Alpha blending.
	**/
	static var BLEND_ALPHA(default, never) : TODO;
	/**
		Multiply blending.
	**/
	static var BLEND_MULT(default, never) : TODO;
	/**
		Clipping mode none.
	**/
	static var CLIPPING_MODE_NONE(default, never) : TODO;
	/**
		Clipping mode stencil.
	**/
	static var CLIPPING_MODE_STENCIL(default, never) : TODO;
	/**
		In-back.
	**/
	static var EASING_INBACK(default, never) : TODO;
	/**
		In-bounce.
	**/
	static var EASING_INBOUNCE(default, never) : TODO;
	/**
		In-circlic.
	**/
	static var EASING_INCIRC(default, never) : TODO;
	/**
		In-cubic.
	**/
	static var EASING_INCUBIC(default, never) : TODO;
	/**
		In-elastic.
	**/
	static var EASING_INELASTIC(default, never) : TODO;
	/**
		In-exponential.
	**/
	static var EASING_INEXPO(default, never) : TODO;
	/**
		In-out-back.
	**/
	static var EASING_INOUTBACK(default, never) : TODO;
	/**
		In-out-bounce.
	**/
	static var EASING_INOUTBOUNCE(default, never) : TODO;
	/**
		In-out-circlic.
	**/
	static var EASING_INOUTCIRC(default, never) : TODO;
	/**
		In-out-cubic.
	**/
	static var EASING_INOUTCUBIC(default, never) : TODO;
	/**
		In-out-elastic.
	**/
	static var EASING_INOUTELASTIC(default, never) : TODO;
	/**
		In-out-exponential.
	**/
	static var EASING_INOUTEXPO(default, never) : TODO;
	/**
		In-out-quadratic.
	**/
	static var EASING_INOUTQUAD(default, never) : TODO;
	/**
		In-out-quartic.
	**/
	static var EASING_INOUTQUART(default, never) : TODO;
	/**
		In-out-quintic.
	**/
	static var EASING_INOUTQUINT(default, never) : TODO;
	/**
		In-out-sine.
	**/
	static var EASING_INOUTSINE(default, never) : TODO;
	/**
		In-quadratic.
	**/
	static var EASING_INQUAD(default, never) : TODO;
	/**
		In-quartic.
	**/
	static var EASING_INQUART(default, never) : TODO;
	/**
		In-quintic.
	**/
	static var EASING_INQUINT(default, never) : TODO;
	/**
		In-sine.
	**/
	static var EASING_INSINE(default, never) : TODO;
	/**
		Linear interpolation.
	**/
	static var EASING_LINEAR(default, never) : TODO;
	/**
		Out-back.
	**/
	static var EASING_OUTBACK(default, never) : TODO;
	/**
		Out-bounce.
	**/
	static var EASING_OUTBOUNCE(default, never) : TODO;
	/**
		Out-circlic.
	**/
	static var EASING_OUTCIRC(default, never) : TODO;
	/**
		Out-cubic.
	**/
	static var EASING_OUTCUBIC(default, never) : TODO;
	/**
		Out-elastic.
	**/
	static var EASING_OUTELASTIC(default, never) : TODO;
	/**
		Out-exponential.
	**/
	static var EASING_OUTEXPO(default, never) : TODO;
	/**
		Out-in-back.
	**/
	static var EASING_OUTINBACK(default, never) : TODO;
	/**
		Out-in-bounce.
	**/
	static var EASING_OUTINBOUNCE(default, never) : TODO;
	/**
		Out-in-circlic.
	**/
	static var EASING_OUTINCIRC(default, never) : TODO;
	/**
		Out-in-cubic.
	**/
	static var EASING_OUTINCUBIC(default, never) : TODO;
	/**
		Out-in-elastic.
	**/
	static var EASING_OUTINELASTIC(default, never) : TODO;
	/**
		Out-in-exponential.
	**/
	static var EASING_OUTINEXPO(default, never) : TODO;
	/**
		Out-in-quadratic.
	**/
	static var EASING_OUTINQUAD(default, never) : TODO;
	/**
		Out-in-quartic.
	**/
	static var EASING_OUTINQUART(default, never) : TODO;
	/**
		Out-in-quintic.
	**/
	static var EASING_OUTINQUINT(default, never) : TODO;
	/**
		Out-in-sine.
	**/
	static var EASING_OUTINSINE(default, never) : TODO;
	/**
		Out-quadratic.
	**/
	static var EASING_OUTQUAD(default, never) : TODO;
	/**
		Out-quartic.
	**/
	static var EASING_OUTQUART(default, never) : TODO;
	/**
		Out-quintic.
	**/
	static var EASING_OUTQUINT(default, never) : TODO;
	/**
		Out-sine.
	**/
	static var EASING_OUTSINE(default, never) : TODO;
	/**
		Default keyboard.
	**/
	static var KEYBOARD_TYPE_DEFAULT(default, never) : TODO;
	/**
		Email keyboard.
	**/
	static var KEYBOARD_TYPE_EMAIL(default, never) : TODO;
	/**
		Number input keyboard.
	**/
	static var KEYBOARD_TYPE_NUMBER_PAD(default, never) : TODO;
	/**
		Password keyboard.
	**/
	static var KEYBOARD_TYPE_PASSWORD(default, never) : TODO;
	/**
		Elliptical pie node bounds.
	**/
	static var PIEBOUNDS_ELLIPSE(default, never) : TODO;
	/**
		Rectangular pie node bounds.
	**/
	static var PIEBOUNDS_RECTANGLE(default, never) : TODO;
	/**
		Center pivor.
	**/
	static var PIVOT_CENTER(default, never) : TODO;
	/**
		East pivot.
	**/
	static var PIVOT_E(default, never) : TODO;
	/**
		North pivot.
	**/
	static var PIVOT_N(default, never) : TODO;
	/**
		North-east pivot.
	**/
	static var PIVOT_NE(default, never) : TODO;
	/**
		North-west pivot.
	**/
	static var PIVOT_NW(default, never) : TODO;
	/**
		South pivot.
	**/
	static var PIVOT_S(default, never) : TODO;
	/**
		South-east pivot.
	**/
	static var PIVOT_SE(default, never) : TODO;
	/**
		South-west pivot.
	**/
	static var PIVOT_SW(default, never) : TODO;
	/**
		West pivot.
	**/
	static var PIVOT_W(default, never) : TODO;
	/**
		Loop backward.
	**/
	static var PLAYBACK_LOOP_BACKWARD(default, never) : TODO;
	/**
		Loop forward.
	**/
	static var PLAYBACK_LOOP_FORWARD(default, never) : TODO;
	/**
		Ping pong loop.
	**/
	static var PLAYBACK_LOOP_PINGPONG(default, never) : TODO;
	/**
		Once backward.
	**/
	static var PLAYBACK_ONCE_BACKWARD(default, never) : TODO;
	/**
		Once forward.
	**/
	static var PLAYBACK_ONCE_FORWARD(default, never) : TODO;
	/**
		Once forward and then backward.
	**/
	static var PLAYBACK_ONCE_PINGPONG(default, never) : TODO;
	/**
		Color property.
	**/
	static var PROP_COLOR(default, never) : TODO;
	/**
		Fill_angle property.
	**/
	static var PROP_FILL_ANGLE(default, never) : TODO;
	/**
		Inner_radius property.
	**/
	static var PROP_INNER_RADIUS(default, never) : TODO;
	/**
		Outline color property.
	**/
	static var PROP_OUTLINE(default, never) : TODO;
	/**
		Position property.
	**/
	static var PROP_POSITION(default, never) : TODO;
	/**
		Rotation property.
	**/
	static var PROP_ROTATION(default, never) : TODO;
	/**
		Scale property.
	**/
	static var PROP_SCALE(default, never) : TODO;
	/**
		Shadow color property.
	**/
	static var PROP_SHADOW(default, never) : TODO;
	/**
		Size property.
	**/
	static var PROP_SIZE(default, never) : TODO;
	/**
		Slice9 property.
	**/
	static var PROP_SLICE9(default, never) : TODO;
	/**
		Automatic size mode.
		
		The size of the node is determined by the currently assigned texture.
	**/
	static var SIZE_MODE_AUTO(default, never) : TODO;
	/**
		Manual size mode.
		
		The size of the node is determined by the size set in the editor, the constructor or by gui.set_size()
	**/
	static var SIZE_MODE_MANUAL(default, never) : TODO;
}
package defold;

@:native("_G.gui") extern class Gui {
	/**
		called when a gui component is finalized
		
		This is a callback-function, which is called by the engine when a gui component is finalized (destroyed). It can
		be used to e.g. take some last action, report the finalization to other game object instances
		or release user input focus (see <code>release_input_focus</code>). There is no use in starting any animations or similar
		from this function since the gui component is about to be destroyed.
		
		@param self reference to the script state to be used for storing data (script_ref)
	**/
	static function final(self:TODO):TODO;
	/**
		animates a node property
		
		<p>
		This starts an animation of a node property according to the specified parameters. If the node property is already being
		animated, that animation will be canceled and replaced by the new one. Note however that several different node properties
		can be animated simultaneously. Use <code>gui.cancel_animation</code> to stop the animation before it has completed.
		</p>
		<p>
		Composite properties of type vector3, vector4 or quaternion also expose their sub-components (x, y, z and w).
		You can address the components individually by suffixing the name with a dot '.' and the name of the component.
		For instance, "position.x" (the position x coordinate) or "color.w" (the color alpha value).
		</p>
		<p>
		If a <code>complete_function</code> (Lua function) is specified, that function will be called when the animation has completed.
		By starting a new animation in that function, several animations can be sequenced together. See the examples for more information.
		</p>
		
		@param node node to animate (node)
		@param property property to animate (string|constant)
		<ul>
		  <li><code>"position"</code></li>
		  <li><code>"rotation"</code></li>
		  <li><code>"scale"</code></li>
		  <li><code>"color"</code></li>
		  <li><code>"outline"</code></li>
		  <li><code>"shadow"</code></li>
		  <li><code>"size"</code></li>
		  <li><code>"fill_angle"</code> (pie nodes)</li>
		  <li><code>"inner_radius"</code> (pie nodes)</li>
		  <li><code>"slice9"</code> (slice9 nodes)</li>
		</ul>
		The following property constants are also defined equalling the corresponding property string names.
		<ul>
		  <li><code>gui.PROP_POSITION</code></li>
		  <li><code>gui.PROP_ROTATION</code></li>
		  <li><code>gui.PROP_SCALE</code></li>
		  <li><code>gui.PROP_COLOR</code></li>
		  <li><code>gui.PROP_OUTLINE</code></li>
		  <li><code>gui.PROP_SHADOW</code></li>
		  <li><code>gui.PROP_SIZE</code></li>
		  <li><code>gui.PROP_FILL_ANGLE</code></li>
		  <li><code>gui.PROP_INNER_RADIUS</code></li>
		  <li><code>gui.PROP_SLICE9</code></li>
		</ul>
		<p>
		
		</p>
		@param to target property value (vector3|vector4)
		@param easing easing to use during animation. Either specify one of the gui.EASING_* constants or provide a vmath.vector with a custom curve. (constant|vector)
		@param duration duration of the animation (number)
		@param delay delay before the animation starts (number)
		@param complete_function function to call when the animation has completed (function)
		@param playback playback mode (constant)
		<ul>
		  <li><code>gui.PLAYBACK_ONCE_FORWARD</code></li>
		  <li><code>gui.PLAYBACK_ONCE_BACKWARD</code></li>
		  <li><code>gui.PLAYBACK_ONCE_PINGPONG</code></li>
		  <li><code>gui.PLAYBACK_LOOP_FORWARD</code></li>
		  <li><code>gui.PLAYBACK_LOOP_BACKWARD</code></li>
		  <li><code>gui.PLAYBACK_LOOP_PINGPONG</code></li>
		</ul>
	**/
	static function animate(node:TODO, property:TODO, to:TODO, easing:TODO, duration:TODO, ?delay:TODO, ?complete_function:TODO, ?playback:TODO):TODO;
	/**
		cancels an ongoing animation
		
		If an animation of the specified node is currently running (started by <code>gui.animate</code>), it will immediately be canceled.
		
		@param node node that should have its animation canceled (node)
		@param property property for which the animation should be canceled (string|constant)
		<ul>
		  <li><code>"position"</code></li>
		  <li><code>"rotation"</code></li>
		  <li><code>"scale"</code></li>
		  <li><code>"color"</code></li>
		  <li><code>"outline"</code></li>
		  <li><code>"shadow"</code></li>
		  <li><code>"size"</code></li>
		  <li><code>"fill_angle"</code> (pie nodes)</li>
		  <li><code>"inner_radius"</code> (pie nodes)</li>
		  <li><code>"slice9"</code> (slice9 nodes)</li>
		</ul>
	**/
	static function cancel_animation(node:TODO, property:TODO):TODO;
	/**
		cancel a node flipbook animation
		
		Cancels any running flipbook animation on the specified node.
		
		@param node node cancel flipbook animation for (node)
	**/
	static function cancel_flipbook(node:TODO):TODO;
	/**
		cancel a spine animation
		
		@param node spine node that should cancel its animation
	**/
	static function cancel_spine(node:TODO):TODO;
	/**
		clone a node
		
		This does not include its children. Use gui.clone_tree for that purpose.
		
		@param node node to clone (node)
	**/
	static function clone(node:TODO):TODO;
	/**
		clone a node including its children
		
		Use gui.clone to clone a node excluding its children.
		
		@param node root node to clone (node)
	**/
	static function clone_tree(node:TODO):TODO;
	/**
		deletes a node
		
		@param node node to delete (node)
	**/
	static function delete_node(node:TODO):TODO;
	/**
		delete texture
		
		Delete a dynamically created texture.
		
		@param texture texture id (string|hash)
	**/
	static function delete_texture(texture:TODO):TODO;
	/**
		gets the node adjust mode
		
		Adjust mode defines how the node will adjust itself to a screen resolution which differs from the project settings.
		
		@param node node from which to get the adjust mode (node)
	**/
	static function get_adjust_mode(node:TODO):TODO;
	/**
		gets the node blend mode
		
		Blend mode defines how the node will be blended with the background.
		
		@param node node from which to get the blend mode (node)
	**/
	static function get_blend_mode(node:TODO):TODO;
	/**
		gets node clipping inverted state
		
		If node is set as an inverted clipping node, it will clip anything inside as opposed to outside.
		
		@param node node from which to get the clipping inverted state (node)
	**/
	static function get_clipping_inverted(node:TODO):TODO;
	/**
		gets the node clipping mode
		
		Clipping mode defines how the node will clipping it's children nodes
		
		@param node node from which to get the clipping mode (node)
	**/
	static function get_clipping_mode(node:TODO):TODO;
	/**
		gets node clipping visibility state
		
		If node is set as visible clipping node, it will be shown as well as clipping. Otherwise, it will only clip but not show visually.
		
		@param node node from which to get the clipping visibility state (node)
	**/
	static function get_clipping_visible(node:TODO):TODO;
	/**
		gets the node color
		
		@param node node to get the color from (node)
	**/
	static function get_color(node:TODO):TODO;
	/**
		gets the angle for the filled pie sector
		
		@param node node from which to get the fill angle (node)
	**/
	static function get_fill_angle(node:TODO):TODO;
	/**
		gets the node flipbook animation
		
		Get node flipbook animation.
		
		@param node node to get flipbook animation from (node)
	**/
	static function get_flipbook(node:TODO):TODO;
	/**
		gets the node font
		
		This is only useful for text nodes. The font must be mapped to the gui scene in the gui editor.
		
		@param node node from which to get the font (node)
	**/
	static function get_font(node:TODO):TODO;
	/**
		gets the scene height
	**/
	static function get_height():TODO;
	/**
		gets the id of the specified node
		
		@param node node to retrieve the id from (node)
	**/
	static function get_id(node:TODO):TODO;
	/**
		gets the index of the specified node
		
		The index defines the order in which a node appear in a gui scene.
		Higher index means the node is drawn above lower indexed nodes.
		
		@param node node to retrieve the id from (node)
	**/
	static function get_index(node:TODO):TODO;
	/**
		gets the pie inner radius (defined along the x dimension)
		
		@param node node from where to get the inner radius (node)
	**/
	static function get_inner_radius(node:TODO):TODO;
	/**
		gets the node layer
		
		The layer must be mapped to the gui scene in the gui editor.
		
		@param node node from which to get the layer (node)
	**/
	static function get_layer(node:TODO):TODO;
	/**
		gets the scene current layout
	**/
	static function get_layout():TODO;
	/**
		gets the leading of the text node
		
		@param node node from where to get the leading (node)
	**/
	static function get_leading(node:TODO):TODO;
	/**
		get line-break mode
		
		This is only useful for text nodes.
		
		@param node node from which to get the line-break for (node)
	**/
	static function get_line_break(node:TODO):TODO;
	/**
		gets the node with the specified id
		
		@param id id of the node to retrieve (string|hash)
	**/
	static function get_node(id:TODO):TODO;
	/**
		gets the pie outer bounds mode
		
		@param node node from where to get the outer bounds mode (node)
	**/
	static function get_outer_bounds(node:TODO):TODO;
	/**
		gets the node outline color
		
		@param node node to get the outline color from (node)
	**/
	static function get_outline(node:TODO):TODO;
	/**
		gets the parent of the specified node
		
		If the specified node does not have a parent, nil is returned.
		
		@param node the node from which to retrieve its parent (node)
	**/
	static function get_parent(node:TODO):TODO;
	/**
		gets the number of generarted vertices around the perimeter
	**/
	static function get_perimeter_vertices():TODO;
	/**
		gets the pivot of a node
		
		The pivot specifies how the node is drawn and rotated from its position.
		
		@param node node to get pivot from (node)
	**/
	static function get_pivot(node:TODO):TODO;
	/**
		gets the node position
		
		@param node node to get the position from (node)
	**/
	static function get_position(node:TODO):TODO;
	/**
		gets the node rotation
		
		@param node node to get the rotation from (node)
	**/
	static function get_rotation(node:TODO):TODO;
	/**
		gets the node scale
		
		@param node node to get the scale from (node)
	**/
	static function get_scale(node:TODO):TODO;
	/**
		gets the node screen position
		
		@param node node to get the screen position from (node)
	**/
	static function get_screen_position(node:TODO):TODO;
	/**
		gets the node shadow color
		
		@param node node to get the shadow color from (node)
	**/
	static function get_shadow(node:TODO):TODO;
	/**
		gets the node size
		
		@param node node to get the size from (node)
	**/
	static function get_size(node:TODO):TODO;
	/**
		gets the node size mode
		
		Size mode defines how the node will adjust itself in size according to mode.
		
		@param node node from which to get the size mode (node)
	**/
	static function get_size_mode(node:TODO):TODO;
	/**
		get the slice9 values for the node
		
		@param node node to manipulate
	**/
	static function get_slice9(node:TODO):TODO;
	/**
		retrieve the GUI node corresponding to a spine skeleton bone
		
		The returned node can be used for parenting and transform queries.
		This function has complexity O(n), where n is the number of bones in the spine model skeleton.
		
		@param node spine node to query for bone node (node)
		@param bone_id id of the corresponding bone (string|hash)
	**/
	static function get_spine_bone(node:TODO, bone_id:TODO):TODO;
	/**
		gets the spine scene of a node
		
		This is currently only useful for spine nodes. The spine scene must be mapped to the gui scene in the gui editor.
		
		@param node node to get texture from (node)
	**/
	static function get_spine_scene(node:TODO):TODO;
	/**
		gets the node text
		
		This is only useful for text nodes.
		
		@param node node from which to get the text (node)
	**/
	static function get_text(node:TODO):TODO;
	/**
		get text metrics
		
		Get text metrics
		
		@param font font id. (hash|string)
		@param text text to measure
		@param width max-width. use for line-breaks (default=FLT_MAX)
		@param line_breaks true to break lines accordingly to width (default=false)
		@param leading scale value for line spacing (default=1)
		@param tracking scale value for letter spacing (default=0)
	**/
	static function get_text_metrics(font:TODO, text:TODO, width:TODO, line_breaks:TODO, leading:TODO, tracking:TODO):TODO;
	/**
		get text metrics from node
		
		Get text metrics
		
		@param node text node to measure text from
	**/
	static function get_text_metrics_from_node(node:TODO):TODO;
	/**
		gets the node texture
		
		This is currently only useful for box or pie nodes. The texture must be mapped to the gui scene in the gui editor.
		
		@param node node to get texture from (node)
	**/
	static function get_texture(node:TODO):TODO;
	/**
		gets the tracking of the text node
		
		@param node node from where to get the tracking (node)
	**/
	static function get_tracking(node:TODO):TODO;
	/**
		gets the scene width
	**/
	static function get_width():TODO;
	/**
		gets the x-anchor of a node
		
		The x-anchor specifies how the node is moved when the game is run in a different resolution.
		
		@param node node to get x-anchor from (node)
	**/
	static function get_xanchor(node:TODO):TODO;
	/**
		gets the y-anchor of a node
		
		The y-anchor specifies how the node is moved when the game is run in a different resolution.
		
		@param node node to get y-anchor from (node)
	**/
	static function get_yanchor(node:TODO):TODO;
	/**
		hide on-display keyboard if available
		
		Hide the on-display keyboard on the device.
	**/
	static function hide_keyboard():TODO;
	/**
		retrieves if a node is enabled or not
		
		Disabled nodes are not rendered and animations acting on them are not evaluated.
		
		@param node node to query (node)
	**/
	static function is_enabled(node:TODO):TODO;
	/**
		moves the first node above the second
		
		Supply nil as the second argument to move the first node to the top.
		
		@param node to move (node)
		@param ref reference node above which the first node should be moved (node)
	**/
	static function move_above(node:TODO, ref:TODO):TODO;
	/**
		moves the first node below the second
		
		Supply nil as the second argument to move the first node to the bottom.
		
		@param node to move (node)
		@param ref reference node below which the first node should be moved (node)
	**/
	static function move_below(node:TODO, ref:TODO):TODO;
	/**
		creates a new box node
		
		@param pos node position (vector3|vector4)
		@param size node size (vector3)
	**/
	static function new_box_node(pos:TODO, size:TODO):TODO;
	/**
		creates a new pie node
		
		@param pos node position (vector3|vector4)
		@param size node size (vector3)
	**/
	static function new_pie_node(pos:TODO, size:TODO):TODO;
	/**
		creates a new spine node
		
		@param pos node position (vector3|vector4)
		@param spine_scene spine scene id (string|hash)
	**/
	static function new_spine_node(pos:TODO, spine_scene:TODO):TODO;
	/**
		creates a new text node
		
		@param pos node position (vector3|vector4)
		@param text node text (string)
	**/
	static function new_text_node(pos:TODO, text:TODO):TODO;
	/**
		create new texture
		
		Dynamically create a new texture.
		
		@param texture texture id (string|hash)
		@param width texture width (number)
		@param height texture height (number)
		@param type texture type (string|constant)
		<ul>
		  <li><code>"rgb"</code> - RGB</li>
		  <li><code>"rgba"</code> - RGBA</li>
		  <li><code>"l"</code> - LUMINANCE</li>
		</ul>
		@param buffer texture data (string)
	**/
	static function new_texture(texture:TODO, width:TODO, height:TODO, type:TODO, buffer:TODO):TODO;
	/**
		determines if the node is pickable by the supplied coordinates
		
		@param node node to be tested for picking (node)
		@param x x-coordinate (see <a href="#on_input">on_input</a> )
		@param y y-coordinate (see <a href="#on_input">on_input</a> )
	**/
	static function pick_node(node:TODO, x:TODO, y:TODO):TODO;
	/**
		play node flipbook animation
		
		Play flipbook animation on a box or pie node. The current node texture must contain the animation.
		
		@param node node to set animation for (node)
		@param animation animation id (string|hash)
		@param complete_function function to call when the animation has completed (function)
	**/
	static function play_flipbook(node:TODO, animation:TODO, ?complete_function:TODO):TODO;
	/**
		play a spine animation
		
		@param node spine node that should play the animation (node)
		@param animation_id id of the animation to play (string|hash)
		@param playback playback mode (constant)
		@param blend_duration duration of a linear blend between the current and new animations
		@param complete_function function to call when the animation has completed (function)
	**/
	static function play_spine(node:TODO, animation_id:TODO, playback:TODO, blend_duration:TODO, ?complete_function:TODO):TODO;
	/**
		reset on-display keyboard if available
		
		Reset input context of keyboard. This will clear marked text.
	**/
	static function reset_keyboard():TODO;
	/**
		reset all nodes to initial state
		
		reset only applies to static node loaded from the scene. Nodes created dynamically from script are not affected
	**/
	static function reset_nodes():TODO;
	/**
		sets node adjust mode
		
		Adjust mode defines how the node will adjust itself to a screen resolution which differs from the project settings.
		
		@param node node to set adjust mode for (node)
		@param adjust_mode adjust mode to set (constant)
		<ul>
		  <li><code>gui.ADJUST_FIT</code></li>
		  <li><code>gui.ADJUST_ZOOM</code></li>
		  <li><code>gui.ADJUST_STRETCH</code></li>
		</ul>
	**/
	static function set_adjust_mode(node:TODO, adjust_mode:TODO):TODO;
	/**
		sets node blend mode
		
		Blend mode defines how the node will be blended with the background.
		
		@param node node to set blend mode for (node)
		@param blend_mode blend mode to set (constant)
		<ul>
		  <li><code>gui.BLEND_ALPHA</code></li>
		  <li><code>gui.BLEND_ADD</code></li>
		  <li><code>gui.BLEND_ADD_ALPHA</code></li>
		  <li><code>gui.BLEND_MULT</code></li>
		</ul>
	**/
	static function set_blend_mode(node:TODO, blend_mode:TODO):TODO;
	/**
		sets node clipping visibility
		
		If node is set as an inverted clipping node, it will clip anything inside as opposed to outside.
		
		@param node node to set clipping inverted state for (node)
		@param visible true or false
	**/
	static function set_clipping_inverted(node:TODO, visible:TODO):TODO;
	/**
		sets node clipping mode state
		
		Clipping mode defines how the node will clipping it's children nodes
		
		@param node node to set clipping mode for (node)
		@param clipping_mode clipping mode to set (constant)
		<ul>
		  <li><code>gui.CLIPPING_MODE_NONE</code></li>
		  <li><code>gui.CLIPPING_MODE_STENCIL</code></li>
		</ul>
	**/
	static function set_clipping_mode(node:TODO, clipping_mode:TODO):TODO;
	/**
		sets node clipping visibility
		
		If node is set as an visible clipping node, it will be shown as well as clipping. Otherwise, it will only clip but not show visually.
		
		@param node node to set clipping visibility for (node)
		@param visible true or false
	**/
	static function set_clipping_visible(node:TODO, visible:TODO):TODO;
	/**
		sets the node color
		
		@param node node to set the color for (node)
		@param color new color (vector3|vector4)
	**/
	static function set_color(node:TODO, color:TODO):TODO;
	/**
		enables/disables a node
		
		Disabled nodes are not rendered and animations acting on them are not evaluated.
		
		@param node node to be enabled/disabled (node)
		@param enabled whether the node should be enabled or not (boolean)
	**/
	static function set_enabled(node:TODO, enabled:TODO):TODO;
	/**
		sets the angle for the filled pie sector
		
		@param node node to set the fill angle for (node)
		@param sector angle
	**/
	static function set_fill_angle(node:TODO, sector:TODO):TODO;
	/**
		sets the node font
		
		This is only useful for text nodes. The font must be mapped to the gui scene in the gui editor.
		
		@param node node for which to set the font (node)
		@param font font id (string|hash)
	**/
	static function set_font(node:TODO, font:TODO):TODO;
	/**
		sets the id of the specified node
		
		@param node node to set the id for (node)
		@param id id to set (string|hash)
	**/
	static function set_id(node:TODO, id:TODO):TODO;
	/**
		sets the pie inner radius (defined along the x dimension)
		
		@param node node to set the inner radius for (node)
		@param inner radius
	**/
	static function set_inner_radius(node:TODO, inner:TODO):TODO;
	/**
		sets the node layer
		
		The layer must be mapped to the gui scene in the gui editor.
		
		@param node node for which to set the layer (node)
		@param layer layer id (string|hash)
	**/
	static function set_layer(node:TODO, layer:TODO):TODO;
	/**
		sets the leading of the text node
		
		@param node node for which to set the leading (node)
		@param leading a scaling number for the line spacing (default=1) (number)
	**/
	static function set_leading(node:TODO, leading:TODO):TODO;
	/**
		set line-break mode
		
		This is only useful for text nodes.
		
		@param node node to set line-break for (node)
		@param text text to set (string)
	**/
	static function set_line_break(node:TODO, text:TODO):TODO;
	/**
		sets the pie outer bounds mode
		
		@param node node for which to set the outer bounds mode (node)
		@param BOUNDS_RECTANGLE or BOUNDS_ELLIPSE
	**/
	static function set_outer_bounds(node:TODO, BOUNDS_RECTANGLE:TODO):TODO;
	/**
		sets the node outline color
		
		@param node node to set the outline color for (node)
		@param color new outline color (vector3|vector4)
	**/
	static function set_outline(node:TODO, color:TODO):TODO;
	/**
		set the parent of the node
		
		@param node node for which to set its parent (node)
		@param parent parent node to set (node)
	**/
	static function set_parent(node:TODO, parent:TODO):TODO;
	/**
		sets the number of generarted vertices around the perimeter
		
		@param vertex count (number)
	**/
	static function set_perimeter_vertices(vertex:TODO):TODO;
	/**
		sets the pivot of a node
		
		The pivot specifies how the node is drawn and rotated from its position.
		
		@param node node to set pivot for (node)
		@param pivot pivot constant (constant)
		<ul>
		  <li><code>gui.PIVOT_CENTER</code></li>
		  <li><code>gui.PIVOT_N</code></li>
		  <li><code>gui.PIVOT_NE</code></li>
		  <li><code>gui.PIVOT_E</code></li>
		  <li><code>gui.PIVOT_SE</code></li>
		  <li><code>gui.PIVOT_S</code></li>
		  <li><code>gui.PIVOT_SW</code></li>
		  <li><code>gui.PIVOT_W</code></li>
		  <li><code>gui.PIVOT_NW</code></li>
		</ul>
	**/
	static function set_pivot(node:TODO, pivot:TODO):TODO;
	/**
		sets the node position
		
		@param node node to set the position for (node)
		@param position new position (vector3|vector4)
	**/
	static function set_position(node:TODO, position:TODO):TODO;
	/**
		set the render ordering for the current GUI scene
		
		Set the order number for the current GUI scene. The number dictates the sorting of the "gui" render predicate, in other words
		in which order the scene will be rendered in relation to other currently rendered GUI scenes.
		
		The number must be in the range 0 to 15.
		
		@param order rendering order (number)
	**/
	static function set_render_order(order:TODO):TODO;
	/**
		sets the node rotation
		
		@param node node to set the rotation for (node)
		@param rotation new rotation (vector3|vector4)
	**/
	static function set_rotation(node:TODO, rotation:TODO):TODO;
	/**
		sets the node scale
		
		@param node node to set the scale for (node)
		@param scale new scale (vector3|vector4)
	**/
	static function set_scale(node:TODO, scale:TODO):TODO;
	/**
		sets the node shadow color
		
		@param node node to set the shadow color for (node)
		@param color new shadow color (vector3|vector4)
	**/
	static function set_shadow(node:TODO, color:TODO):TODO;
	/**
		sets the node size
		
		<b>NOTE!</b> You can only set size on nodes with size mode set to SIZE_MODE_MANUAL
		
		@param node node to set the size for (node)
		@param size new size (vector3|vector4)
	**/
	static function set_size(node:TODO, size:TODO):TODO;
	/**
		sets node size mode
		
		Size mode defines how the node will adjust itself in size according to mode.
		
		@param node node to set size mode for (node)
		@param size_mode size mode to set (constant)
		<ul>
		  <li><code>gui.SIZE_MODE_MANUAL</code></li>
		  <li><code>gui.SIZE_MODE_AUTO</code></li>
		</ul>
	**/
	static function set_size_mode(node:TODO, size_mode:TODO):TODO;
	/**
		set the slice9 configuration for the node
		
		@param node node to manipulate
		@param params new value (vector4)
	**/
	static function set_slice9(node:TODO, params:TODO):TODO;
	/**
		sets the spine scene of a node
		
		Set the spine scene on a spine node. The spine scene must be mapped to the gui scene in the gui editor.
		
		@param node node to set spine scene for (node)
		@param spine_scene spine scene id (string|hash)
	**/
	static function set_spine_scene(node:TODO, spine_scene:TODO):TODO;
	/**
		sets the node text
		
		This is only useful for text nodes.
		
		@param node node to set text for (node)
		@param text text to set (string)
	**/
	static function set_text(node:TODO, text:TODO):TODO;
	/**
		sets the node texture
		
		Set the texture on a box or pie node. The texture must be mapped to the gui scene in the gui editor.
		
		@param node node to set texture for (node)
		@param texture texture id (string|hash)
	**/
	static function set_texture(node:TODO, texture:TODO):TODO;
	/**
		set the buffer data for a texture
		
		Set the texture buffer data for a dynamically created texture.
		
		@param texture texture id (string|hash)
		@param width texture width (number)
		@param height texture height (number)
		@param type texture type (string|constant)
		<ul>
		  <li><code>"rgb"</code> - RGB</li>
		  <li><code>"rgba"</code> - RGBA</li>
		  <li><code>"l"</code> - LUMINANCE</li>
		</ul>
		@param buffer texture data (string)
	**/
	static function set_texture_data(texture:TODO, width:TODO, height:TODO, type:TODO, buffer:TODO):TODO;
	/**
		sets the tracking of the text node
		
		@param node node for which to set the tracking (node)
		@param tracking a scaling number for the letter spacing (default=0) (number)
	**/
	static function set_tracking(node:TODO, tracking:TODO):TODO;
	/**
		sets the x-anchor of a node
		
		The x-anchor specifies how the node is moved when the game is run in a different resolution.
		
		@param node node to set x-anchor for (node)
		@param anchor anchor constant (constant)
		<ul>
		  <li><code>gui.ANCHOR_NONE</code></li>
		  <li><code>gui.ANCHOR_LEFT</code></li>
		  <li><code>gui.ANCHOR_RIGHT</code></li>
		</ul>
	**/
	static function set_xanchor(node:TODO, anchor:TODO):TODO;
	/**
		sets the y-anchor of a node
		
		The y-anchor specifies how the node is moved when the game is run in a different resolution.
		
		@param node node to set y-anchor for (node)
		@param anchor anchor constant (constant)
		<ul>
		  <li><code>gui.ANCHOR_NONE</code></li>
		  <li><code>gui.ANCHOR_TOP</code></li>
		  <li><code>gui.ANCHOR_BOTTOM</code></li>
		</ul>
	**/
	static function set_yanchor(node:TODO, anchor:TODO):TODO;
	/**
		display on-display keyboard if available
		
		The specified type of keyboard is displayed, if it is available on
		the device.
		
		@param type keyboard type (constant)
		<ul>
		  <li><code>gui.KEYBOARD_TYPE_DEFAULT</code></li>
		  <li><code>gui.KEYBOARD_TYPE_EMAIL</code></li>
		  <li><code>gui.KEYBOARD_TYPE_NUMBER_PAD</code></li>
		  <li><code>gui.KEYBOARD_TYPE_PASSWORD</code></li>
		</ul>
		@param autoclose close keyboard automatically when clicking outside
	**/
	static function show_keyboard(type:TODO, autoclose:TODO):TODO;
	/**
		called when a gui component is initialized
		
		This is a callback-function, which is called by the engine when a gui component is initialized. It can be used
		to set the initial state of the script and gui scene.
		
		@param self reference to the script state to be used for storing data (script_ref)
	**/
	static function init(self:TODO):TODO;
	/**
		called when user input is received
		
		<p>
		This is a callback-function, which is called by the engine when user input is sent to the instance of the gui component.
		It can be used to take action on the input, e.g. modify the gui according to the input.
		</p>
		<p>
		For an instance to obtain user input, it must first acquire input focuse through the message <code>acquire_input_focus</code>.
		See the documentation of that message for more information.
		</p>
		<p>
		The <code>action</code> parameter is a table containing data about the input mapped to the <code>action_id</code>.
		For mapped actions it specifies the value of the input and if it was just pressed or released.
		Actions are mapped to input in an input_binding-file.
		</p>
		<p>
		Mouse movement is specifically handled and uses <code>nil</code> as its <code>action_id</code>.
		The <code>action</code> only contains positional parameters in this case, such as x and y of the pointer.
		</p>
		<p>
		Here is a brief description of the available table fields:
		</p>
		<table>
		  <th>Field</th>
		  <th>Description</th>
		  <tr><td><code>value</code></td><td>The amount of input given by the user. This is usually 1 for buttons and 0-1 for analogue inputs. This is not present for mouse movement.</td></tr>
		  <tr><td><code>pressed</code></td><td>If the input was pressed this frame, 0 for false and 1 for true. This is not present for mouse movement.</td></tr>
		  <tr><td><code>released</code></td><td>If the input was released this frame, 0 for false and 1 for true. This is not present for mouse movement.</td></tr>
		  <tr><td><code>repeated</code></td><td>If the input was repeated this frame, 0 for false and 1 for true. This is similar to how a key on a keyboard is repeated when you hold it down. This is not present for mouse movement.</td></tr>
		  <tr><td><code>x</code></td><td>The x value of a pointer device, if present.</td></tr>
		  <tr><td><code>y</code></td><td>The y value of a pointer device, if present.</td></tr>
		  <tr><td><code>screen_x</code></td><td>The screen space x value of a pointer device, if present.</td></tr>
		  <tr><td><code>screen_y</code></td><td>The screen space y value of a pointer device, if present.</td></tr>
		  <tr><td><code>dx</code></td><td>The change in x value of a pointer device, if present.</td></tr>
		  <tr><td><code>dy</code></td><td>The change in y value of a pointer device, if present.</td></tr>
		  <tr><td><code>screen_dx</code></td><td>The change in screen space x value of a pointer device, if present.</td></tr>
		  <tr><td><code>screen_dy</code></td><td>The change in screen space y value of a pointer device, if present.</td></tr>
		  <tr><td><code>touch</code></td><td>List of touch input, one element per finger, if present. See table below about touch input</td></tr>
		</table>
		
		<p>
		Touch input table:
		</p>
		<table>
		  <th>Field</th>
		  <th>Description</th>
		  <tr><td><code>pressed</code></td><td>True if the finger was pressed this frame.</td></tr>
		  <tr><td><code>released</code></td><td>True if the finger was released this frame.</td></tr>
		  <tr><td><code>tap_count</code></td><td>Number of taps, one for single, two for double-tap, etc</td></tr>
		  <tr><td><code>x</code></td><td>The x touch location.</td></tr>
		  <tr><td><code>y</code></td><td>The y touch location.</td></tr>
		  <tr><td><code>dx</code></td><td>The change in x value.</td></tr>
		  <tr><td><code>dy</code></td><td>The change in y value.</td></tr>
		  <tr><td><code>acc_x</code></td><td>Accelerometer x value (if present).</td></tr>
		  <tr><td><code>acc_y</code></td><td>Accelerometer y value (if present).</td></tr>
		  <tr><td><code>acc_z</code></td><td>Accelerometer z value (if present).</td></tr>
		</table>
		
		@param self reference to the script state to be used for storing data (script_ref)
		@param action_id id of the received input action, as mapped in the input_binding-file (hash)
		@param action a table containing the input data, see above for a description (table)
	**/
	static function on_input(self:TODO, action_id:TODO, action:TODO):TODO;
	/**
		called when a message has been sent to the gui component
		
		<p>
		This is a callback-function, which is called by the engine whenever a message has been sent to the gui component.
		It can be used to take action on the message, e.g. update the gui or send a response back to the sender of the message.
		</p>
		<p>
		The <code>message</code> parameter is a table containing the message data. If the message is sent from the engine, the
		documentation of the message specifies which data is supplied.
		</p>
		<p>See the <code>update</code> function for examples on how to use this callback-function.</p>
		
		@param self reference to the script state to be used for storing data (script_ref)
		@param message_id id of the received message (hash)
		@param message a table containing the message data (table)
	**/
	static function on_message(self:TODO, message_id:TODO, message:TODO):TODO;
	/**
		called when the gui script is reloaded
		
		<p>
		This is a callback-function, which is called by the engine when the gui script is reloaded, e.g. from the editor.
		It can be used for live development, e.g. to tweak constants or set up the state properly for the script.
		</p>
		
		@param self reference to the script state to be used for storing data (script_ref)
	**/
	static function on_reload(self:TODO):TODO;
	/**
		called every frame to update the gui component
		
		This is a callback-function, which is called by the engine every frame to update the state of a gui component.
		It can be used to perform any kind of gui related tasks, e.g. animating nodes.
		
		@param self reference to the script state to be used for storing data (script_ref)
		@param dt the time-step of the frame update
	**/
	static function update(self:TODO, dt:TODO):TODO;
}

@:native("_G.gui") extern class GuiVariables {
	/**
		fit adjust mode
		
		Adjust mode is used when the screen resolution differs from the project settings.
		The fit mode ensures that the entire node is visible in the adjusted gui scene.
	**/
	static var ADJUST_FIT(default, never) : TODO;
	/**
		stretch adjust mode
		
		Adjust mode is used when the screen resolution differs from the project settings.
		The stretch mode ensures that the node is displayed as is in the adjusted gui scene, which might scale it non-uniformally.
	**/
	static var ADJUST_STRETCH(default, never) : TODO;
	/**
		zoom adjust mode
		
		Adjust mode is used when the screen resolution differs from the project settings.
		The zoom mode ensures that the node fills its entire area and might make the node exceed it.
	**/
	static var ADJUST_ZOOM(default, never) : TODO;
	/**
		bottom y-anchor
	**/
	static var ANCHOR_BOTTOM(default, never) : TODO;
	/**
		left x-anchor
	**/
	static var ANCHOR_LEFT(default, never) : TODO;
	/**
		right x-anchor
	**/
	static var ANCHOR_RIGHT(default, never) : TODO;
	/**
		top y-anchor
	**/
	static var ANCHOR_TOP(default, never) : TODO;
	/**
		additive blending
	**/
	static var BLEND_ADD(default, never) : TODO;
	/**
		additive alpha blending
	**/
	static var BLEND_ADD_ALPHA(default, never) : TODO;
	/**
		alpha blending
	**/
	static var BLEND_ALPHA(default, never) : TODO;
	/**
		multiply blending
	**/
	static var BLEND_MULT(default, never) : TODO;
	/**
		clipping mode none
	**/
	static var CLIPPING_MODE_NONE(default, never) : TODO;
	/**
		clipping mode stencil
	**/
	static var CLIPPING_MODE_STENCIL(default, never) : TODO;
	/**
		in-back
	**/
	static var EASING_INBACK(default, never) : TODO;
	/**
		in-bounce
	**/
	static var EASING_INBOUNCE(default, never) : TODO;
	/**
		in-circlic
	**/
	static var EASING_INCIRC(default, never) : TODO;
	/**
		in-cubic
	**/
	static var EASING_INCUBIC(default, never) : TODO;
	/**
		in-elastic
	**/
	static var EASING_INELASTIC(default, never) : TODO;
	/**
		in-exponential
	**/
	static var EASING_INEXPO(default, never) : TODO;
	/**
		in-out-back
	**/
	static var EASING_INOUTBACK(default, never) : TODO;
	/**
		in-out-bounce
	**/
	static var EASING_INOUTBOUNCE(default, never) : TODO;
	/**
		in-out-circlic
	**/
	static var EASING_INOUTCIRC(default, never) : TODO;
	/**
		in-out-cubic
	**/
	static var EASING_INOUTCUBIC(default, never) : TODO;
	/**
		in-out-elastic
	**/
	static var EASING_INOUTELASTIC(default, never) : TODO;
	/**
		in-out-exponential
	**/
	static var EASING_INOUTEXPO(default, never) : TODO;
	/**
		in-out-quadratic
	**/
	static var EASING_INOUTQUAD(default, never) : TODO;
	/**
		in-out-quartic
	**/
	static var EASING_INOUTQUART(default, never) : TODO;
	/**
		in-out-quintic
	**/
	static var EASING_INOUTQUINT(default, never) : TODO;
	/**
		in-out-sine
	**/
	static var EASING_INOUTSINE(default, never) : TODO;
	/**
		in-quadratic
	**/
	static var EASING_INQUAD(default, never) : TODO;
	/**
		in-quartic
	**/
	static var EASING_INQUART(default, never) : TODO;
	/**
		in-quintic
	**/
	static var EASING_INQUINT(default, never) : TODO;
	/**
		in-sine
	**/
	static var EASING_INSINE(default, never) : TODO;
	/**
		linear interpolation
	**/
	static var EASING_LINEAR(default, never) : TODO;
	/**
		out-back
	**/
	static var EASING_OUTBACK(default, never) : TODO;
	/**
		out-bounce
	**/
	static var EASING_OUTBOUNCE(default, never) : TODO;
	/**
		out-circlic
	**/
	static var EASING_OUTCIRC(default, never) : TODO;
	/**
		out-cubic
	**/
	static var EASING_OUTCUBIC(default, never) : TODO;
	/**
		out-elastic
	**/
	static var EASING_OUTELASTIC(default, never) : TODO;
	/**
		out-exponential
	**/
	static var EASING_OUTEXPO(default, never) : TODO;
	/**
		out-in-back
	**/
	static var EASING_OUTINBACK(default, never) : TODO;
	/**
		out-in-bounce
	**/
	static var EASING_OUTINBOUNCE(default, never) : TODO;
	/**
		out-in-circlic
	**/
	static var EASING_OUTINCIRC(default, never) : TODO;
	/**
		out-in-cubic
	**/
	static var EASING_OUTINCUBIC(default, never) : TODO;
	/**
		out-in-elastic
	**/
	static var EASING_OUTINELASTIC(default, never) : TODO;
	/**
		out-in-exponential
	**/
	static var EASING_OUTINEXPO(default, never) : TODO;
	/**
		out-in-quadratic
	**/
	static var EASING_OUTINQUAD(default, never) : TODO;
	/**
		out-in-quartic
	**/
	static var EASING_OUTINQUART(default, never) : TODO;
	/**
		out-in-quintic
	**/
	static var EASING_OUTINQUINT(default, never) : TODO;
	/**
		out-in-sine
	**/
	static var EASING_OUTINSINE(default, never) : TODO;
	/**
		out-quadratic
	**/
	static var EASING_OUTQUAD(default, never) : TODO;
	/**
		out-quartic
	**/
	static var EASING_OUTQUART(default, never) : TODO;
	/**
		out-quintic
	**/
	static var EASING_OUTQUINT(default, never) : TODO;
	/**
		out-sine
	**/
	static var EASING_OUTSINE(default, never) : TODO;
	/**
		default keyboard
	**/
	static var KEYBOARD_TYPE_DEFAULT(default, never) : TODO;
	/**
		email keyboard
	**/
	static var KEYBOARD_TYPE_EMAIL(default, never) : TODO;
	/**
		number input keyboard
	**/
	static var KEYBOARD_TYPE_NUMBER_PAD(default, never) : TODO;
	/**
		password keyboard
	**/
	static var KEYBOARD_TYPE_PASSWORD(default, never) : TODO;
	/**
		elliptical pie node bounds
	**/
	static var PIEBOUNDS_ELLIPSE(default, never) : TODO;
	/**
		rectangular pie node bounds
	**/
	static var PIEBOUNDS_RECTANGLE(default, never) : TODO;
	/**
		center pivor
	**/
	static var PIVOT_CENTER(default, never) : TODO;
	/**
		east pivot
	**/
	static var PIVOT_E(default, never) : TODO;
	/**
		north pivot
	**/
	static var PIVOT_N(default, never) : TODO;
	/**
		north-east pivot
	**/
	static var PIVOT_NE(default, never) : TODO;
	/**
		north-west pivot
	**/
	static var PIVOT_NW(default, never) : TODO;
	/**
		south pivot
	**/
	static var PIVOT_S(default, never) : TODO;
	/**
		south-east pivot
	**/
	static var PIVOT_SE(default, never) : TODO;
	/**
		south-west pivot
	**/
	static var PIVOT_SW(default, never) : TODO;
	/**
		west pivot
	**/
	static var PIVOT_W(default, never) : TODO;
	/**
		loop backward
	**/
	static var PLAYBACK_LOOP_BACKWARD(default, never) : TODO;
	/**
		loop forward
	**/
	static var PLAYBACK_LOOP_FORWARD(default, never) : TODO;
	/**
		ping pong loop
	**/
	static var PLAYBACK_LOOP_PINGPONG(default, never) : TODO;
	/**
		once backward
	**/
	static var PLAYBACK_ONCE_BACKWARD(default, never) : TODO;
	/**
		once forward
	**/
	static var PLAYBACK_ONCE_FORWARD(default, never) : TODO;
	/**
		once forward and then backward
	**/
	static var PLAYBACK_ONCE_PINGPONG(default, never) : TODO;
	/**
		color property
	**/
	static var PROP_COLOR(default, never) : TODO;
	/**
		fill_angle property
	**/
	static var PROP_FILL_ANGLE(default, never) : TODO;
	/**
		inner_radius property
	**/
	static var PROP_INNER_RADIUS(default, never) : TODO;
	/**
		outline color property
	**/
	static var PROP_OUTLINE(default, never) : TODO;
	/**
		position property
	**/
	static var PROP_POSITION(default, never) : TODO;
	/**
		rotation property
	**/
	static var PROP_ROTATION(default, never) : TODO;
	/**
		scale property
	**/
	static var PROP_SCALE(default, never) : TODO;
	/**
		shadow color property
	**/
	static var PROP_SHADOW(default, never) : TODO;
	/**
		size property
	**/
	static var PROP_SIZE(default, never) : TODO;
	/**
		slice9 property
	**/
	static var PROP_SLICE9(default, never) : TODO;
	/**
		automatic size mode
		
		The size of the node is determined by the currently assigned texture.
	**/
	static var SIZE_MODE_AUTO(default, never) : TODO;
	/**
		manual size mode
		
		The size of the node is determined by the size set in the editor, the constructor or by gui.set_size()
	**/
	static var SIZE_MODE_MANUAL(default, never) : TODO;
}
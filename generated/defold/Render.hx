package defold;

@:native("_G.render") extern class Render {
	/**
		Clears the active render target.
		
		Clear buffers in the currently enabled render target with specified value.
		
		@param buffers Table with keys specifying which buffers to clear and values set to clear values. (table)
		Available keys are:
		
		     * `render.BUFFER_COLOR_BIT`
		     * `render.BUFFER_DEPTH_BIT`
		     * `render.BUFFER_STENCIL_BIT`
	**/
	static function clear(buffers:TODO):TODO;
	/**
		Create a new constant buffer..
		
		Constant buffers are used to set shader program variables and are optionally passed to the `render.draw()`
		function. The buffer's constant elements can be indexed like an ordinary Lua table, but you can't iterate
		over them with pairs() or ipairs().
	**/
	static function constant_buffer():TODO;
	/**
		Deletes a render target.
		
		@param render_target render target to delete (render_target)
	**/
	static function delete_render_target(render_target:TODO):TODO;
	/**
		Disables the currently enabled material.
		
		If a material is currently enabled, disable it.
	**/
	static function disable_material():TODO;
	/**
		Disables a render target.
		
		@param render_target render target to disable (render_target)
	**/
	static function disable_render_target(render_target:TODO):TODO;
	/**
		Disables a render state.
		
		@param state state to enable (constant)
		
		   * `render.STATE_DEPTH_TEST`
		   * `render.STATE_STENCIL_TEST`
		   * `render.STATE_BLEND`
		   * `render.STATE_CULL_FACE`
		   * `render.STATE_POLYGON_OFFSET_FILL`
	**/
	static function disable_state(state:TODO):TODO;
	/**
		Disables a texture for a render target.
		
		@param unit texture unit to enable disable for (number)
		@param render_target render target for which to disable the specified texture unit (render_target)
	**/
	static function disable_texture(unit:TODO, render_target:TODO):TODO;
	/**
		Draws all objects matching a predicate.
		
		Draws all objects that match a specified predicate. An optional constants buffer can be
		provided to override the default constants. If no constants buffer is provided, a default
		system constants buffer is used containing constants as defined in materials and set through
		`*.set_constant()` and `*.reset_constant()` on visual components.
		
		@param predicate predicate to draw for (predicate)
		@param constants optional constants to use while rendering (constants_buffer)
	**/
	static function draw(predicate:TODO, constants:TODO):TODO;
	/**
		Draws all 2d debug graphics (Deprecated).
	**/
	@:deprecated("Use render.draw_debug3d() to draw visual debug info.")
	static function draw_debug2d():TODO;
	/**
		Draws all 3d debug graphics.
		
		Draws all 3d debug graphics such as lines drawn with "draw_line" messages and physics visualization.
	**/
	static function draw_debug3d():TODO;
	/**
		Enables a material.
		
		If another material was already enabled, it will be automatically disabled.
		
		@param material_id material id to enable (string)
	**/
	static function enable_material(material_id:TODO):TODO;
	/**
		Enables a render target.
		
		@param render_target render target to enable (render_target)
	**/
	static function enable_render_target(render_target:TODO):TODO;
	/**
		Enables a render state.
		
		@param state state to enable (constant)
		
		   * `render.STATE_DEPTH_TEST`
		   * `render.STATE_STENCIL_TEST`
		   * `render.STATE_BLEND`
		   * `render.STATE_ALPHA_TEST` (not available on iOS and Android)
		   * `render.STATE_CULL_FACE`
		   * `render.STATE_POLYGON_OFFSET_FILL`
	**/
	static function enable_state(state:TODO):TODO;
	/**
		Enables a texture for a render target.
		
		@param unit texture unit to enable texture for (number)
		@param render_target render target from which to enable the specified texture unit (render_target)
		@param buffer_type buffer type from which to enable the texture (constant)
	**/
	static function enable_texture(unit:TODO, render_target:TODO, buffer_type:TODO):TODO;
	/**
		Gets the window height, as specified for the project.
	**/
	static function get_height():TODO;
	/**
		Retrieve a buffer height from a render target.
		
		@param render_target render target from which to retrieve the buffer height (render_target)
		@param buffer_type which type of buffer to retrieve the height from (constant)
	**/
	static function get_render_target_height(render_target:TODO, buffer_type:TODO):TODO;
	/**
		Retrieve a buffer width from a render target.
		
		@param render_target render target from which to retrieve the buffer width (render_target)
		@param buffer_type which type of buffer to retrieve the width from (constant)
	**/
	static function get_render_target_width(render_target:TODO, buffer_type:TODO):TODO;
	/**
		Gets the window width, as specified for the project.
	**/
	static function get_width():TODO;
	/**
		Gets the window height.
	**/
	static function get_window_height():TODO;
	/**
		Gets the actual window width.
	**/
	static function get_window_width():TODO;
	/**
		Creates a new render predicate.
		
		@param predicates table of tags that the predicate should match (table). The tags can be either (hash|string)
	**/
	static function predicate(predicates:TODO):TODO;
	/**
		Creates a new render target.
		
		Creates a new render target according to the supplied
		specification table.
		Available keys for the render target parameters table:
		<table>
		  <th>Keys</th><th>Values</th>
		  <tr><td>"format"</td><td>
		     render.FORMAT_LUMINANCE<br/>
		     render.FORMAT_RGB<br/>
		     render.FORMAT_RGBA<br/>
		     render.FORMAT_RGB_DXT1<br/>
		     render.FORMAT_RGBA_DXT1<br/>
		     render.FORMAT_RGBA_DXT3<br/>
		     render.FORMAT_RGBA_DXT5<br/>
		     render.FORMAT_DEPTH<br/>
		     render.FORMAT_STENCIL<br/>
		    </td></tr>
		  <tr><td>"width"</td><td>number</td></tr>
		  <tr><td>"height"</td><td>number</td></tr>
		  <tr><td>"min_filter"</td><td>
		     render.FILTER_LINEAR<br/>
		     render.FILTER_NEAREST<br/>
		    </td></tr>
		  <tr><td>"mag_filter"</td><td>
		     render.FILTER_LINEAR<br/>
		     render.FILTER_NEAREST<br/>
		    </td></tr>
		  <tr><td>"u_wrap"</td><td>
		     render.WRAP_CLAMP_TO_BORDER<br/>
		     render.WRAP_CLAMP_TO_EDGE<br/>
		     render.WRAP_MIRRORED_REPEAT<br/>
		     render.WRAP_REPEAT<br/>
		    </td></tr>
		  <tr><td>"v_wrap"</td><td>
		     render.WRAP_CLAMP_TO_BORDER<br/>
		     render.WRAP_CLAMP_TO_EDGE<br/>
		     render.WRAP_MIRRORED_REPEAT<br/>
		     render.WRAP_REPEAT<br/>
		    </td></tr>
		</table>
		
		@param name render target name (string)
		@param parameters table of all parameters, see the description for available keys and values (table)
	**/
	static function render_target(name:TODO, parameters:TODO):TODO;
	/**
		Sets the blending function.
		
		Available factors:
		
		   * `render.BLEND_ZERO`
		   * `render.BLEND_ONE`
		   * `render.BLEND_SRC_COLOR`
		   * `render.BLEND_ONE_MINUS_SRC_COLOR`
		   * `render.BLEND_DST_COLOR`
		   * `render.BLEND_ONE_MINUS_DST_COLOR`
		   * `render.BLEND_SRC_ALPHA`
		   * `render.BLEND_ONE_MINUS_SRC_ALPHA`
		   * `render.BLEND_DST_ALPHA`
		   * `render.BLEND_ONE_MINUS_DST_ALPHA`
		   * `render.BLEND_SRC_ALPHA_SATURATE`
		   * `render.BLEND_CONSTANT_COLOR`
		   * `render.BLEND_ONE_MINUS_CONSTANT_COLOR`
		   * `render.BLEND_CONSTANT_ALPHA`
		   * `render.BLEND_ONE_MINUS_CONSTANT_ALPHA`
		
		@param source_factor source factor (constant)
		@param destination_factor destination factor (constant)
	**/
	static function set_blend_func(source_factor:TODO, destination_factor:TODO):TODO;
	/**
		Sets the color mask.
		
		@param red red mask (boolean)
		@param green green mask (boolean)
		@param blue blue mask (boolean)
		@param alpha alpha mask (boolean)
	**/
	static function set_color_mask(red:TODO, green:TODO, blue:TODO, alpha:TODO):TODO;
	/**
		Sets the cull face.
		
		@param face_type face type (constant)
		
		   * `render.FACE_FRONT`
		   * `render.FACE_BACK`
		   * `render.FACE_FRONT_AND_BACK`
	**/
	static function set_cull_face(face_type:TODO):TODO;
	/**
		Sets the depth test function.
		
		@param func depth test function (constant)
		
		   * `render.COMPARE_FUNC_NEVER`
		   * `render.COMPARE_FUNC_LESS`
		   * `render.COMPARE_FUNC_LEQUAL`
		   * `render.COMPARE_FUNC_GREATER`
		   * `render.COMPARE_FUNC_GEQUAL`
		   * `render.COMPARE_FUNC_EQUAL`
		   * `render.COMPARE_FUNC_NOTEQUAL`
		   * `render.COMPARE_FUNC_ALWAYS`
	**/
	static function set_depth_func(func:TODO):TODO;
	/**
		Sets the depth mask.
		
		@param depth depth mask (boolean)
	**/
	static function set_depth_mask(depth:TODO):TODO;
	/**
		Sets the polygon offset.
		
		@param factor polygon offset factor (number)
		@param units polygon offset units (number)
	**/
	static function set_polygon_offset(factor:TODO, units:TODO):TODO;
	/**
		Sets the projection matrix.
		
		Sets the projection matrix to use when rendering.
		
		@param matrix projection matrix (matrix4)
	**/
	static function set_projection(matrix:TODO):TODO;
	/**
		Sets the render target size.
		
		@param render_target render target to set size for (render_target)
		@param width new render target width (number)
		@param height new render target height (number)
	**/
	static function set_render_target_size(render_target:TODO, width:TODO, height:TODO):TODO;
	/**
		Sets the stencil test function.
		
		@param func stencil test function (constant)
		
		   * `render.COMPARE_FUNC_NEVER`
		   * `render.COMPARE_FUNC_LESS`
		   * `render.COMPARE_FUNC_LEQUAL`
		   * `render.COMPARE_FUNC_GREATER`
		   * `render.COMPARE_FUNC_GEQUAL`
		   * `render.COMPARE_FUNC_EQUAL`
		   * `render.COMPARE_FUNC_NOTEQUAL`
		   * `render.COMPARE_FUNC_ALWAYS`
		
		@param ref reference value for the stencil test (number)
		@param mask mask that is ANDed with both the reference value and the stored stencil value when the test is done (number)
	**/
	static function set_stencil_func(func:TODO, ref:TODO, mask:TODO):TODO;
	/**
		Sets the stencil mask.
		
		@param mask stencil mask (number)
	**/
	static function set_stencil_mask(mask:TODO):TODO;
	/**
		Sets the stencil operator.
		
		Available operators:
		
		   * `render.STENCIL_OP_KEEP`
		   * `render.STENCIL_OP_ZERO`
		   * `render.STENCIL_OP_REPLACE`
		   * `render.STENCIL_OP_INCR`
		   * `render.STENCIL_OP_INCR_WRAP`
		   * `render.STENCIL_OP_DECR`
		   * `render.STENCIL_OP_DECR_WRAP`
		   * `render.STENCIL_OP_INVERT`
		
		@param sfail action to take when the stencil test fails (constant)
		@param dpfail the stencil action when the stencil test passes (constant)
		@param dppass the stencil action when both the stencil test and the depth test pass, or when the stencil test passes and either there is no depth buffer or depth testing is not enabled (constant)
	**/
	static function set_stencil_op(sfail:TODO, dpfail:TODO, dppass:TODO):TODO;
	/**
		Sets the view matrix.
		
		Sets the view matrix to use when rendering.
		
		@param matrix view matrix to set (matrix4)
	**/
	static function set_view(matrix:TODO):TODO;
	/**
		Sets the render viewport.
		
		@param x left corner (number)
		@param y bottom corner (number)
		@param width viewport width (number)
		@param height viewport height (number)
	**/
	static function set_viewport(x:TODO, y:TODO, width:TODO, height:TODO):TODO;
}

/**
	Data for the `RenderMessages.clear_color` message.
**/
typedef RenderMessageClearColor = {
	/**
		color to use as clear color
	**/
	var color : TODO;
}

/**
	Data for the `RenderMessages.draw_line` message.
**/
typedef RenderMessageDrawLine = {
	/**
		Start point of the line
	**/
	var start_point : TODO;
	/**
		End point of the line
	**/
	var end_point : TODO;
	/**
		Color of the line
	**/
	var color : TODO;
}

/**
	Data for the `RenderMessages.draw_text` message.
**/
typedef RenderMessageDrawText = {
	/**
		Position of the text
	**/
	var position : TODO;
	/**
		The text to draw
	**/
	var text : TODO;
}

/**
	Data for the `RenderMessages.window_resized` message.
**/
typedef RenderMessageWindowResized = {
	/**
		the new window height (number)
	**/
	var height : TODO;
	/**
		the new window width (number)
	**/
	var width : TODO;
}

/**
	Messages related to the `Render` module.
**/
@:publicFields class RenderMessages {
	/**
		Set clear color.
		
		Set render clear color. This is the color that appears on the screen where nothing is rendered, i.e. background.
	**/
	static var clear_color(default, never) : Message<RenderMessageClearColor> = new Message("clear_color");
	/**
		Draw a line on the screen.
		
		Draw a line on the screen. This should mostly be used for debugging purposes.
	**/
	static var draw_line(default, never) : Message<RenderMessageDrawLine> = new Message("draw_line");
	/**
		Draw a text on the screen.
		
		Draw a text on the screen. This should mostly be used for debugging purposes.
	**/
	static var draw_text(default, never) : Message<RenderMessageDrawText> = new Message("draw_text");
	/**
		Reports a window size change.
		
		Reports a change in window size. This is initiated on window resize on desktop or by orientation changes
		on mobile devices.
	**/
	static var window_resized(default, never) : Message<RenderMessageWindowResized> = new Message("window_resized");
}

@:native("_G.render") extern class RenderVariables {
	/**
		.
	**/
	static var BLEND_CONSTANT_ALPHA(default, never) : TODO;
	/**
		.
	**/
	static var BLEND_CONSTANT_COLOR(default, never) : TODO;
	/**
		.
	**/
	static var BLEND_DST_ALPHA(default, never) : TODO;
	/**
		.
	**/
	static var BLEND_DST_COLOR(default, never) : TODO;
	/**
		.
	**/
	static var BLEND_ONE(default, never) : TODO;
	/**
		.
	**/
	static var BLEND_ONE_MINUS_CONSTANT_ALPHA(default, never) : TODO;
	/**
		.
	**/
	static var BLEND_ONE_MINUS_CONSTANT_COLOR(default, never) : TODO;
	/**
		.
	**/
	static var BLEND_ONE_MINUS_DST_ALPHA(default, never) : TODO;
	/**
		.
	**/
	static var BLEND_ONE_MINUS_DST_COLOR(default, never) : TODO;
	/**
		.
	**/
	static var BLEND_ONE_MINUS_SRC_ALPHA(default, never) : TODO;
	/**
		.
	**/
	static var BLEND_ONE_MINUS_SRC_COLOR(default, never) : TODO;
	/**
		.
	**/
	static var BLEND_SRC_ALPHA(default, never) : TODO;
	/**
		.
	**/
	static var BLEND_SRC_ALPHA_SATURATE(default, never) : TODO;
	/**
		.
	**/
	static var BLEND_SRC_COLOR(default, never) : TODO;
	/**
		.
	**/
	static var BLEND_ZERO(default, never) : TODO;
	/**
		.
	**/
	static var BUFFER_COLOR_BIT(default, never) : TODO;
	/**
		.
	**/
	static var BUFFER_DEPTH_BIT(default, never) : TODO;
	/**
		.
	**/
	static var BUFFER_STENCIL_BIT(default, never) : TODO;
	/**
		.
	**/
	static var COMPARE_FUNC_ALWAYS(default, never) : TODO;
	/**
		.
	**/
	static var COMPARE_FUNC_EQUAL(default, never) : TODO;
	/**
		.
	**/
	static var COMPARE_FUNC_GEQUAL(default, never) : TODO;
	/**
		.
	**/
	static var COMPARE_FUNC_GREATER(default, never) : TODO;
	/**
		.
	**/
	static var COMPARE_FUNC_LEQUAL(default, never) : TODO;
	/**
		.
	**/
	static var COMPARE_FUNC_LESS(default, never) : TODO;
	/**
		.
	**/
	static var COMPARE_FUNC_NEVER(default, never) : TODO;
	/**
		.
	**/
	static var COMPARE_FUNC_NOTEQUAL(default, never) : TODO;
	/**
		.
	**/
	static var FACE_BACK(default, never) : TODO;
	/**
		.
	**/
	static var FACE_FRONT(default, never) : TODO;
	/**
		.
	**/
	static var FACE_FRONT_AND_BACK(default, never) : TODO;
	/**
		.
	**/
	static var FILTER_LINEAR(default, never) : TODO;
	/**
		.
	**/
	static var FILTER_NEAREST(default, never) : TODO;
	/**
		.
	**/
	static var FORMAT_DEPTH(default, never) : TODO;
	/**
		.
	**/
	static var FORMAT_LUMINANCE(default, never) : TODO;
	/**
		.
	**/
	static var FORMAT_RGB(default, never) : TODO;
	/**
		.
	**/
	static var FORMAT_RGBA(default, never) : TODO;
	/**
		.
	**/
	static var FORMAT_RGBA_DXT1(default, never) : TODO;
	/**
		.
	**/
	static var FORMAT_RGBA_DXT3(default, never) : TODO;
	/**
		.
	**/
	static var FORMAT_RGBA_DXT5(default, never) : TODO;
	/**
		.
	**/
	static var FORMAT_RGB_DXT1(default, never) : TODO;
	/**
		.
	**/
	static var FORMAT_STENCIL(default, never) : TODO;
	/**
		.
	**/
	static var STATE_BLEND(default, never) : TODO;
	/**
		.
	**/
	static var STATE_CULL_FACE(default, never) : TODO;
	/**
		.
	**/
	static var STATE_DEPTH_TEST(default, never) : TODO;
	/**
		.
	**/
	static var STATE_POLYGON_OFFSET_FILL(default, never) : TODO;
	/**
		.
	**/
	static var STATE_STENCIL_TEST(default, never) : TODO;
	/**
		.
	**/
	static var STENCIL_OP_DECR(default, never) : TODO;
	/**
		.
	**/
	static var STENCIL_OP_DECR_WRAP(default, never) : TODO;
	/**
		.
	**/
	static var STENCIL_OP_INCR(default, never) : TODO;
	/**
		.
	**/
	static var STENCIL_OP_INCR_WRAP(default, never) : TODO;
	/**
		.
	**/
	static var STENCIL_OP_INVERT(default, never) : TODO;
	/**
		.
	**/
	static var STENCIL_OP_KEEP(default, never) : TODO;
	/**
		.
	**/
	static var STENCIL_OP_REPLACE(default, never) : TODO;
	/**
		.
	**/
	static var STENCIL_OP_ZERO(default, never) : TODO;
	/**
		.
	**/
	static var WRAP_CLAMP_TO_BORDER(default, never) : TODO;
	/**
		.
	**/
	static var WRAP_CLAMP_TO_EDGE(default, never) : TODO;
	/**
		.
	**/
	static var WRAP_MIRRORED_REPEAT(default, never) : TODO;
	/**
		.
	**/
	static var WRAP_REPEAT(default, never) : TODO;
}
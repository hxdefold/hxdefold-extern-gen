package defold;

@:native("_G.render") extern class Render {
	/**
		clears the active render target
		
		Clear buffers in the currently enabled render target with specified value.
		
		@param buffers Table with keys specifying which buffers to clear and values set to clear values. (table)
		Available keys are:
		<ul>
		    <li><code>render.BUFFER_COLOR_BIT</code></li>
		    <li><code>render.BUFFER_DEPTH_BIT</code></li>
		    <li><code>render.BUFFER_STENCIL_BIT</code></li>
		</ul>
	**/
	static function clear(buffers:TODO):TODO;
	/**
		create a new constant buffer.
		
		Constant buffers are used to set shader program variables and are optionally passed to the <code>render.draw()</code>
		function. The buffer's constant elements can be indexed like an ordinary Lua table, but you can't iterate
		over them with pairs() or ipairs().
	**/
	static function constant_buffer():TODO;
	/**
		deletes a render target
		
		@param render_target render target to delete (render_target)
	**/
	static function delete_render_target(render_target:TODO):TODO;
	/**
		disables the currently enabled material
		
		If a material is currently enabled, disable it.
	**/
	static function disable_material():TODO;
	/**
		disables a render target
		
		@param render_target render target to disable (render_target)
	**/
	static function disable_render_target(render_target:TODO):TODO;
	/**
		disables a render state
		
		@param state state to enable (constant)
		<ul>
		  <li><code>render.STATE_DEPTH_TEST</code></li>
		  <li><code>render.STATE_STENCIL_TEST</code></li>
		  <li><code>render.STATE_BLEND</code></li>
		  <li><code>render.STATE_CULL_FACE</code></li>
		  <li><code>render.STATE_POLYGON_OFFSET_FILL</code></li>
		</ul>
	**/
	static function disable_state(state:TODO):TODO;
	/**
		disables a texture for a render target
		
		@param unit texture unit to enable disable for (number)
		@param render_target render target for which to disable the specified texture unit (render_target)
	**/
	static function disable_texture(unit:TODO, render_target:TODO):TODO;
	/**
		draws all objects matching a predicate
		
		Draws all objects that match a specified predicate. An optional constants buffer can be
		provided to override the default constants. If no constants buffer is provided, a default
		system constants buffer is used containing constants as defined in materials and set through
		<code>*.set_constant()</code> and <code>*.reset_constant()</code> on visual components.
		
		@param predicate predicate to draw for (predicate)
		@param constants optional constants to use while rendering (constants_buffer)
	**/
	static function draw(predicate:TODO, constants:TODO):TODO;
	/**
		draws all 2d debug graphics (Deprecated)
	**/
	@:deprecated("Use render.draw_debug3d() to draw visual debug info.")
	static function draw_debug2d():TODO;
	/**
		draws all 3d debug graphics
		
		Draws all 3d debug graphics such as lines drawn with "draw_line" messages and physics visualization.
	**/
	static function draw_debug3d():TODO;
	/**
		enables a material
		
		If another material was already enabled, it will be automatically disabled.
		
		@param material_id material id to enable (string)
	**/
	static function enable_material(material_id:TODO):TODO;
	/**
		enables a render target
		
		@param render_target render target to enable (render_target)
	**/
	static function enable_render_target(render_target:TODO):TODO;
	/**
		enables a render state
		
		@param state state to enable (constant)
		<ul>
		  <li><code>render.STATE_DEPTH_TEST</code></li>
		  <li><code>render.STATE_STENCIL_TEST</code></li>
		  <li><code>render.STATE_BLEND</code></li>
		  <li><code>render.STATE_ALPHA_TEST</code> (not available on iOS and Android)</li>
		  <li><code>render.STATE_CULL_FACE</code></li>
		  <li><code>render.STATE_POLYGON_OFFSET_FILL</code></li>
		</ul>
	**/
	static function enable_state(state:TODO):TODO;
	/**
		enables a texture for a render target
		
		@param unit texture unit to enable texture for (number)
		@param render_target render target from which to enable the specified texture unit (render_target)
		@param buffer_type buffer type from which to enable the texture (constant)
	**/
	static function enable_texture(unit:TODO, render_target:TODO, buffer_type:TODO):TODO;
	/**
		gets the window height, as specified for the project
	**/
	static function get_height():TODO;
	/**
		retrieve a buffer height from a render target
		
		@param render_target render target from which to retrieve the buffer height (render_target)
		@param buffer_type which type of buffer to retrieve the height from (constant)
	**/
	static function get_render_target_height(render_target:TODO, buffer_type:TODO):TODO;
	/**
		retrieve a buffer width from a render target
		
		@param render_target render target from which to retrieve the buffer width (render_target)
		@param buffer_type which type of buffer to retrieve the width from (constant)
	**/
	static function get_render_target_width(render_target:TODO, buffer_type:TODO):TODO;
	/**
		gets the window width, as specified for the project
	**/
	static function get_width():TODO;
	/**
		gets the window height
	**/
	static function get_window_height():TODO;
	/**
		gets the actual window width
	**/
	static function get_window_width():TODO;
	/**
		creates a new render predicate
		
		@param predicates table of tags that the predicate should match (table). The tags can be either (hash|string)
	**/
	static function predicate(predicates:TODO):TODO;
	/**
		creates a new render target
		
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
		sets the blending function
		
		Available factors:
		<ul>
		  <li><code>render.BLEND_ZERO</code></li>
		  <li><code>render.BLEND_ONE</code></li>
		  <li><code>render.BLEND_SRC_COLOR</code></li>
		  <li><code>render.BLEND_ONE_MINUS_SRC_COLOR</code></li>
		  <li><code>render.BLEND_DST_COLOR</code></li>
		  <li><code>render.BLEND_ONE_MINUS_DST_COLOR</code></li>
		  <li><code>render.BLEND_SRC_ALPHA</code></li>
		  <li><code>render.BLEND_ONE_MINUS_SRC_ALPHA</code></li>
		  <li><code>render.BLEND_DST_ALPHA</code></li>
		  <li><code>render.BLEND_ONE_MINUS_DST_ALPHA</code></li>
		  <li><code>render.BLEND_SRC_ALPHA_SATURATE</code></li>
		  <li><code>render.BLEND_CONSTANT_COLOR</code></li>
		  <li><code>render.BLEND_ONE_MINUS_CONSTANT_COLOR</code></li>
		  <li><code>render.BLEND_CONSTANT_ALPHA</code></li>
		  <li><code>render.BLEND_ONE_MINUS_CONSTANT_ALPHA</code></li>
		</ul>
		
		@param source_factor source factor (constant)
		@param destination_factor destination factor (constant)
	**/
	static function set_blend_func(source_factor:TODO, destination_factor:TODO):TODO;
	/**
		sets the color mask
		
		@param red red mask (boolean)
		@param green green mask (boolean)
		@param blue blue mask (boolean)
		@param alpha alpha mask (boolean)
	**/
	static function set_color_mask(red:TODO, green:TODO, blue:TODO, alpha:TODO):TODO;
	/**
		sets the cull face
		
		@param face_type face type (constant)
		<ul>
		  <li><code>render.FACE_FRONT</code></li>
		  <li><code>render.FACE_BACK</code></li>
		  <li><code>render.FACE_FRONT_AND_BACK</code></li>
		</ul>
	**/
	static function set_cull_face(face_type:TODO):TODO;
	/**
		sets the depth test function
		
		@param func depth test function (constant)
		<ul>
		  <li><code>render.COMPARE_FUNC_NEVER</code></li>
		  <li><code>render.COMPARE_FUNC_LESS</code></li>
		  <li><code>render.COMPARE_FUNC_LEQUAL</code></li>
		  <li><code>render.COMPARE_FUNC_GREATER</code></li>
		  <li><code>render.COMPARE_FUNC_GEQUAL</code></li>
		  <li><code>render.COMPARE_FUNC_EQUAL</code></li>
		  <li><code>render.COMPARE_FUNC_NOTEQUAL</code></li>
		  <li><code>render.COMPARE_FUNC_ALWAYS</code></li>
		</ul>
	**/
	static function set_depth_func(func:TODO):TODO;
	/**
		sets the depth mask
		
		@param depth depth mask (boolean)
	**/
	static function set_depth_mask(depth:TODO):TODO;
	/**
		sets the polygon offset
		
		@param factor polygon offset factor (number)
		@param units polygon offset units (number)
	**/
	static function set_polygon_offset(factor:TODO, units:TODO):TODO;
	/**
		sets the projection matrix
		
		Sets the projection matrix to use when rendering.
		
		@param matrix projection matrix (matrix4)
	**/
	static function set_projection(matrix:TODO):TODO;
	/**
		sets the render target size
		
		@param render_target render target to set size for (render_target)
		@param width new render target width (number)
		@param height new render target height (number)
	**/
	static function set_render_target_size(render_target:TODO, width:TODO, height:TODO):TODO;
	/**
		sets the stencil test function
		
		@param func stencil test function (constant)
		<ul>
		  <li><code>render.COMPARE_FUNC_NEVER</code></li>
		  <li><code>render.COMPARE_FUNC_LESS</code></li>
		  <li><code>render.COMPARE_FUNC_LEQUAL</code></li>
		  <li><code>render.COMPARE_FUNC_GREATER</code></li>
		  <li><code>render.COMPARE_FUNC_GEQUAL</code></li>
		  <li><code>render.COMPARE_FUNC_EQUAL</code></li>
		  <li><code>render.COMPARE_FUNC_NOTEQUAL</code></li>
		  <li><code>render.COMPARE_FUNC_ALWAYS</code></li>
		</ul>
		@param ref reference value for the stencil test (number)
		@param mask mask that is ANDed with both the reference value and the stored stencil value when the test is done (number)
	**/
	static function set_stencil_func(func:TODO, ref:TODO, mask:TODO):TODO;
	/**
		sets the stencil mask
		
		@param mask stencil mask (number)
	**/
	static function set_stencil_mask(mask:TODO):TODO;
	/**
		sets the stencil operator
		
		Available operators:
		<ul>
		  <li><code>render.STENCIL_OP_KEEP</code></li>
		  <li><code>render.STENCIL_OP_ZERO</code></li>
		  <li><code>render.STENCIL_OP_REPLACE</code></li>
		  <li><code>render.STENCIL_OP_INCR</code></li>
		  <li><code>render.STENCIL_OP_INCR_WRAP</code></li>
		  <li><code>render.STENCIL_OP_DECR</code></li>
		  <li><code>render.STENCIL_OP_DECR_WRAP</code></li>
		  <li><code>render.STENCIL_OP_INVERT</code></li>
		</ul>
		
		@param sfail action to take when the stencil test fails (constant)
		@param dpfail the stencil action when the stencil test passes (constant)
		@param dppass the stencil action when both the stencil test and the depth test pass, or when the stencil test passes and either there is no depth buffer or depth testing is not enabled (constant)
	**/
	static function set_stencil_op(sfail:TODO, dpfail:TODO, dppass:TODO):TODO;
	/**
		sets the view matrix
		
		Sets the view matrix to use when rendering.
		
		@param matrix view matrix to set (matrix4)
	**/
	static function set_view(matrix:TODO):TODO;
	/**
		sets the render viewport
		
		@param x left corner (number)
		@param y bottom corner (number)
		@param width viewport width (number)
		@param height viewport height (number)
	**/
	static function set_viewport(x:TODO, y:TODO, width:TODO, height:TODO):TODO;
}

@:publicFields class RenderMessages {
	/**
		set clear color
		
		Set render clear color. This is the color that appears on the screen where nothing is rendered, i.e. background.
		
		@param color color to use as clear color
	**/
	static var ClearColor(default, never) : Message<{ var color : TODO; }> = new Message("clear_color");
	/**
		draw a line on the screen
		
		Draw a line on the screen. This should mostly be used for debugging purposes.
		
		@param start_point Start point of the line
		@param end_point End point of the line
		@param color Color of the line
	**/
	static var DrawLine(default, never) : Message<{ var start_point : TODO; var end_point : TODO; var color : TODO; }> = new Message("draw_line");
	/**
		draw a text on the screen
		
		Draw a text on the screen. This should mostly be used for debugging purposes.
		
		@param position Position of the text
		@param text The text to draw
	**/
	static var DrawText(default, never) : Message<{ var position : TODO; var text : TODO; }> = new Message("draw_text");
	/**
		reports a window size change
		
		Reports a change in window size. This is initiated on window resize on desktop or by orientation changes
		on mobile devices.
		
		@param height the new window height (number)
		@param width the new window width (number)
	**/
	static var WindowResized(default, never) : Message<{ var height : TODO; var width : TODO; }> = new Message("window_resized");
}

@:native("_G.render") extern class RenderVariables {
	static var BLEND_CONSTANT_ALPHA(default, never) : TODO;
	static var BLEND_CONSTANT_COLOR(default, never) : TODO;
	static var BLEND_DST_ALPHA(default, never) : TODO;
	static var BLEND_DST_COLOR(default, never) : TODO;
	static var BLEND_ONE(default, never) : TODO;
	static var BLEND_ONE_MINUS_CONSTANT_ALPHA(default, never) : TODO;
	static var BLEND_ONE_MINUS_CONSTANT_COLOR(default, never) : TODO;
	static var BLEND_ONE_MINUS_DST_ALPHA(default, never) : TODO;
	static var BLEND_ONE_MINUS_DST_COLOR(default, never) : TODO;
	static var BLEND_ONE_MINUS_SRC_ALPHA(default, never) : TODO;
	static var BLEND_ONE_MINUS_SRC_COLOR(default, never) : TODO;
	static var BLEND_SRC_ALPHA(default, never) : TODO;
	static var BLEND_SRC_ALPHA_SATURATE(default, never) : TODO;
	static var BLEND_SRC_COLOR(default, never) : TODO;
	static var BLEND_ZERO(default, never) : TODO;
	static var BUFFER_COLOR_BIT(default, never) : TODO;
	static var BUFFER_DEPTH_BIT(default, never) : TODO;
	static var BUFFER_STENCIL_BIT(default, never) : TODO;
	static var COMPARE_FUNC_ALWAYS(default, never) : TODO;
	static var COMPARE_FUNC_EQUAL(default, never) : TODO;
	static var COMPARE_FUNC_GEQUAL(default, never) : TODO;
	static var COMPARE_FUNC_GREATER(default, never) : TODO;
	static var COMPARE_FUNC_LEQUAL(default, never) : TODO;
	static var COMPARE_FUNC_LESS(default, never) : TODO;
	static var COMPARE_FUNC_NEVER(default, never) : TODO;
	static var COMPARE_FUNC_NOTEQUAL(default, never) : TODO;
	static var FACE_BACK(default, never) : TODO;
	static var FACE_FRONT(default, never) : TODO;
	static var FACE_FRONT_AND_BACK(default, never) : TODO;
	static var FILTER_LINEAR(default, never) : TODO;
	static var FILTER_NEAREST(default, never) : TODO;
	static var FORMAT_DEPTH(default, never) : TODO;
	static var FORMAT_LUMINANCE(default, never) : TODO;
	static var FORMAT_RGB(default, never) : TODO;
	static var FORMAT_RGBA(default, never) : TODO;
	static var FORMAT_RGBA_DXT1(default, never) : TODO;
	static var FORMAT_RGBA_DXT3(default, never) : TODO;
	static var FORMAT_RGBA_DXT5(default, never) : TODO;
	static var FORMAT_RGB_DXT1(default, never) : TODO;
	static var FORMAT_STENCIL(default, never) : TODO;
	static var STATE_BLEND(default, never) : TODO;
	static var STATE_CULL_FACE(default, never) : TODO;
	static var STATE_DEPTH_TEST(default, never) : TODO;
	static var STATE_POLYGON_OFFSET_FILL(default, never) : TODO;
	static var STATE_STENCIL_TEST(default, never) : TODO;
	static var STENCIL_OP_DECR(default, never) : TODO;
	static var STENCIL_OP_DECR_WRAP(default, never) : TODO;
	static var STENCIL_OP_INCR(default, never) : TODO;
	static var STENCIL_OP_INCR_WRAP(default, never) : TODO;
	static var STENCIL_OP_INVERT(default, never) : TODO;
	static var STENCIL_OP_KEEP(default, never) : TODO;
	static var STENCIL_OP_REPLACE(default, never) : TODO;
	static var STENCIL_OP_ZERO(default, never) : TODO;
	static var WRAP_CLAMP_TO_BORDER(default, never) : TODO;
	static var WRAP_CLAMP_TO_EDGE(default, never) : TODO;
	static var WRAP_MIRRORED_REPEAT(default, never) : TODO;
	static var WRAP_REPEAT(default, never) : TODO;
}
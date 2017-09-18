package defold;

/**
    <p>Rendering functions, messages and constants. The "render" namespace is
    accessible only from render scripts.</p>
    <p>The rendering API is built on top of OpenGL ES 2.0, is a subset of the
    OpenGL computer graphics rendering API for rendering 2D and 3D computer
    graphics. OpenGL ES 2.0 is supported on all our target platforms.</p>
    <p><span class="icon-attention"></span> It is possible to create materials and write shaders that
    require features not in OpenGL ES 2.0, but those will not work cross platform.</p>

    See `RenderMessages` for related messages.
    See `RenderVariables` for related variables.
**/
@:native("_G.render")
extern class Render {
    /**
        Clears the active render target.
        
        Clear buffers in the currently enabled render target with specified value.
        
        @param buffers 
        <span class="type">table</span> table with keys specifying which buffers to clear and values set to clear values. Available keys are:
        
         * `render.BUFFER_COLOR_BIT`
         * `render.BUFFER_DEPTH_BIT`
         * `render.BUFFER_STENCIL_BIT`
    **/
    static function clear(buffers:TODO<"table">):Void;

    /**
        Create a new constant buffer..
        
        Constant buffers are used to set shader program variables and are optionally passed to the `render.draw()` function. The buffer's constant elements can be indexed like an ordinary Lua table, but you can't iterate over them with pairs() or ipairs().
        
        @return buffer 
        <span class="type">constant_buffer</span> new constant buffer
    **/
    static function constant_buffer():TODO;

    /**
        Deletes a render target.
        
        Deletes a previously created render target.
        
        @param render_target 
        <span class="type">render_target</span> render target to delete
    **/
    static function delete_render_target(render_target:TODO<"render_target">):Void;

    /**
        Disables the currently enabled material.
        
        If a material is currently enabled, disable it.
        
        The name of the material must be specified in the ".render" resource set
        in the "game.project" setting.
    **/
    static function disable_material():Void;

    /**
        Disables a render target.
        
        Disables a previously enabled render target. Subsequent draw operations
        will be drawn to the frame buffer unless another render target is
        enabled.
        
        @param render_target 
        <span class="type">render_target</span> render target to disable
    **/
    static function disable_render_target(render_target:TODO<"render_target">):Void;

    /**
        Disables a render state.
        
        Disables a render state.
        
        @param state 
        <span class="type">constant</span> state to disable
        
         * `render.STATE_DEPTH_TEST`
         * `render.STATE_STENCIL_TEST`
         * `render.STATE_BLEND`
         * `render.STATE_ALPHA_TEST` (<span class="icon-ios"></span><span class="icon-android"></span> not available on iOS and Android)
         * `render.STATE_CULL_FACE`
         * `render.STATE_POLYGON_OFFSET_FILL`
    **/
    static function disable_state(state:TODO<"constant">):Void;

    /**
        Disables a texture for a render target.
        
        Disables a texture unit for a render target that has previourly been enabled.
        
        @param unit 
        <span class="type">number</span> texture unit to disable
        
        @param render_target 
        <span class="type">render_target</span> render target for which to disable the specified texture unit
    **/
    static function disable_texture(unit:Float, render_target:TODO<"render_target">):Void;

    /**
        Draws all objects matching a predicate.
        
        Draws all objects that match a specified predicate. An optional constant buffer can be
        provided to override the default constants. If no constants buffer is provided, a default
        system constants buffer is used containing constants as defined in materials and set through
        `*.set_constant()` and `*.reset_constant()` on visual components.
        
        @param predicate 
        <span class="type">predicate</span> predicate to draw for
        
        @param constants 
        <span class="type">constant_buffer</span> optional constants to use while rendering
    **/
    static function draw(predicate:TODO<"predicate">, ?constants:TODO<"constant_buffer">):Void;

    /**
        Draws all 3d debug graphics.
        
        Draws all 3d debug graphics such as lines drawn with "draw_line" messages and physics visualization.
    **/
    static function draw_debug3d():Void;

    /**
        Enables a material.
        
        If another material was already enabled, it will be automatically disabled
        and the specified material is used instead.
        
        The name of the material must be specified in the ".render" resource set
        in the "game.project" setting.
        
        @param material_id 
        <span class="type">string | hash</span> material id to enable
    **/
    static function enable_material(material_id:EitherType<Hash, String>):Void;

    /**
        Enables a render target.
        
        Enables a render target. Subsequent draw operations will be to the
        enabled render target until it is disabled.
        
        @param render_target 
        <span class="type">render_target</span> render target to enable
    **/
    static function enable_render_target(render_target:TODO<"render_target">):Void;

    /**
        Enables a render state.
        
        Enables a particular render state. The state will be enabled until disabled.
        
        @param state 
        <span class="type">constant</span> state to enable
        
         * `render.STATE_DEPTH_TEST`
         * `render.STATE_STENCIL_TEST`
         * `render.STATE_BLEND`
         * `render.STATE_ALPHA_TEST` (<span class="icon-ios"></span><span class="icon-android"></span> not available on iOS and Android)
         * `render.STATE_CULL_FACE`
         * `render.STATE_POLYGON_OFFSET_FILL`
    **/
    static function enable_state(state:TODO<"constant">):Void;

    /**
        Enables a texture for a render target.
        
        Sets the specified render target's specified buffer to be
        used as texture with the specified unit.
        A material shader can then use the texture to sample from.
        
        @param unit 
        <span class="type">number</span> texture unit to enable texture for
        
        @param render_target 
        <span class="type">render_target</span> render target from which to enable the specified texture unit
        
        @param buffer_type 
        <span class="type">constant</span> buffer type from which to enable the texture
        
         * `render.BUFFER_COLOR_BIT`
         * `render.BUFFER_DEPTH_BIT`
         * `render.BUFFER_STENCIL_BIT`
    **/
    static function enable_texture(unit:Float, render_target:TODO<"render_target">, buffer_type:TODO<"constant">):Void;

    /**
        Gets the window height, as specified for the project.
        
        Returns the logical window height that is set in the "game.project" settings.
        Note that the actual window pixel size can change, either by device constraints
        or user input.
        
        @return height 
        <span class="type">number</span> specified window height
    **/
    static function get_height():TODO;

    /**
        Retrieve a buffer height from a render target.
        
        Returns the specified buffer height from a render target.
        
        @param render_target 
        <span class="type">render_target</span> render target from which to retrieve the buffer height
        
        @param buffer_type 
        <span class="type">constant</span> which type of buffer to retrieve the height from
        
         * `render.BUFFER_COLOR_BIT`
         * `render.BUFFER_DEPTH_BIT`
         * `render.BUFFER_STENCIL_BIT`
        
        @return height 
        <span class="type">number</span> the height of the render target buffer texture
    **/
    static function get_render_target_height(render_target:TODO<"render_target">, buffer_type:TODO<"constant">):TODO;

    /**
        Retrieve the buffer width from a render target.
        
        Returns the specified buffer width from a render target.
        
        @param render_target 
        <span class="type">render_target</span> render target from which to retrieve the buffer width
        
        @param buffer_type 
        <span class="type">constant</span> which type of buffer to retrieve the width from
        
         * `render.BUFFER_COLOR_BIT`
         * `render.BUFFER_DEPTH_BIT`
         * `render.BUFFER_STENCIL_BIT`
        
        @return width 
        <span class="type">number</span> the width of the render target buffer texture
    **/
    static function get_render_target_width(render_target:TODO<"render_target">, buffer_type:TODO<"constant">):TODO;

    /**
        Gets the window width, as specified for the project.
        
        Returns the logical window width that is set in the "game.project" settings.
        Note that the actual window pixel size can change, either by device constraints
        or user input.
        
        @return width 
        <span class="type">number</span> specified window width (number)
    **/
    static function get_width():TODO;

    /**
        Gets the actual window height.
        
        Returns the actual physical window height.
        Note that this value might differ from the logical height that is set in the
        "game.project" settings.
        
        @return height 
        <span class="type">number</span> actual window height
    **/
    static function get_window_height():TODO;

    /**
        Gets the actual window width.
        
        Returns the actual physical window width.
        Note that this value might differ from the logical width that is set in the
        "game.project" settings.
        
        @return width 
        <span class="type">number</span> actual window width
    **/
    static function get_window_width():TODO;

    /**
        Creates a new render predicate.
        
        This function returns a new render predicate for objects with materials matching
        the provided material tags. The provided tags are combined into a bit mask
        for the predicate. If multiple tags are provided, the predicate matches materials
        with all tags ANDed together.
        
        The current limit to the number of tags that can be defined is `32`.
        
        @param tags 
        <span class="type">table</span> table of tags that the predicate should match. The tags can be of either hash or string type
        
        @return predicate 
        <span class="type">predicate</span> new predicate
    **/
    static function predicate(tags:TODO<"table">):TODO;

    /**
        Creates a new render target.
        
        Creates a new render target according to the supplied
        specification table.
        
        The table should contain keys specifying which buffers should be created
        with what parameters. Each buffer key should have a table value consisting
        of parameters. The following parameter keys are available:
        
        <table>
        <thead>
        <tr>
        <th>Key</th>
        <th>Values</th>
        </tr>
        </thead>
        <tbody>
        <tr>
        <td>`format`</td>
        <td>`render.FORMAT_LUMINANCE`<br/>`render.FORMAT_RGB`<br/>`render.FORMAT_RGBA`<br/> `render.FORMAT_RGB_DXT1`<br/>`render.FORMAT_RGBA_DXT1`<br/>`render.FORMAT_RGBA_DXT3`<br/> `render.FORMAT_RGBA_DXT5`<br/>`render.FORMAT_DEPTH`<br/>`render.FORMAT_STENCIL`<br/></td>
        </tr>
        <tr>
        <td>`width`</td>
        <td>number</td>
        </tr>
        <tr>
        <td>`height`</td>
        <td>number</td>
        </tr>
        <tr>
        <td>`min_filter`</td>
        <td>`render.FILTER_LINEAR`<br/>`render.FILTER_NEAREST`</td>
        </tr>
        <tr>
        <td>`mag_filter`</td>
        <td>`render.FILTER_LINEAR`<br/>`render.FILTER_NEAREST`</td>
        </tr>
        <tr>
        <td>`u_wrap`</td>
        <td>`render.WRAP_CLAMP_TO_BORDER`<br/>`render.WRAP_CLAMP_TO_EDGE`<br/>`render.WRAP_MIRRORED_REPEAT`<br/>`render.WRAP_REPEAT`<br/></td>
        </tr>
        <tr>
        <td>`v_wrap`</td>
        <td>`render.WRAP_CLAMP_TO_BORDER`<br/>`render.WRAP_CLAMP_TO_EDGE`<br/>`render.WRAP_MIRRORED_REPEAT`<br/>`render.WRAP_REPEAT`</td>
        </tr>
        </tbody>
        </table>
        
        @param name 
        <span class="type">string</span> render target name
        
        @param parameters 
        <span class="type">table</span> table of buffer parameters, see the description for available keys and values
        
        @return render_target 
        <span class="type">render_target</span> new render target
    **/
    static function render_target(name:String, parameters:TODO<"table">):TODO;

    /**
        Sets the blending function.
        
        Specifies the arithmetic used when computing pixel values that are written to the frame
        buffer. In RGBA mode, pixels can be drawn using a function that blends the source RGBA
        pixel values with the destination pixel values already in the frame buffer.
        Blending is initially disabled.
        
        `source_factor` specifies which method is used to scale the source color components.
        `destination_factor` specifies which method is used to scale the destination color
        components.
        
        Source color components are referred to as (R<sub>s</sub>,G<sub>s</sub>,B<sub>s</sub>,A<sub>s</sub>).
        Destination color components are referred to as (R<sub>d</sub>,G<sub>d</sub>,B<sub>d</sub>,A<sub>d</sub>).
        The color specified by setting the blendcolor is referred to as (R<sub>c</sub>,G<sub>c</sub>,B<sub>c</sub>,A<sub>c</sub>).
        
        The source scale factor is referred to as (s<sub>R</sub>,s<sub>G</sub>,s<sub>B</sub>,s<sub>A</sub>).
        The destination scale factor is referred to as (d<sub>R</sub>,d<sub>G</sub>,d<sub>B</sub>,d<sub>A</sub>).
        
        The color values have integer values between 0 and (k<sub>R</sub>,k<sub>G</sub>,k<sub>B</sub>,k<sub>A</sub>), where k<sub>c</sub> = 2<sup>m<sub>c</sub></sup> - 1 and m<sub>c</sub> is the number of bitplanes for that color. I.e for 8 bit color depth, color values are between `0` and `255`.
        
        Available factor constants and corresponding scale factors:
        
        <table>
        <thead>
        <tr>
        <th>Factor constant</th>
        <th>Scale factor (f<sub>R</sub>,f<sub>G</sub>,f<sub>B</sub>,f<sub>A</sub>)</th>
        </tr>
        </thead>
        <tbody>
        <tr>
        <td>`render.BLEND_ZERO`</td>
        <td>(0,0,0,0)</td>
        </tr>
        <tr>
        <td>`render.BLEND_ONE`</td>
        <td>(1,1,1,1)</td>
        </tr>
        <tr>
        <td>`render.BLEND_SRC_COLOR`</td>
        <td>(R<sub>s</sub>/k<sub>R</sub>,G<sub>s</sub>/k<sub>G</sub>,B<sub>s</sub>/k<sub>B</sub>,A<sub>s</sub>/k<sub>A</sub>)</td>
        </tr>
        <tr>
        <td>`render.BLEND_ONE_MINUS_SRC_COLOR`</td>
        <td>(1,1,1,1) - (R<sub>s</sub>/k<sub>R</sub>,G<sub>s</sub>/k<sub>G</sub>,B<sub>s</sub>/k<sub>B</sub>,A<sub>s</sub>/k<sub>A</sub>)</td>
        </tr>
        <tr>
        <td>`render.BLEND_DST_COLOR`</td>
        <td>(R<sub>d</sub>/k<sub>R</sub>,G<sub>d</sub>/k<sub>G</sub>,B<sub>d</sub>/k<sub>B</sub>,A<sub>d</sub>/k<sub>A</sub>)</td>
        </tr>
        <tr>
        <td>`render.BLEND_ONE_MINUS_DST_COLOR`</td>
        <td>(1,1,1,1) - (R<sub>d</sub>/k<sub>R</sub>,G<sub>d</sub>/k<sub>G</sub>,B<sub>d</sub>/k<sub>B</sub>,A<sub>d</sub>/k<sub>A</sub>)</td>
        </tr>
        <tr>
        <td>`render.BLEND_SRC_ALPHA`</td>
        <td>(A<sub>s</sub>/k<sub>A</sub>,A<sub>s</sub>/k<sub>A</sub>,A<sub>s</sub>/k<sub>A</sub>,A<sub>s</sub>/k<sub>A</sub>)</td>
        </tr>
        <tr>
        <td>`render.BLEND_ONE_MINUS_SRC_ALPHA`</td>
        <td>(1,1,1,1) - (A<sub>s</sub>/k<sub>A</sub>,A<sub>s</sub>/k<sub>A</sub>,A<sub>s</sub>/k<sub>A</sub>,A<sub>s</sub>/k<sub>A</sub>)</td>
        </tr>
        <tr>
        <td>`render.BLEND_DST_ALPHA`</td>
        <td>(A<sub>d</sub>/k<sub>A</sub>,A<sub>d</sub>/k<sub>A</sub>,A<sub>d</sub>/k<sub>A</sub>,A<sub>d</sub>/k<sub>A</sub>)</td>
        </tr>
        <tr>
        <td>`render.BLEND_ONE_MINUS_DST_ALPHA`</td>
        <td>(1,1,1,1) - (A<sub>d</sub>/k<sub>A</sub>,A<sub>d</sub>/k<sub>A</sub>,A<sub>d</sub>/k<sub>A</sub>,A<sub>d</sub>/k<sub>A</sub>)</td>
        </tr>
        <tr>
        <td>`render.BLEND_CONSTANT_COLOR`</td>
        <td>(R<sub>c</sub>,G<sub>c</sub>,B<sub>c</sub>,A<sub>c</sub>)</td>
        </tr>
        <tr>
        <td>`render.BLEND_ONE_MINUS_CONSTANT_COLOR`</td>
        <td>(1,1,1,1) - (R<sub>c</sub>,G<sub>c</sub>,B<sub>c</sub>,A<sub>c</sub>)</td>
        </tr>
        <tr>
        <td>`render.BLEND_CONSTANT_ALPHA`</td>
        <td>(A<sub>c</sub>,A<sub>c</sub>,A<sub>c</sub>,A<sub>c</sub>)</td>
        </tr>
        <tr>
        <td>`render.BLEND_ONE_MINUS_CONSTANT_ALPHA`</td>
        <td>(1,1,1,1) - (A<sub>c</sub>,A<sub>c</sub>,A<sub>c</sub>,A<sub>c</sub>)</td>
        </tr>
        <tr>
        <td>`render.BLEND_SRC_ALPHA_SATURATE`</td>
        <td>(i,i,i,1) where i = min(A<sub>s</sub>, k<sub>A</sub> - A<sub>d</sub>) /k<sub>A</sub></td>
        </tr>
        </tbody>
        </table>
        
        The blended RGBA values of a pixel comes from the following equations:
        
         * R<sub>d</sub> = min(k<sub>R</sub>, R<sub>s</sub> * s<sub>R</sub> + R<sub>d</sub> * d<sub>R</sub>)
         * G<sub>d</sub> = min(k<sub>G</sub>, G<sub>s</sub> * s<sub>G</sub> + G<sub>d</sub> * d<sub>R</sub>)
         * B<sub>d</sub> = min(k<sub>B</sub>, B<sub>s</sub> * s<sub>B</sub> + B<sub>d</sub> * d<sub>B</sub>)
         * A<sub>d</sub> = min(k<sub>A</sub>, A<sub>s</sub> * s<sub>B</sub> + A<sub>d</sub> * d<sub>A</sub>)
        
        Blend function `(render.BLEND_SRC_ALPHA, render.BLEND_ONE_MINUS_SRC_ALPHA)` is useful for
        drawing with transparency when the drawn objects are sorted from farthest to nearest.
        It is also useful for drawing antialiased points and lines in arbitrary order.
        
        @param source_factor 
        <span class="type">constant</span> source factor
        
        @param destination_factor 
        <span class="type">constant</span> destination factor
    **/
    static function set_blend_func(source_factor:TODO<"constant">, destination_factor:TODO<"constant">):Void;

    /**
        Sets the color mask.
        
        Specifies whether the individual color components in the frame buffer is enabled for writing (`true`) or disabled (`false`). For example, if `blue` is `false`, nothing is written to the blue component of any pixel in any of the color buffers, regardless of the drawing operation attempted. Note that writing are either enabled or disabled for entire color components, not the individual bits of a component.
        
        The component masks are all initially `true`.
        
        @param red 
        <span class="type">boolean</span> red mask
        
        @param green 
        <span class="type">boolean</span> green mask
        
        @param blue 
        <span class="type">boolean</span> blue mask
        
        @param alpha 
        <span class="type">boolean</span> alpha mask
    **/
    static function set_color_mask(red:TODO<"boolean">, green:TODO<"boolean">, blue:TODO<"boolean">, alpha:TODO<"boolean">):Void;

    /**
        Sets the cull face.
        
        Specifies whether front- or back-facing polygons can be culled
        when polygon culling is enabled. Polygon culling is initially disabled.
        
        If mode is `render.FACE_FRONT_AND_BACK`, no polygons are drawn, but other
        primitives such as points and lines are drawn. The initial value for
        `face_type` is `render.FACE_BACK`.
        
        @param face_type 
        <span class="type">constant</span> face type
        
         * `render.FACE_FRONT`
         * `render.FACE_BACK`
         * `render.FACE_FRONT_AND_BACK`
    **/
    static function set_cull_face(face_type:TODO<"constant">):Void;

    /**
        Sets the depth test function.
        
        Specifies the function that should be used to compare each incoming pixel
        depth value with the value present in the depth buffer.
        The comparison is performed only if depth testing is enabled and specifies
        the conditions under which a pixel will be drawn.
        
        Function constants:
        
         * `render.COMPARE_FUNC_NEVER` (never passes)
         * `render.COMPARE_FUNC_LESS` (passes if the incoming depth value is less than the stored value)
         * `render.COMPARE_FUNC_LEQUAL` (passes if the incoming depth value is less than or equal to )the stored value
        `render.COMPARE_FUNC_GREATER` (passes if the incoming depth value is greater than the stored )v- alue
        `render.COMPARE_FUNC_GEQUAL` (passes if the incoming depth value is greater than or equal to )t- he stored value
         * `render.COMPARE_FUNC_EQUAL` (passes if the incoming depth value is equal to the stored value)
         * `render.COMPARE_FUNC_NOTEQUAL` (passes if the incoming depth value is not equal to the )stored value
         * `render.COMPARE_FUNC_ALWAYS` (always passes)
        
        The depth function is initially set to `render.COMPARE_FUNC_LESS`.
        
        @param func 
        <span class="type">constant</span> depth test function, see the description for available values
    **/
    static function set_depth_func(func:TODO<"constant">):Void;

    /**
        Sets the depth mask.
        
        Specifies whether the depth buffer is enabled for writing. The supplied mask governs
        if depth buffer writing is enabled (`true`) or disabled (`false`).
        
        The mask is initially `true`.
        
        @param depth 
        <span class="type">boolean</span> depth mask
    **/
    static function set_depth_mask(depth:TODO<"boolean">):Void;

    /**
        Sets the polygon offset.
        
        Sets the scale and units used to calculate depth values.
        If `render.STATE_POLYGON_OFFSET_FILL` is enabled, each fragment's depth value
        is offset from its interpolated value (depending on the depth value of the
        appropriate vertices). Polygon offset can be used when drawing decals, rendering
        hidden-line images etc.
        
        `factor` specifies a scale factor that is used to create a variable depth
        offset for each polygon. The initial value is `0`.
        
        `units` is multiplied by an implementation-specific value to create a
        constant depth offset. The initial value is `0`.
        
        The value of the offset is computed as `factor` &times; `DZ` + `r` &times; `units`
        
        `DZ` is a measurement of the depth slope of the polygon which is the change in z (depth)
        values divided by the change in either x or y coordinates, as you traverse a polygon.
        The depth values are in window coordinates, clamped to the range [0, 1].
        
        `r` is the smallest value that is guaranteed to produce a resolvable difference.
        It's value is an implementation-specific constant.
        
        The offset is added before the depth test is performed and before the
        value is written into the depth buffer.
        
        @param factor 
        <span class="type">number</span> polygon offset factor
        
        @param units 
        <span class="type">number</span> polygon offset units
    **/
    static function set_polygon_offset(factor:Float, units:Float):Void;

    /**
        Sets the projection matrix.
        
        Sets the projection matrix to use when rendering.
        
        @param matrix 
        <span class="type">matrix4</span> projection matrix
    **/
    static function set_projection(matrix:TODO<"matrix4">):Void;

    /**
        Sets the render target size.
        
        @param render_target 
        <span class="type">render_target</span> render target to set size for
        
        @param width 
        <span class="type">number</span> new render target width
        
        @param height 
        <span class="type">number</span> new render target height
    **/
    static function set_render_target_size(render_target:TODO<"render_target">, width:Float, height:Float):Void;

    /**
        Sets the stencil test function.
        
        Stenciling is similar to depth-buffering as it enables and disables drawing on a
        per-pixel basis. First, GL drawing primitives are drawn into the stencil planes.
        Second, geometry and images are rendered but using the stencil planes to mask out
        where to draw.
        
        The stencil test discards a pixel based on the outcome of a comparison between the
        reference value `ref` and the corresponding value in the stencil buffer.
        
        `func` specifies the comparison function. See the table below for values.
        The initial value is `render.COMPARE_FUNC_ALWAYS`.
        
        `ref` specifies the reference value for the stencil test. The value is clamped to
        the range [0, 2<sup>n</sup>-1], where n is the number of bitplanes in the stencil buffer.
        The initial value is `0`.
        
        `mask` is ANDed with both the reference value and the stored stencil value when the test
        is done. The initial value is all `1`'s.
        
        Function constant:
        
         * `render.COMPARE_FUNC_NEVER` (never passes)
         * `render.COMPARE_FUNC_LESS` (passes if (ref &amp; mask) &lt; (stencil &amp; mask))
         * `render.COMPARE_FUNC_LEQUAL` (passes if (ref &amp; mask) &lt;= (stencil &amp; mask))
         * `render.COMPARE_FUNC_GREATER` (passes if (ref &amp; mask) &gt; (stencil &amp; mask))
         * `render.COMPARE_FUNC_GEQUAL` (passes if (ref &amp; mask) &gt;= (stencil &amp; mask))
         * `render.COMPARE_FUNC_EQUAL` (passes if (ref &amp; mask) = (stencil &amp; mask))
         * `render.COMPARE_FUNC_NOTEQUAL` (passes if (ref &amp; mask) != (stencil &amp; mask))
         * `render.COMPARE_FUNC_ALWAYS` (always passes)
        
        @param func 
        <span class="type">constant</span> stencil test function, see the description for available values
        
        @param ref 
        <span class="type">number</span> reference value for the stencil test
        
        @param mask 
        <span class="type">number</span> mask that is ANDed with both the reference value and the stored stencil value when the test is done
    **/
    static function set_stencil_func(func:TODO<"constant">, ref:Float, mask:Float):Void;

    /**
        Sets the stencil mask.
        
        The stencil mask controls the writing of individual bits in the stencil buffer.
        The least significant `n` bits of the parameter `mask`, where `n` is the number of
        bits in the stencil buffer, specify the mask.
        
        Where a `1` bit appears in the mask, the corresponding
        bit in the stencil buffer can be written. Where a `0` bit appears in the mask,
        the corresponding bit in the stencil buffer is never written.
        
        The mask is initially all `1`'s.
        
        @param mask 
        <span class="type">number</span> stencil mask
    **/
    static function set_stencil_mask(mask:Float):Void;

    /**
        Sets the stencil operator.
        
        The stencil test discards a pixel based on the outcome of a comparison between the
        reference value `ref` and the corresponding value in the stencil buffer.
        To control the test, call `render.set_stencil_func`.
        
        This function takes three arguments that control what happens to the stored stencil
        value while stenciling is enabled. If the stencil test fails, no change is made to the
        pixel's color or depth buffers, and `sfail` specifies what happens to the stencil buffer
        contents.
        
        Operator constants:
        
         * `render.STENCIL_OP_KEEP` (keeps the current value)
         * `render.STENCIL_OP_ZERO` (sets the stencil buffer value to 0)
         * `render.STENCIL_OP_REPLACE` (sets the stencil buffer value to `ref`, as specified by `render.set_stencil_func`)
         * `render.STENCIL_OP_INCR` (increments the stencil buffer value and clamp to the maximum representable unsigned value)
         * `render.STENCIL_OP_INCR_WRAP` (increments the stencil buffer value and wrap to zero when incrementing the maximum representable unsigned value)
         * `render.STENCIL_OP_DECR` (decrements the current stencil buffer value and clamp to 0)
         * `render.STENCIL_OP_DECR_WRAP` (decrements the current stencil buffer value and wrap to the maximum representable unsigned value when decrementing zero)
         * `render.STENCIL_OP_INVERT` (bitwise inverts the current stencil buffer value)
        
        `dppass` and `dpfail` specify the stencil buffer actions depending on whether subsequent
        depth buffer tests succeed (dppass) or fail (dpfail).
        
        The initial value for all operators is `render.STENCIL_OP_KEEP`.
        
        @param sfail 
        <span class="type">constant</span> action to take when the stencil test fails
        
        @param dpfail 
        <span class="type">constant</span> the stencil action when the stencil test passes
        
        @param dppass 
        <span class="type">constant</span> the stencil action when both the stencil test and the depth test pass, or when the stencil test passes and either there is no depth buffer or depth testing is not enabled
    **/
    static function set_stencil_op(sfail:TODO<"constant">, dpfail:TODO<"constant">, dppass:TODO<"constant">):Void;

    /**
        Sets the view matrix.
        
        Sets the view matrix to use when rendering.
        
        @param matrix 
        <span class="type">matrix4</span> view matrix to set
    **/
    static function set_view(matrix:TODO<"matrix4">):Void;

    /**
        Sets the render viewport.
        
        Set the render viewport to the specified rectangle.
        
        @param x 
        <span class="type">number</span> left corner
        
        @param y 
        <span class="type">number</span> bottom corner
        
        @param width 
        <span class="type">number</span> viewport width
        
        @param height 
        <span class="type">number</span> viewport height
    **/
    static function set_viewport(x:Float, y:Float, width:Float, height:Float):Void;
}

/**
    Messages related to the `Render` module.
**/
@:publicFields
class RenderMessages {
    /**
        Set clear color.
        
        Set render clear color. This is the color that appears on the screen where nothing is rendered, i.e. background.
    **/
    static var clear_color(default, never) = new Message<RenderMessageClearColor>("clear_color");

    /**
        Draw a line on the screen.
        
        Draw a line on the screen. This should mostly be used for debugging purposes.
    **/
    static var draw_line(default, never) = new Message<RenderMessageDrawLine>("draw_line");

    /**
        Draw a text on the screen.
        
        Draw a text on the screen. This should mostly be used for debugging purposes.
    **/
    static var draw_text(default, never) = new Message<RenderMessageDrawText>("draw_text");

    /**
        Reports a window size change.
        
        Reports a change in window size. This is initiated on window resize on desktop or by orientation changes
        on mobile devices.
    **/
    static var window_resized(default, never) = new Message<RenderMessageWindowResized>("window_resized");
}

/**
    Data for the `RenderMessages.clear_color` message.
**/
typedef RenderMessageClearColor = {
    /**
        
        <span class="type">vector4</span> color to use as clear color
        
    **/
    var color:Vector4;
}

/**
    Data for the `RenderMessages.draw_line` message.
**/
typedef RenderMessageDrawLine = {
    /**
        
        <span class="type">vector3</span> start point of the line
        
    **/
    var start_point:Vector3;

    /**
        
        <span class="type">vector3</span> end point of the line
        
    **/
    var end_point:Vector3;

    /**
        
        <span class="type">vector4</span> color of the line
        
    **/
    var color:Vector4;
}

/**
    Data for the `RenderMessages.draw_text` message.
**/
typedef RenderMessageDrawText = {
    /**
        
        <span class="type">vector3</span> position of the text
        
    **/
    var position:Vector3;

    /**
        
        <span class="type">string</span> the text to draw
        
    **/
    var text:String;
}

/**
    Data for the `RenderMessages.window_resized` message.
**/
typedef RenderMessageWindowResized = {
    /**
        
        <span class="type">number</span> the new window height
        
    **/
    var height:Float;

    /**
        
        <span class="type">number</span> the new window width
        
    **/
    var width:Float;
}

@:native("_G.render")
extern class RenderVariables {
    /**
        .
    **/
    static var BLEND_CONSTANT_ALPHA(default, never):TODO;

    /**
        .
    **/
    static var BLEND_CONSTANT_COLOR(default, never):TODO;

    /**
        .
    **/
    static var BLEND_DST_ALPHA(default, never):TODO;

    /**
        .
    **/
    static var BLEND_DST_COLOR(default, never):TODO;

    /**
        .
    **/
    static var BLEND_ONE(default, never):TODO;

    /**
        .
    **/
    static var BLEND_ONE_MINUS_CONSTANT_ALPHA(default, never):TODO;

    /**
        .
    **/
    static var BLEND_ONE_MINUS_CONSTANT_COLOR(default, never):TODO;

    /**
        .
    **/
    static var BLEND_ONE_MINUS_DST_ALPHA(default, never):TODO;

    /**
        .
    **/
    static var BLEND_ONE_MINUS_DST_COLOR(default, never):TODO;

    /**
        .
    **/
    static var BLEND_ONE_MINUS_SRC_ALPHA(default, never):TODO;

    /**
        .
    **/
    static var BLEND_ONE_MINUS_SRC_COLOR(default, never):TODO;

    /**
        .
    **/
    static var BLEND_SRC_ALPHA(default, never):TODO;

    /**
        .
    **/
    static var BLEND_SRC_ALPHA_SATURATE(default, never):TODO;

    /**
        .
    **/
    static var BLEND_SRC_COLOR(default, never):TODO;

    /**
        .
    **/
    static var BLEND_ZERO(default, never):TODO;

    /**
        .
    **/
    static var BUFFER_COLOR_BIT(default, never):TODO;

    /**
        .
    **/
    static var BUFFER_DEPTH_BIT(default, never):TODO;

    /**
        .
    **/
    static var BUFFER_STENCIL_BIT(default, never):TODO;

    /**
        .
    **/
    static var COMPARE_FUNC_ALWAYS(default, never):TODO;

    /**
        .
    **/
    static var COMPARE_FUNC_EQUAL(default, never):TODO;

    /**
        .
    **/
    static var COMPARE_FUNC_GEQUAL(default, never):TODO;

    /**
        .
    **/
    static var COMPARE_FUNC_GREATER(default, never):TODO;

    /**
        .
    **/
    static var COMPARE_FUNC_LEQUAL(default, never):TODO;

    /**
        .
    **/
    static var COMPARE_FUNC_LESS(default, never):TODO;

    /**
        .
    **/
    static var COMPARE_FUNC_NEVER(default, never):TODO;

    /**
        .
    **/
    static var COMPARE_FUNC_NOTEQUAL(default, never):TODO;

    /**
        .
    **/
    static var FACE_BACK(default, never):TODO;

    /**
        .
    **/
    static var FACE_FRONT(default, never):TODO;

    /**
        .
    **/
    static var FACE_FRONT_AND_BACK(default, never):TODO;

    /**
        .
    **/
    static var FILTER_LINEAR(default, never):TODO;

    /**
        .
    **/
    static var FILTER_NEAREST(default, never):TODO;

    /**
        .
    **/
    static var FORMAT_DEPTH(default, never):TODO;

    /**
        .
    **/
    static var FORMAT_LUMINANCE(default, never):TODO;

    /**
        .
    **/
    static var FORMAT_RGB(default, never):TODO;

    /**
        .
    **/
    static var FORMAT_RGBA(default, never):TODO;

    /**
        .
    **/
    static var FORMAT_RGBA_DXT1(default, never):TODO;

    /**
        .
    **/
    static var FORMAT_RGBA_DXT3(default, never):TODO;

    /**
        .
    **/
    static var FORMAT_RGBA_DXT5(default, never):TODO;

    /**
        .
    **/
    static var FORMAT_RGB_DXT1(default, never):TODO;

    /**
        .
    **/
    static var FORMAT_STENCIL(default, never):TODO;

    /**
        .
    **/
    static var STATE_BLEND(default, never):TODO;

    /**
        .
    **/
    static var STATE_CULL_FACE(default, never):TODO;

    /**
        .
    **/
    static var STATE_DEPTH_TEST(default, never):TODO;

    /**
        .
    **/
    static var STATE_POLYGON_OFFSET_FILL(default, never):TODO;

    /**
        .
    **/
    static var STATE_STENCIL_TEST(default, never):TODO;

    /**
        .
    **/
    static var STENCIL_OP_DECR(default, never):TODO;

    /**
        .
    **/
    static var STENCIL_OP_DECR_WRAP(default, never):TODO;

    /**
        .
    **/
    static var STENCIL_OP_INCR(default, never):TODO;

    /**
        .
    **/
    static var STENCIL_OP_INCR_WRAP(default, never):TODO;

    /**
        .
    **/
    static var STENCIL_OP_INVERT(default, never):TODO;

    /**
        .
    **/
    static var STENCIL_OP_KEEP(default, never):TODO;

    /**
        .
    **/
    static var STENCIL_OP_REPLACE(default, never):TODO;

    /**
        .
    **/
    static var STENCIL_OP_ZERO(default, never):TODO;

    /**
        .
    **/
    static var WRAP_CLAMP_TO_BORDER(default, never):TODO;

    /**
        .
    **/
    static var WRAP_CLAMP_TO_EDGE(default, never):TODO;

    /**
        .
    **/
    static var WRAP_MIRRORED_REPEAT(default, never):TODO;

    /**
        .
    **/
    static var WRAP_REPEAT(default, never):TODO;
}
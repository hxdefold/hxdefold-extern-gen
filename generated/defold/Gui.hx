package defold;

/**
    <p>GUI core hooks, functions, messages, properties and constants for
    creation and manipulation of GUI nodes. The "gui" namespace is
    accessible only from gui scripts.</p>

    See `GuiMessages` for related messages.
    See `GuiVariables` for related variables.
**/
@:native("_G.gui")
extern class Gui {
    /**
        Called when a gui component is finalized.
        
        This is a callback-function, which is called by the engine when a gui component is finalized (destroyed). It can
        be used to e.g. take some last action, report the finalization to other game object instances
        or release user input focus (see `release_input_focus`). There is no use in starting any animations or similar
        from this function since the gui component is about to be destroyed.
        
        @param self 
        <span class="type">object</span> reference to the script state to be used for storing data
    **/
    static function final(self:TODO<"object">):Void;

    /**
        Animates a node property.
        
        This starts an animation of a node property according to the specified parameters.
        If the node property is already being animated, that animation will be canceled and
        replaced by the new one. Note however that several different node properties
        can be animated simultaneously. Use `gui.cancel_animation` to stop the animation
        before it has completed.
        
        Composite properties of type vector3, vector4 or quaternion
        also expose their sub-components (x, y, z and w).
        You can address the components individually by suffixing the name with a dot '.'
        and the name of the component.
        For instance, `"position.x"` (the position x coordinate) or `"color.w"`
        (the color alpha value).
        
        If a `complete_function` (Lua function) is specified, that function will be called
        when the animation has completed.
        By starting a new animation in that function, several animations can be sequenced
        together. See the examples below for more information.
        
        @param node 
        <span class="type">node</span> node to animate
        
        @param property 
        <span class="type">string | constant</span> property to animate
        
         * `"position"`
         * `"rotation"`
         * `"scale"`
         * `"color"`
         * `"outline"`
         * `"shadow"`
         * `"size"`
         * `"fill_angle"` (pie)
         * `"inner_radius"` (pie)
         * `"slice9"` (slice9)
        
        The following property constants are defined equaling the corresponding property string names.
        
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
        
        @param to 
        <span class="type">vector3 | vector4</span> target property value
        
        @param easing 
        <span class="type">constant | vector</span> easing to use during animation.
             Either specify one of the `gui.EASING_*` constants or provide a
             <span class="type">vector</span> with a custom curve. See the `animation guide` for more information.
        
        @param duration 
        <span class="type">number</span> duration of the animation in seconds.
        
        @param delay 
        <span class="type">number</span> delay before the animation starts in seconds.
        
        @param complete_function 
        <span class="type">function(self, node)</span> function to call when the
             animation has completed
        
        @param playback 
        <span class="type">constant</span> playback mode
        
         * `gui.PLAYBACK_ONCE_FORWARD`
         * `gui.PLAYBACK_ONCE_BACKWARD`
         * `gui.PLAYBACK_ONCE_PINGPONG`
         * `gui.PLAYBACK_LOOP_FORWARD`
         * `gui.PLAYBACK_LOOP_BACKWARD`
         * `gui.PLAYBACK_LOOP_PINGPONG`
    **/
    static function animate(node:TODO<"node">, property:EitherType<TODO<"constant">, String>, to:EitherType<Vector4, Vector3>, easing:EitherType<Vector, TODO<"constant">>, duration:Float, ?delay:Float, ?complete_function:TODO<"function(self, node)">, ?playback:TODO<"constant">):Void;

    /**
        Cancels an ongoing animation.
        
        If an animation of the specified node is currently running (started by `gui.animate`), it will immediately be canceled.
        
        @param node 
        <span class="type">node</span> node that should have its animation canceled
        
        @param property 
        <span class="type">string | constant</span> property for which the animation should be canceled
        
         * `"position"`
         * `"rotation"`
         * `"scale"`
         * `"color"`
         * `"outline"`
         * `"shadow"`
         * `"size"`
         * `"fill_angle"` (pie)
         * `"inner_radius"` (pie)
         * `"slice9"` (slice9)
    **/
    static function cancel_animation(node:TODO<"node">, property:EitherType<TODO<"constant">, String>):Void;

    /**
        Cancel a node flipbook animation.
        
        Cancels any running flipbook animation on the specified node.
        
        @param node 
        <span class="type">node</span> node cancel flipbook animation for
    **/
    static function cancel_flipbook(node:TODO<"node">):Void;

    /**
        Cancel a spine animation.
        
        @param node 
        <span class="type">node</span> spine node that should cancel its animation
    **/
    static function cancel_spine(node:TODO<"node">):Void;

    /**
        Clone a node.
        
        Make a clone instance of a node.
        This function does not clone the supplied node's children nodes.
        Use gui.clone_tree for that purpose.
        
        @param node 
        <span class="type">node</span> node to clone
        
        @return clone 
        <span class="type">node</span> the cloned node
    **/
    static function clone(node:TODO<"node">):TODO;

    /**
        Clone a node including its children.
        
        Make a clone instance of a node and all its children.
        Use gui.clone to clone a node excluding its children.
        
        @param node 
        <span class="type">node</span> root node to clone
        
        @return clones 
        <span class="type">table</span> a table mapping node ids to the corresponding cloned nodes
    **/
    static function clone_tree(node:TODO<"node">):TODO;

    /**
        Deletes a node.
        
        Deletes the specified node. Any child nodes of the specified node will be
        recursively deleted.
        
        @param node 
        <span class="type">node</span> node to delete
    **/
    static function delete_node(node:TODO<"node">):Void;

    /**
        Delete texture.
        
        Delete a dynamically created texture.
        
        @param texture 
        <span class="type">string | hash</span> texture id
    **/
    static function delete_texture(texture:EitherType<Hash, String>):Void;

    /**
        Gets the node adjust mode.
        
        Returns the adjust mode of a node.
        The adjust mode defines how the node will adjust itself to screen
        resolutions that differs from the one in the project settings.
        
        @param node 
        <span class="type">node</span> node from which to get the adjust mode (node)
        
        @return adjust_mode 
        <span class="type">constant</span> the current adjust mode
        
         * `gui.ADJUST_FIT`
         * `gui.ADJUST_ZOOM`
         * `gui.ADJUST_STRETCH`
    **/
    static function get_adjust_mode(node:TODO<"node">):TODO;

    /**
        Gets the node blend mode.
        
        Returns the blend mode of a node.
        Blend mode defines how the node will be blended with the background.
        
        @param node 
        <span class="type">node</span> node from which to get the blend mode
        
        @return blend_mode 
        <span class="type">constant</span> blend mode
        
         * `gui.BLEND_ALPHA`
         * `gui.BLEND_ADD`
         * `gui.BLEND_ADD_ALPHA`
         * `gui.BLEND_MULT`
    **/
    static function get_blend_mode(node:TODO<"node">):TODO;

    /**
        Gets node clipping inverted state.
        
        If node is set as an inverted clipping node, it will clip anything inside as opposed to outside.
        
        @param node 
        <span class="type">node</span> node from which to get the clipping inverted state
        
        @return inverted 
        <span class="type">boolean</span> true or false
    **/
    static function get_clipping_inverted(node:TODO<"node">):TODO;

    /**
        Gets the node clipping mode.
        
        Clipping mode defines how the node will clipping it's children nodes
        
        @param node 
        <span class="type">node</span> node from which to get the clipping mode
        
        @return clipping_mode 
        <span class="type">constant</span> clipping mode
        
           * `gui.CLIPPING_MODE_NONE`
           * `gui.CLIPPING_MODE_STENCIL`
    **/
    static function get_clipping_mode(node:TODO<"node">):TODO;

    /**
        Gets node clipping visibility state.
        
        If node is set as visible clipping node, it will be shown as well as clipping. Otherwise, it will only clip but not show visually.
        
        @param node 
        <span class="type">node</span> node from which to get the clipping visibility state
        
        @return visible 
        <span class="type">boolean</span> true or false
    **/
    static function get_clipping_visible(node:TODO<"node">):TODO;

    /**
        Gets the node color.
        
        Returns the color of the supplied node. The components
        of the returned vector4 contains the color channel values:
        
        <table>
        <thead>
        <tr>
        <th>Component</th>
        <th>Color value</th>
        </tr>
        </thead>
        <tbody>
        <tr>
        <td>x</td>
        <td>Red value</td>
        </tr>
        <tr>
        <td>y</td>
        <td>Green value</td>
        </tr>
        <tr>
        <td>z</td>
        <td>Blue value</td>
        </tr>
        <tr>
        <td>w</td>
        <td>Alpha value</td>
        </tr>
        </tbody>
        </table>
        
        @param node 
        <span class="type">node</span> node to get the color from
        
        @return color 
        <span class="type">vector4</span> node color
    **/
    static function get_color(node:TODO<"node">):TODO;

    /**
        Gets the angle for the filled pie sector.
        
        Returns the sector angle of a pie node.
        
        @param node 
        <span class="type">node</span> node from which to get the fill angle
        
        @return angle 
        <span class="type">number</span> sector angle
    **/
    static function get_fill_angle(node:TODO<"node">):TODO;

    /**
        Gets the node flipbook animation.
        
        Get node flipbook animation.
        
        @param node 
        <span class="type">node</span> node to get flipbook animation from
        
        @return animation 
        <span class="type">hash</span> animation id
    **/
    static function get_flipbook(node:TODO<"node">):TODO;

    /**
        Gets the node font.
        
        This is only useful for text nodes. The font must be mapped to the gui scene in the gui editor.
        
        @param node 
        <span class="type">node</span> node from which to get the font
        
        @return font 
        <span class="type">hash</span> font id
    **/
    static function get_font(node:TODO<"node">):TODO;

    /**
        Gets the scene height.
        
        Returns the scene height.
        
        @return height 
        <span class="type">number</span> scene height
    **/
    static function get_height():TODO;

    /**
        Gets the id of the specified node.
        
        Retrieves the id of the specified node.
        
        @param node 
        <span class="type">node</span> the node to retrieve the id from
        
        @return id 
        <span class="type">hash</span> the id of the node
    **/
    static function get_id(node:TODO<"node">):TODO;

    /**
        Gets the index of the specified node.
        
        Retrieve the index of the specified node.
        The index defines the order in which a node appear in a GUI scene.
        Higher index means the node is drawn on top of lower indexed nodes.
        
        @param node 
        <span class="type">node</span> the node to retrieve the id from
        
        @return index 
        <span class="type">number</span> the index of the node
    **/
    static function get_index(node:TODO<"node">):TODO;

    /**
        Gets the node inherit alpha state.
        
        @param node 
        <span class="type">node</span> node from which to get the inherit alpha state
    **/
    static function get_inherit_alpha(node:TODO<"node">):Void;

    /**
        Gets the pie inner radius.
        
        Returns the inner radius of a pie node.
        The radius is defined along the x-axis.
        
        @param node 
        <span class="type">node</span> node from where to get the inner radius
        
        @return radius 
        <span class="type">number</span> inner radius
    **/
    static function get_inner_radius(node:TODO<"node">):TODO;

    /**
        Gets the node layer.
        
        The layer must be mapped to the gui scene in the gui editor.
        
        @param node 
        <span class="type">node</span> node from which to get the layer
        
        @return layer 
        <span class="type">hash</span> layer id
    **/
    static function get_layer(node:TODO<"node">):TODO;

    /**
        Gets the scene current layout.
        
        @return layout 
        <span class="type">hash</span> layout id
    **/
    static function get_layout():TODO;

    /**
        Gets the leading of the text node.
        
        Returns the leading value for a text node.
        
        @param node 
        <span class="type">node</span> node from where to get the leading
        
        @return leading 
        <span class="type">number</span> leading scaling value (default=1)
    **/
    static function get_leading(node:TODO<"node">):TODO;

    /**
        Get line-break mode.
        
        Returns whether a text node is in line-break mode or not.
        This is only useful for text nodes.
        
        @param node 
        <span class="type">node</span> node from which to get the line-break for
        
        @return line_break 
        <span class="type">boolean</span> `true` or `false`
    **/
    static function get_line_break(node:TODO<"node">):TODO;

    /**
        Gets the node with the specified id.
        
        Retrieves the node with the specified id.
        
        @param id 
        <span class="type">string | hash</span> id of the node to retrieve
        
        @return instance 
        <span class="type">node</span> a new node instance
    **/
    static function get_node(id:EitherType<Hash, String>):TODO;

    /**
        Gets the pie outer bounds mode.
        
        Returns the outer bounds mode for a pie node.
        
        @param node 
        <span class="type">node</span> node from where to get the outer bounds mode
        
        @return bounds_mode 
        <span class="type">constant</span> the outer bounds mode of the pie node:
        
         * `gui.PIEBOUNDS_RECTANGLE`
         * `gui.PIEBOUNDS_ELLIPSE`
    **/
    static function get_outer_bounds(node:TODO<"node">):TODO;

    /**
        Gets the node outline color.
        
        Returns the outline color of the supplied node.
        See `gui.get_color` for info how vectors encode color values.
        
        @param node 
        <span class="type">node</span> node to get the outline color from
        
        @return color 
        <span class="type">vector4</span> outline color
    **/
    static function get_outline(node:TODO<"node">):TODO;

    /**
        Gets the parent of the specified node.
        
        Returns the parent node of the specified node.
        If the supplied node does not have a parent, `nil` is returned.
        
        @param node 
        <span class="type">node</span> the node from which to retrieve its parent
        
        @return parent 
        <span class="type">node</span> parent instance or nil
    **/
    static function get_parent(node:TODO<"node">):TODO;

    /**
        Gets a particle fx.
        
        Get the paricle fx for a gui node
        
        @param node 
        <span class="type">node</span> node to get particle fx for
        
        @return [type:hash] 
        particle fx id
    **/
    static function get_particlefx(node:TODO<"node">):TODO;

    /**
        Gets the number of generated vertices around the perimeter.
        
        Returns the number of generated vertices around the perimeter
        of a pie node.
        
        @param node 
        <span class="type">node</span> pie node
        
        @return vertices 
        <span class="type">number</span> vertex count
    **/
    static function get_perimeter_vertices(node:TODO<"node">):TODO;

    /**
        Gets the pivot of a node.
        
        The pivot specifies how the node is drawn and rotated from its position.
        
        @param node 
        <span class="type">node</span> node to get pivot from
        
        @return pivot 
        <span class="type">constant</span> pivot constant
        
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
    static function get_pivot(node:TODO<"node">):TODO;

    /**
        Gets the node position.
        
        Returns the position of the supplied node.
        
        @param node 
        <span class="type">node</span> node to get the position from
        
        @return position 
        <span class="type">vector3</span> node position
    **/
    static function get_position(node:TODO<"node">):TODO;

    /**
        Gets the node rotation.
        
        Returns the rotation of the supplied node.
        The rotation is expressed in degree Euler angles.
        
        @param node 
        <span class="type">node</span> node to get the rotation from
        
        @return rotation 
        <span class="type">vector3</span> node rotation
    **/
    static function get_rotation(node:TODO<"node">):TODO;

    /**
        Gets the node scale.
        
        Returns the scale of the supplied node.
        
        @param node 
        <span class="type">node</span> node to get the scale from
        
        @return scale 
        <span class="type">vector3</span> node scale
    **/
    static function get_scale(node:TODO<"node">):TODO;

    /**
        Gets the node screen position.
        
        Returns the screen position of the supplied node. This function returns the
        calculated transformed position of the node, taking into account any parent node
        transforms.
        
        @param node 
        <span class="type">node</span> node to get the screen position from
        
        @return position 
        <span class="type">vector3</span> node screen position
    **/
    static function get_screen_position(node:TODO<"node">):TODO;

    /**
        Gets the node shadow color.
        
        Returns the shadow color of the supplied node.
        See `gui.get_color` for info how vectors encode color values.
        
        @param node 
        <span class="type">node</span> node to get the shadow color from
        
        @return color 
        <span class="type">vector4</span> node shadow color
    **/
    static function get_shadow(node:TODO<"node">):TODO;

    /**
        Gets the node size.
        
        Returns the size of the supplied node.
        
        @param node 
        <span class="type">node</span> node to get the size from
        
        @return size 
        <span class="type">vector3</span> node size
    **/
    static function get_size(node:TODO<"node">):TODO;

    /**
        Gets the node size mode.
        
        Returns the size of a node.
        The size mode defines how the node will adjust itself in size. Automatic
        size mode alters the node size based on the node's content.
        
        @param node 
        <span class="type">node</span> node from which to get the size mode (node)
        
        @return size_mode 
        <span class="type">constant</span> the current size mode
        
         * `gui.SIZE_MODE_MANUAL`
         * `gui.SIZE_MODE_AUTO`
    **/
    static function get_size_mode(node:TODO<"node">):TODO;

    /**
        Get the slice9 values for the node.
        
        Returns the slice9 configuration values for the node.
        
        @param node 
        <span class="type">node</span> node to manipulate
        
        @return values 
        <span class="type">vector4</span> configuration values
    **/
    static function get_slice9(node:TODO<"node">):TODO;

    /**
        Gets the playing animation on a spine node.
        
        Gets the playing animation on a spine node
        
        @param node 
        <span class="type">node</span> node to get spine skin from
        
        @return id 
        <span class="type">hash</span> spine animation id, 0 if no animation is playing
    **/
    static function get_spine_animation(node:TODO<"node">):TODO;

    /**
        Retrieve the GUI node corresponding to a spine skeleton bone.
        
        The returned node can be used for parenting and transform queries.
        This function has complexity O(n), where n is the number of bones in the spine model skeleton.
        
        @param node 
        <span class="type">node</span> spine node to query for bone node
        
        @param bone_id 
        <span class="type">string | hash</span> id of the corresponding bone
        
        @return bone 
        <span class="type">node</span> node corresponding to the spine bone
    **/
    static function get_spine_bone(node:TODO<"node">, bone_id:EitherType<Hash, String>):TODO;

    /**
        Gets the normalized cursor of the animation on a spine node.
        
        This is only useful for spine nodes. Gets the normalized cursor of the animation on a spine node.
        
        @param node 
        spine node to set the cursor for (node)
        
        @return cursor 
        value <span class="type">number</span> cursor value
    **/
    static function get_spine_cursor(node:TODO):TODO;

    /**
        Gets the playback rate of the animation on a spine node.
        
        This is only useful for spine nodes. Gets the playback rate of the animation on a spine node.
        
        @param node 
        <span class="type">node</span> spine node to set the cursor for
        
        @return rate 
        <span class="type">number</span> playback rate
    **/
    static function get_spine_playback_rate(node:TODO<"node">):TODO;

    /**
        Gets the spine scene of a node.
        
        Returns the spine scene id of the supplied node.
        This is currently only useful for spine nodes.
        The returned spine scene must be mapped to the gui scene in the gui editor.
        
        @param node 
        <span class="type">node</span> node to get texture from
        
        @return spine_scene 
        <span class="type">hash</span> spine scene id
    **/
    static function get_spine_scene(node:TODO<"node">):TODO;

    /**
        Gets the skin of a spine node.
        
        Gets the spine skin of a spine node
        
        @param node 
        <span class="type">node</span> node to get spine skin from
        
        @return id 
        <span class="type">hash</span> spine skin id, 0 if no explicit skin is set
    **/
    static function get_spine_skin(node:TODO<"node">):TODO;

    /**
        Gets the node text.
        
        Returns the text value of a text node. This is only useful for text nodes.
        
        @param node 
        <span class="type">node</span> node from which to get the text
        
        @return text 
        <span class="type">string</span> text value
    **/
    static function get_text(node:TODO<"node">):TODO;

    /**
        Get text metrics.
        
        Get text metrics given the provided font, text and parameters.
        
        @param font 
        <span class="type">string | hash</span> font id
        
        @param text 
        <span class="type">string</span> text to measure
        
        @param width 
        <span class="type">number</span> max-width. Use for line-breaks (default=FLT_MAX)
        
        @param line_break 
        <span class="type">boolean</span> true to break lines accordingly to width (default=false)
        
        @param leading 
        <span class="type">number</span> scale value for line spacing (default=1)
        
        @param tracking 
        <span class="type">number</span> scale value for letter spacing (default=0)
        
        @return metrics 
        <span class="type">table</span> a table with the following fields:
        
         * width
         * height
         * max_ascent
         * max_descent
    **/
    static function get_text_metrics(font:EitherType<Hash, String>, text:String, width:Float, line_break:TODO<"boolean">, leading:Float, tracking:Float):TODO;

    /**
        Get text metrics from node.
        
        Get the text metrics from a text node.
        
        @param node 
        <span class="type">node</span> text node to measure text from
        
        @return metrics 
        <span class="type">table</span> a table with the following fields:
        
         * width
         * height
         * max_ascent
         * max_descent
    **/
    static function get_text_metrics_from_node(node:TODO<"node">):TODO;

    /**
        Gets node texture.
        
        Returns the texture of a node.
        This is currently only useful for box or pie nodes.
        The texture must be mapped to the gui scene in the gui editor.
        
        @param node 
        <span class="type">node</span> node to get texture from
        
        @return texture 
        <span class="type">hash</span> texture id
    **/
    static function get_texture(node:TODO<"node">):TODO;

    /**
        Gets the tracking of the text node.
        
        Returns the tracking value of a text node.
        
        @param node 
        <span class="type">node</span> node from where to get the tracking
        
        @return tracking 
        <span class="type">number</span> tracking scaling number (default=0)
    **/
    static function get_tracking(node:TODO<"node">):TODO;

    /**
        Gets the scene width.
        
        Returns the scene width.
        
        @return width 
        <span class="type">number</span> scene width
    **/
    static function get_width():TODO;

    /**
        Gets the x-anchor of a node.
        
        The x-anchor specifies how the node is moved when the game is run in a different resolution.
        
        @param node 
        <span class="type">node</span> node to get x-anchor from
        
        @return anchor 
        <span class="type">constant</span> anchor constant
        
         * `gui.ANCHOR_NONE`
         * `gui.ANCHOR_LEFT`
         * `gui.ANCHOR_RIGHT`
    **/
    static function get_xanchor(node:TODO<"node">):TODO;

    /**
        Gets the y-anchor of a node.
        
        The y-anchor specifies how the node is moved when the game is run in a different resolution.
        
        @param node 
        <span class="type">node</span> node to get y-anchor from
        
        @return anchor 
        <span class="type">constant</span> anchor constant
        
         * `gui.ANCHOR_NONE`
         * `gui.ANCHOR_TOP`
         * `gui.ANCHOR_BOTTOM`
    **/
    static function get_yanchor(node:TODO<"node">):TODO;

    /**
        Hides on-display keyboard if available.
        
        Hides the on-display touch keyboard on the device.
    **/
    static function hide_keyboard():Void;

    /**
        Returns if a node is enabled or not.
        
        Returns `true` if a node is enabled and `false` if it's not.
        Disabled nodes are not rendered and animations acting on them are not evaluated.
        
        @param node 
        <span class="type">node</span> node to query
        
        @return enabled 
        <span class="type">boolean</span> whether the node is enabled or not
    **/
    static function is_enabled(node:TODO<"node">):TODO;

    /**
        Moves the first node above the second.
        
        Alters the ordering of the two supplied nodes by moving the first node
        above the second.
        If the second argument is `nil` the first node is moved to the top.
        
        @param node 
        <span class="type">node</span> to move
        
        @param node 
        <span class="type">node | nil</span> reference node above which the first node should be moved
    **/
    static function move_above(node:TODO<"node">, node:EitherType<TODO<"nil">, TODO<"node">>):Void;

    /**
        Moves the first node below the second.
        
        Alters the ordering of the two supplied nodes by moving the first node
        below the second.
        If the second argument is `nil` the first node is moved to the bottom.
        
        @param node 
        <span class="type">node</span> to move
        
        @param node 
        <span class="type">node | nil</span> reference node below which the first node should be moved
    **/
    static function move_below(node:TODO<"node">, node:EitherType<TODO<"nil">, TODO<"node">>):Void;

    /**
        Creates a new box node.
        
        Dynamically create a new box node.
        
        @param pos 
        <span class="type">vector3 | vector4</span> node position
        
        @param size 
        <span class="type">vector3</span> node size
        
        @return node 
        <span class="type">node</span> new box node
    **/
    static function new_box_node(pos:EitherType<Vector4, Vector3>, size:Vector3):TODO;

    /**
        Creates a new particle fx node.
        
        Dynamically create a particle fx node.
        
        @param pos 
        <span class="type">vector3 | vector4</span> node position
        
        @param particlefx 
        <span class="type">hash | string</span> particle fx resource name
        
        @return node 
        <span class="type">node</span> new particle fx node
    **/
    static function new_particlefx_node(pos:EitherType<Vector4, Vector3>, particlefx:EitherType<String, Hash>):TODO;

    /**
        Creates a new pie node.
        
        Dynamically create a new pie node.
        
        @param pos 
        <span class="type">vector3 | vector4</span> node position
        
        @param size 
        <span class="type">vector3</span> node size
        
        @return node 
        <span class="type">node</span> new box node
    **/
    static function new_pie_node(pos:EitherType<Vector4, Vector3>, size:Vector3):TODO;

    /**
        Creates a new spine node.
        
        Dynamically create a new spine node.
        
        @param pos 
        <span class="type">vector3 | vector4</span> node position
        
        @param spine_scene 
        <span class="type">string | hash</span> spine scene id
        
        @return node 
        <span class="type">node</span> new spine node
    **/
    static function new_spine_node(pos:EitherType<Vector4, Vector3>, spine_scene:EitherType<Hash, String>):TODO;

    /**
        Creates a new text node.
        
        Dynamically create a new text node.
        
        @param pos 
        <span class="type">vector3 | vector4</span> node position
        
        @param text 
        <span class="type">string</span> node text
        
        @return node 
        <span class="type">node</span> new text node
    **/
    static function new_text_node(pos:EitherType<Vector4, Vector3>, text:String):TODO;

    /**
        Create new texture.
        
        Dynamically create a new texture.
        
        @param texture 
        <span class="type">string | hash</span> texture id
        
        @param width 
        <span class="type">number</span> texture width
        
        @param height 
        <span class="type">number</span> texture height
        
        @param type 
        <span class="type">string | constant</span> texture type
        
         * `"rgb"` - RGB
         * `"rgba"` - RGBA
         * `"l"` - LUMINANCE
        
        @param buffer 
        <span class="type">string</span> texture data
        
        @param flip 
        <span class="type">boolean</span> flip texture vertically
        
        @return success 
        <span class="type">boolean</span> texture creation was successful
    **/
    static function new_texture(texture:EitherType<Hash, String>, width:Float, height:Float, type:EitherType<TODO<"constant">, String>, buffer:String, flip:TODO<"boolean">):TODO;

    /**
        Determines if the node is pickable by the supplied coordinates.
        
        Tests whether a coordinate is within the bounding box of a
        node.
        
        @param node 
        <span class="type">node</span> node to be tested for picking
        
        @param x 
        <span class="type">number</span> x-coordinate (see `on_input` )
        
        @param y 
        <span class="type">number</span> y-coordinate (see `on_input` )
        
        @return pickable 
        <span class="type">boolean</span> pick result
    **/
    static function pick_node(node:TODO<"node">, x:Float, y:Float):TODO;

    /**
        Play node flipbook animation.
        
        Play flipbook animation on a box or pie node.
        The current node texture must contain the animation.
        Use this function to set one-frame still images on the node.
        
        @param node 
        <span class="type">node</span> node to set animation for
        
        @param animation 
        <span class="type">string | hash</span> animation id
        
        @param complete_function 
        <span class="type">function(self, node)</span> optional function to call when the animation has completed
        
        <dl>
        <dt>`self`</dt>
        <dd>
        
        <span class="type">object</span> The current object.
        
        </dd>
        <dt>`node`</dt>
        <dd>
        
        <span class="type">node</span> The node that is animated.
        
        </dd>
        </dl>
    **/
    static function play_flipbook(node:TODO<"node">, animation:EitherType<Hash, String>, ?complete_function:TODO<"function(self, node)">):Void;

    /**
        Plays a particle fx.
        
        Plays the paricle fx for a gui node
        
        @param node 
        <span class="type">node</span> node to play particle fx for
        
        @param emitter_state_function 
        <span class="type">function(self, node, emitter, state)</span> optional callback function that will be called when an emitter attached to this particlefx changes state.
        
        <dl>
        <dt>`self`</dt>
        <dd><span class="type">object</span> The current object</dd>
        <dt>`id`</dt>
        <dd><span class="type">hash</span> The id of the particle fx component</dd>
        <dt>`emitter`</dt>
        <dd><span class="type">hash</span> The id of the emitter</dd>
        <dt>`state`</dt>
        <dd><span class="type">constant</span> the new state of the emitter:</dd>
        </dl>
        
         * `particlefx.EMITTER_STATE_SLEEPING`
         * `particlefx.EMITTER_STATE_PRESPAWN`
         * `particlefx.EMITTER_STATE_SPAWNING`
         * `particlefx.EMITTER_STATE_POSTSPAWN`
    **/
    static function play_particlefx(node:TODO<"node">, ?emitter_state_function:TODO<"function(self, node, emitter, state)">):Void;

    /**
        Play a spine animation.
        
        Starts a spine animation.
        
        @param node 
        <span class="type">node</span> spine node that should play the animation
        
        @param animation_id 
        <span class="type">string | hash</span> id of the animation to play
        
        @param playback 
        <span class="type">constant</span> playback mode
        
         * `gui.PLAYBACK_ONCE_FORWARD`
         * `gui.PLAYBACK_ONCE_BACKWARD`
         * `gui.PLAYBACK_ONCE_PINGPONG`
         * `gui.PLAYBACK_LOOP_FORWARD`
         * `gui.PLAYBACK_LOOP_BACKWARD`
         * `gui.PLAYBACK_LOOP_PINGPONG`
        
        @param play_properties 
        <span class="type">table</span> optional table with properties
        
        <dl>
        <dt>`blend_duration`</dt>
        <dd><span class="type">number</span> The duration of a linear blend between the current and new animation</dd>
        <dt>`offset`</dt>
        <dd><span class="type">number</span> The normalized initial value of the animation cursor when the animation starts playing</dd>
        <dt>`playback_rate`</dt>
        <dd><span class="type">number</span> The rate with which the animation will be played. Must be positive</dd>
        </dl>
        @param complete_function 
        <span class="type">function(self, node)</span> function to call when the animation has completed
    **/
    static function play_spine_anim(node:TODO<"node">, animation_id:EitherType<Hash, String>, playback:TODO<"constant">, ?play_properties:TODO<"table">, ?complete_function:TODO<"function(self, node)">):Void;

    /**
        Resets on-display keyboard if available.
        
        Resets the input context of keyboard. This will clear marked text.
    **/
    static function reset_keyboard():Void;

    /**
        Resets all nodes to initial state.
        
        Resets all nodes in the current GUI scene to their initial state.
        The reset only applies to static node loaded from the scene.
        Nodes that are created dynamically from script are not affected.
    **/
    static function reset_nodes():Void;

    /**
        Sets node adjust mode.
        
        Sets the adjust mode on a node.
        The adjust mode defines how the node will adjust itself to screen
        resolutions that differs from the one in the project settings.
        
        @param node 
        <span class="type">node</span> node to set adjust mode for
        
        @param adjust_mode 
        <span class="type">constant</span> adjust mode to set
        
         * `gui.ADJUST_FIT`
         * `gui.ADJUST_ZOOM`
         * `gui.ADJUST_STRETCH`
    **/
    static function set_adjust_mode(node:TODO<"node">, adjust_mode:TODO<"constant">):Void;

    /**
        Sets node blend mode.
        
        Set the blend mode of a node.
        Blend mode defines how the node will be blended with the background.
        
        @param node 
        <span class="type">node</span> node to set blend mode for
        
        @param blend_mode 
        <span class="type">constant</span> blend mode to set
        
         * `gui.BLEND_ALPHA`
         * `gui.BLEND_ADD`
         * `gui.BLEND_ADD_ALPHA`
         * `gui.BLEND_MULT`
    **/
    static function set_blend_mode(node:TODO<"node">, blend_mode:TODO<"constant">):Void;

    /**
        Sets node clipping inversion.
        
        If node is set as an inverted clipping node, it will clip anything inside as opposed to outside.
        
        @param node 
        <span class="type">node</span> node to set clipping inverted state for
        
        @param inverted 
        <span class="type">boolean</span> true or false
    **/
    static function set_clipping_inverted(node:TODO<"node">, inverted:TODO<"boolean">):Void;

    /**
        Sets node clipping mode state.
        
        Clipping mode defines how the node will clipping it's children nodes
        
        @param node 
        <span class="type">node</span> node to set clipping mode for
        
        @param clipping_mode 
        <span class="type">constant</span> clipping mode to set
        
           * `gui.CLIPPING_MODE_NONE`
           * `gui.CLIPPING_MODE_STENCIL`
    **/
    static function set_clipping_mode(node:TODO<"node">, clipping_mode:TODO<"constant">):Void;

    /**
        Sets node clipping visibility.
        
        If node is set as an visible clipping node, it will be shown as well as clipping. Otherwise, it will only clip but not show visually.
        
        @param node 
        <span class="type">node</span> node to set clipping visibility for
        
        @param visible 
        <span class="type">boolean</span> true or false
    **/
    static function set_clipping_visible(node:TODO<"node">, visible:TODO<"boolean">):Void;

    /**
        Sets the node color.
        
        Sets the color of the supplied node. The components
        of the supplied vector3 or vector4 should contain the color channel values:
        
        <table>
        <thead>
        <tr>
        <th>Component</th>
        <th>Color value</th>
        </tr>
        </thead>
        <tbody>
        <tr>
        <td>x</td>
        <td>Red value</td>
        </tr>
        <tr>
        <td>y</td>
        <td>Green value</td>
        </tr>
        <tr>
        <td>z</td>
        <td>Blue value</td>
        </tr>
        <tr>
        <td>w <span class="type">vector4</span></td>
        <td>Alpha value</td>
        </tr>
        </tbody>
        </table>
        
        @param node 
        <span class="type">node</span> node to set the color for
        
        @param color 
        <span class="type">vector3 | vector4</span> new color
    **/
    static function set_color(node:TODO<"node">, color:EitherType<Vector4, Vector3>):Void;

    /**
        Enables/disables a node.
        
        Sets a node to the disabled or enabled state.
        Disabled nodes are not rendered and animations acting on them are not evaluated.
        
        @param node 
        <span class="type">node</span> node to be enabled/disabled
        
        @param enabled 
        <span class="type">boolean</span> whether the node should be enabled or not
    **/
    static function set_enabled(node:TODO<"node">, enabled:TODO<"boolean">):Void;

    /**
        Sets the angle for the filled pie sector.
        
        Set the sector angle of a pie node.
        
        @param node 
        <span class="type">node</span> node to set the fill angle for
        
        @param angle 
        <span class="type">number</span> sector angle
    **/
    static function set_fill_angle(node:TODO<"node">, angle:Float):Void;

    /**
        Sets the node font.
        
        This is only useful for text nodes.
        The font must be mapped to the gui scene in the gui editor.
        
        @param node 
        <span class="type">node</span> node for which to set the font
        
        @param font 
        <span class="type">string | hash</span> font id
    **/
    static function set_font(node:TODO<"node">, font:EitherType<Hash, String>):Void;

    /**
        Sets the id of the specified node.
        
        Set the id of the specicied node to a new value.
        Nodes created with the gui.new_*_node() functions get
        an empty id. This function allows you to give dynamically
        created nodes an id.
        
        <span class="icon-attention"></span> No checking is done on the uniqueness of supplied ids.
        It is up to you to make sure you use unique ids.
        
        @param node 
        <span class="type">node</span> node to set the id for
        
        @param id 
        <span class="type">string | hash</span> id to set
    **/
    static function set_id(node:TODO<"node">, id:EitherType<Hash, String>):Void;

    /**
        Sets the node inherit alpha state.
        
        @param node 
        <span class="type">node</span> node from which to set the inherit alpha state
        
        @param inherit_alpha 
        <span class="type">boolean</span> true or false
    **/
    static function set_inherit_alpha(node:TODO<"node">, inherit_alpha:TODO<"boolean">):Void;

    /**
        Sets the pie inner radius.
        
        Sets the inner radius of a pie node.
        The radius is defined along the x-axis.
        
        @param node 
        <span class="type">node</span> node to set the inner radius for
        
        @param radius 
        <span class="type">number</span> inner radius
    **/
    static function set_inner_radius(node:TODO<"node">, radius:Float):Void;

    /**
        Sets the node layer.
        
        The layer must be mapped to the gui scene in the gui editor.
        
        @param node 
        <span class="type">node</span> node for which to set the layer
        
        @param layer 
        <span class="type">string | hash</span> layer id
    **/
    static function set_layer(node:TODO<"node">, layer:EitherType<Hash, String>):Void;

    /**
        Sets the leading of the text node.
        
        Sets the leading value for a text node. This value is used to
        scale the line spacing of text.
        
        @param node 
        <span class="type">node</span> node for which to set the leading
        
        @param leading 
        <span class="type">number</span> a scaling value for the line spacing (default=1)
    **/
    static function set_leading(node:TODO<"node">, leading:Float):Void;

    /**
        Set line-break mode.
        
        Sets the line-break mode on a text node.
        This is only useful for text nodes.
        
        @param node 
        <span class="type">node</span> node to set line-break for
        
        @param line_break 
        <span class="type">boolean</span> true or false
    **/
    static function set_line_break(node:TODO<"node">, line_break:TODO<"boolean">):Void;

    /**
        Sets the pie node outer bounds mode.
        
        Sets the outer bounds mode for a pie node.
        
        @param node 
        <span class="type">node</span> node for which to set the outer bounds mode
        
        @param bounds_mode 
        <span class="type">constant</span> the outer bounds mode of the pie node:
        
         * `gui.PIEBOUNDS_RECTANGLE`
         * `gui.PIEBOUNDS_ELLIPSE`
    **/
    static function set_outer_bounds(node:TODO<"node">, bounds_mode:TODO<"constant">):Void;

    /**
        Sets the node outline color.
        
        Sets the outline color of the supplied node.
        See `gui.set_color` for info how vectors encode color values.
        
        @param node 
        <span class="type">node</span> node to set the outline color for
        
        @param color 
        <span class="type">vector3 | vector4</span> new outline color
    **/
    static function set_outline(node:TODO<"node">, color:EitherType<Vector4, Vector3>):Void;

    /**
        Sets the parent of the node.
        
        Sets the parent node of the specified node.
        
        @param node 
        <span class="type">node</span> node for which to set its parent
        
        @param parent 
        <span class="type">node</span> parent node to set
        
        @param keep_scene_transform 
        <span class="type">boolean</span> optional flag to make the scene position being perserved
    **/
    static function set_parent(node:TODO<"node">, parent:TODO<"node">, keep_scene_transform:TODO<"boolean">):Void;

    /**
        Sets a particle fx.
        
        Set the paricle fx for a gui node
        
        @param node 
        <span class="type">node</span> node to set particle fx for
        
        @param particlefx 
        <span class="type">hash | string</span> particle fx id
    **/
    static function set_particlefx(node:TODO<"node">, particlefx:EitherType<String, Hash>):Void;

    /**
        Sets the number of generated vertices around the perimeter.
        
        Sets the number of generated vertices around the perimeter of a pie node.
        
        @param node 
        <span class="type">node</span> pie node
        
        @param vertices 
        <span class="type">number</span> vertex count
    **/
    static function set_perimeter_vertices(node:TODO<"node">, vertices:Float):Void;

    /**
        Sets the pivot of a node.
        
        The pivot specifies how the node is drawn and rotated from its position.
        
        @param node 
        <span class="type">node</span> node to set pivot for
        
        @param pivot 
        <span class="type">constant</span> pivot constant
        
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
    static function set_pivot(node:TODO<"node">, pivot:TODO<"constant">):Void;

    /**
        Sets the node position.
        
        Sets the position of the supplied node.
        
        @param node 
        <span class="type">node</span> node to set the position for
        
        @param position 
        <span class="type">vector3 | vector4</span> new position
    **/
    static function set_position(node:TODO<"node">, position:EitherType<Vector4, Vector3>):Void;

    /**
        Sets the render ordering for the current GUI scene.
        
        Set the order number for the current GUI scene.
        The number dictates the sorting of the "gui" render predicate,
        in other words in which order the scene will be rendered in relation
        to other currently rendered GUI scenes.
        
        The number must be in the range 0 to 15.
        
        @param order 
        <span class="type">number</span> rendering order (0-15)
    **/
    static function set_render_order(order:Float):Void;

    /**
        Sets the node rotation.
        
        Sets the rotation of the supplied node.
        The rotation is expressed in degree Euler angles.
        
        @param node 
        <span class="type">node</span> node to set the rotation for
        
        @param rotation 
        <span class="type">vector3 | vector4</span> new rotation
    **/
    static function set_rotation(node:TODO<"node">, rotation:EitherType<Vector4, Vector3>):Void;

    /**
        Sets the node scale.
        
        Sets the scaling of the supplied node.
        
        @param node 
        <span class="type">node</span> node to set the scale for
        
        @param scale 
        <span class="type">vector3 | vector4</span> new scale
    **/
    static function set_scale(node:TODO<"node">, scale:EitherType<Vector4, Vector3>):Void;

    /**
        Sets the node shadow color.
        
        Sets the shadow color of the supplied node.
        See `gui.set_color` for info how vectors encode color values.
        
        @param node 
        <span class="type">node</span> node to set the shadow color for
        
        @param color 
        <span class="type">vector3 | vector4</span> new shadow color
    **/
    static function set_shadow(node:TODO<"node">, color:EitherType<Vector4, Vector3>):Void;

    /**
        Sets the node size.
        
        Sets the size of the supplied node.
        
        <span class="icon-attention"></span> You can only set size on nodes with size mode set to SIZE_MODE_MANUAL
        
        @param node 
        <span class="type">node</span> node to set the size for
        
        @param size 
        <span class="type">vector3 | vector4</span> new size
    **/
    static function set_size(node:TODO<"node">, size:EitherType<Vector4, Vector3>):Void;

    /**
        Sets node size mode.
        
        Sets the size mode of a node.
        The size mode defines how the node will adjust itself in size. Automatic
        size mode alters the node size based on the node's content.
        
        @param node 
        <span class="type">node</span> node to set size mode for
        
        @param size_mode 
        <span class="type">constant</span> size mode to set
        
         * `gui.SIZE_MODE_MANUAL`
         * `gui.SIZE_MODE_AUTO`
    **/
    static function set_size_mode(node:TODO<"node">, size_mode:TODO<"constant">):Void;

    /**
        Set the slice9 configuration for the node.
        
        Set the slice9 configuration values for the node.
        
        @param node 
        <span class="type">node</span> node to manipulate
        
        @param values 
        <span class="type">vector4</span> new values
    **/
    static function set_slice9(node:TODO<"node">, values:Vector4):Void;

    /**
        Sets the normalized cursor of the animation on a spine node.
        
        This is only useful for spine nodes. The cursor is normalized.
        
        @param node 
        <span class="type">node</span> spine node to set the cursor for
        
        @param cursor 
        <span class="type">number</span> cursor value
    **/
    static function set_spine_cursor(node:TODO<"node">, cursor:Float):Void;

    /**
        Sets the playback rate of the animation on a spine node.
        
        This is only useful for spine nodes. Sets the playback rate of the animation on a spine node. Must be positive.
        
        @param node 
        <span class="type">node</span> spine node to set the cursor for
        
        @param playback_rate 
        <span class="type">number</span> playback rate
    **/
    static function set_spine_playback_rate(node:TODO<"node">, playback_rate:Float):Void;

    /**
        Sets the spine scene of a node.
        
        Set the spine scene on a spine node. The spine scene must be mapped to the gui scene in the gui editor.
        
        @param node 
        <span class="type">node</span> node to set spine scene for
        
        @param spine_scene 
        <span class="type">string | hash</span> spine scene id
    **/
    static function set_spine_scene(node:TODO<"node">, spine_scene:EitherType<Hash, String>):Void;

    /**
        Sets the spine skin.
        
        Sets the spine skin on a spine node.
        
        @param node 
        <span class="type">node</span> node to set the spine skin on
        
        @param spine_skin 
        <span class="type">string | hash</span> spine skin id
        
        @param spine_slot 
        <span class="type">string | hash</span> optional slot id to only change a specific slot
    **/
    static function set_spine_skin(node:TODO<"node">, spine_skin:EitherType<Hash, String>, ?spine_slot:EitherType<Hash, String>):Void;

    /**
        Sets the node text.
        
        Set the text value of a text node. This is only useful for text nodes.
        
        @param node 
        <span class="type">node</span> node to set text for
        
        @param text 
        <span class="type">string</span> text to set
    **/
    static function set_text(node:TODO<"node">, text:String):Void;

    /**
        Sets the node texture.
        
        Set the texture on a box or pie node. The texture must be mapped to
        the gui scene in the gui editor. The function points out which texture
        the node should render from. If the texture is an atlas, further
        information is needed to select which image/animation in the atlas
        to render. In such cases, use `gui.play_flipbook()` in
        addition to this function.
        
        @param node 
        <span class="type">node</span> node to set texture for
        
        @param texture 
        <span class="type">string | hash</span> texture id
    **/
    static function set_texture(node:TODO<"node">, texture:EitherType<Hash, String>):Void;

    /**
        Set the buffer data for a texture.
        
        Set the texture buffer data for a dynamically created texture.
        
        @param texture 
        <span class="type">string | hash</span> texture id
        
        @param width 
        <span class="type">number</span> texture width
        
        @param height 
        <span class="type">number</span> texture height
        
        @param type 
        <span class="type">string | constant</span> texture type
        
           * `"rgb"` - RGB
           * `"rgba"` - RGBA
           * `"l"` - LUMINANCE
        
        @param buffer 
        <span class="type">string</span> texture data
        
        @param flip 
        <span class="type">boolean</span> flip texture vertically
        
        @return success 
        <span class="type">boolean</span> setting the data was successful
    **/
    static function set_texture_data(texture:EitherType<Hash, String>, width:Float, height:Float, type:EitherType<TODO<"constant">, String>, buffer:String, flip:TODO<"boolean">):TODO;

    /**
        Sets the tracking of the text node.
        
        Sets the tracking value of a text node. This value is used to
        adjust the vertical spacing of characters in the text.
        
        @param node 
        <span class="type">node</span> node for which to set the tracking
        
        @param tracking 
        <span class="type">number</span> a scaling number for the letter spacing (default=0)
    **/
    static function set_tracking(node:TODO<"node">, tracking:Float):Void;

    /**
        Sets the x-anchor of a node.
        
        The x-anchor specifies how the node is moved when the game is run in a different resolution.
        
        @param node 
        <span class="type">node</span> node to set x-anchor for
        
        @param anchor 
        <span class="type">constant</span> anchor constant
        
         * `gui.ANCHOR_NONE`
         * `gui.ANCHOR_LEFT`
         * `gui.ANCHOR_RIGHT`
    **/
    static function set_xanchor(node:TODO<"node">, anchor:TODO<"constant">):Void;

    /**
        Sets the y-anchor of a node.
        
        The y-anchor specifies how the node is moved when the game is run in a different resolution.
        
        @param node 
        <span class="type">node</span> node to set y-anchor for
        
        @param anchor 
        <span class="type">constant</span> anchor constant
        
         * `gui.ANCHOR_NONE`
         * `gui.ANCHOR_TOP`
         * `gui.ANCHOR_BOTTOM`
    **/
    static function set_yanchor(node:TODO<"node">, anchor:TODO<"constant">):Void;

    /**
        Shows the on-display keyboard if available <span class="icon-ios"></span> <span class="icon-android"></span>.
        
        Shows the on-display touch keyboard.
        The specified type of keyboard is displayed if it is available on
        the device.
        
        This function is only available on iOS and Android. <span class="icon-ios"></span> <span class="icon-android"></span>.
        
        @param type 
        <span class="type">constant</span> keyboard type
        
         * `gui.KEYBOARD_TYPE_DEFAULT`
         * `gui.KEYBOARD_TYPE_EMAIL`
         * `gui.KEYBOARD_TYPE_NUMBER_PAD`
         * `gui.KEYBOARD_TYPE_PASSWORD`
        
        @param autoclose 
        <span class="type">boolean</span> if the keyboard should automatically close when clicking outside
    **/
    static function show_keyboard(type:TODO<"constant">, autoclose:TODO<"boolean">):Void;

    /**
        Stops a particle fx.
        
        Stops the particle fx for a gui node
        
        @param node 
        <span class="type">node</span> node to stop particle fx for
    **/
    static function stop_particlefx(node:TODO<"node">):Void;

    /**
        Called when a gui component is initialized.
        
        This is a callback-function, which is called by the engine when a gui component is initialized. It can be used
        to set the initial state of the script and gui scene.
        
        @param self 
        <span class="type">object</span> reference to the script state to be used for storing data
    **/
    static function init(self:TODO<"object">):Void;

    /**
        Called when user input is received.
        
        This is a callback-function, which is called by the engine when user input is sent to the instance of the gui component.
        It can be used to take action on the input, e.g. modify the gui according to the input.
        
        For an instance to obtain user input, it must first acquire input
        focus through the message `acquire_input_focus`.
        
        Any instance that has obtained input will be put on top of an
        input stack. Input is sent to all listeners on the stack until the
        end of stack is reached, or a listener returns `true`
        to signal that it wants input to be consumed.
        
        See the documentation of `acquire_input_focus` for more
        information.
        
        The `action` parameter is a table containing data about the input mapped to the
        `action_id`.
        For mapped actions it specifies the value of the input and if it was just pressed or released.
        Actions are mapped to input in an input_binding-file.
        
        Mouse movement is specifically handled and uses `nil` as its `action_id`.
        The `action` only contains positional parameters in this case, such as x and y of the pointer.
        
        Here is a brief description of the available table fields:
        
        <table>
        <thead>
        <tr>
        <th>Field</th>
        <th>Description</th>
        </tr>
        </thead>
        <tbody>
        <tr>
        <td>`value`</td>
        <td>The amount of input given by the user. This is usually 1 for buttons and 0-1 for analogue inputs. This is not present for mouse movement.</td>
        </tr>
        <tr>
        <td>`pressed`</td>
        <td>If the input was pressed this frame. This is not present for mouse movement.</td>
        </tr>
        <tr>
        <td>`released`</td>
        <td>If the input was released this frame. This is not present for mouse movement.</td>
        </tr>
        <tr>
        <td>`repeated`</td>
        <td>If the input was repeated this frame. This is similar to how a key on a keyboard is repeated when you hold it down. This is not present for mouse movement.</td>
        </tr>
        <tr>
        <td>`x`</td>
        <td>The x value of a pointer device, if present.</td>
        </tr>
        <tr>
        <td>`y`</td>
        <td>The y value of a pointer device, if present.</td>
        </tr>
        <tr>
        <td>`screen_x`</td>
        <td>The screen space x value of a pointer device, if present.</td>
        </tr>
        <tr>
        <td>`screen_y`</td>
        <td>The screen space y value of a pointer device, if present.</td>
        </tr>
        <tr>
        <td>`dx`</td>
        <td>The change in x value of a pointer device, if present.</td>
        </tr>
        <tr>
        <td>`dy`</td>
        <td>The change in y value of a pointer device, if present.</td>
        </tr>
        <tr>
        <td>`screen_dx`</td>
        <td>The change in screen space x value of a pointer device, if present.</td>
        </tr>
        <tr>
        <td>`screen_dy`</td>
        <td>The change in screen space y value of a pointer device, if present.</td>
        </tr>
        <tr>
        <td>`gamepad`</td>
        <td>The index of the gamepad device that provided the input.</td>
        </tr>
        <tr>
        <td>`touch`</td>
        <td>List of touch input, one element per finger, if present. See table below about touch input</td>
        </tr>
        </tbody>
        </table>
        
        Touch input table:
        
        <table>
        <thead>
        <tr>
        <th>Field</th>
        <th>Description</th>
        </tr>
        </thead>
        <tbody>
        <tr>
        <td>`id`</td>
        <td>A number identifying the touch input during its duration.</td>
        </tr>
        <tr>
        <td>`pressed`</td>
        <td>True if the finger was pressed this frame.</td>
        </tr>
        <tr>
        <td>`released`</td>
        <td>True if the finger was released this frame.</td>
        </tr>
        <tr>
        <td>`tap_count`</td>
        <td>Number of taps, one for single, two for double-tap, etc</td>
        </tr>
        <tr>
        <td>`x`</td>
        <td>The x touch location.</td>
        </tr>
        <tr>
        <td>`y`</td>
        <td>The y touch location.</td>
        </tr>
        <tr>
        <td>`dx`</td>
        <td>The change in x value.</td>
        </tr>
        <tr>
        <td>`dy`</td>
        <td>The change in y value.</td>
        </tr>
        <tr>
        <td>`acc_x`</td>
        <td>Accelerometer x value (if present).</td>
        </tr>
        <tr>
        <td>`acc_y`</td>
        <td>Accelerometer y value (if present).</td>
        </tr>
        <tr>
        <td>`acc_z`</td>
        <td>Accelerometer z value (if present).</td>
        </tr>
        </tbody>
        </table>
        
        @param self 
        <span class="type">object</span> reference to the script state to be used for storing data
        
        @param action_id 
        <span class="type">hash</span> id of the received input action, as mapped in the input_binding-file
        
        @param action 
        <span class="type">table</span> a table containing the input data, see above for a description
        
        @return [consume] 
        <span class="type">boolean</span> optional boolean to signal if the input should be consumed (not passed on to others) or not, default is false
    **/
    static function on_input(self:TODO<"object">, action_id:Hash, action:TODO<"table">):TODO;

    /**
        Called when a message has been sent to the gui component.
        
        This is a callback-function, which is called by the engine whenever a message has been sent to the gui component.
        It can be used to take action on the message, e.g. update the gui or send a response back to the sender of the message.
        
        The `message` parameter is a table containing the message data. If the message is sent from the engine, the
        documentation of the message specifies which data is supplied.
        
        See the `update` function for examples on how to use this callback-function.
        
        @param self 
        <span class="type">object</span> reference to the script state to be used for storing data
        
        @param message_id 
        <span class="type">hash</span> id of the received message
        
        @param message 
        <span class="type">table</span> a table containing the message data
    **/
    static function on_message(self:TODO<"object">, message_id:Hash, message:TODO<"table">):Void;

    /**
        Called when the gui script is reloaded.
        
        This is a callback-function, which is called by the engine when the gui script is reloaded, e.g. from the editor.
        It can be used for live development, e.g. to tweak constants or set up the state properly for the script.
        
        @param self 
        <span class="type">object</span> reference to the script state to be used for storing data
    **/
    static function on_reload(self:TODO<"object">):Void;

    /**
        Called every frame to update the gui component.
        
        This is a callback-function, which is called by the engine every frame to update the state of a gui component.
        It can be used to perform any kind of gui related tasks, e.g. animating nodes.
        
        @param self 
        <span class="type">object</span> reference to the script state to be used for storing data
        
        @param dt 
        <span class="type">number</span> the time-step of the frame update
    **/
    static function update(self:TODO<"object">, dt:Float):Void;
}

/**
    Messages related to the `Gui` module.
**/
@:publicFields
class GuiMessages {
    /**
        Reports a layout change.
        
        This message is broadcast to every GUI component when a layout change has been initiated
        on device.
    **/
    static var layout_changed(default, never) = new Message<GuiMessageLayoutChanged>("layout_changed");
}

/**
    Data for the `GuiMessages.layout_changed` message.
**/
typedef GuiMessageLayoutChanged = {
    /**
        
        <span class="type">hash</span> the id of the layout the engine is changing to
        
    **/
    var id:Hash;

    /**
        
        <span class="type">hash</span> the id of the layout the engine is changing from
        
    **/
    var previous_id:Hash;
}

@:native("_G.gui")
extern class GuiVariables {
    /**
        Fit adjust mode.
        
        Adjust mode is used when the screen resolution differs from the project settings.
        The fit mode ensures that the entire node is visible in the adjusted gui scene.
    **/
    static var ADJUST_FIT(default, never):TODO;

    /**
        Stretch adjust mode.
        
        Adjust mode is used when the screen resolution differs from the project settings.
        The stretch mode ensures that the node is displayed as is in the adjusted gui scene, which might scale it non-uniformally.
    **/
    static var ADJUST_STRETCH(default, never):TODO;

    /**
        Zoom adjust mode.
        
        Adjust mode is used when the screen resolution differs from the project settings.
        The zoom mode ensures that the node fills its entire area and might make the node exceed it.
    **/
    static var ADJUST_ZOOM(default, never):TODO;

    /**
        Bottom y-anchor.
    **/
    static var ANCHOR_BOTTOM(default, never):TODO;

    /**
        Left x-anchor.
    **/
    static var ANCHOR_LEFT(default, never):TODO;

    /**
        Right x-anchor.
    **/
    static var ANCHOR_RIGHT(default, never):TODO;

    /**
        Top y-anchor.
    **/
    static var ANCHOR_TOP(default, never):TODO;

    /**
        Additive blending.
    **/
    static var BLEND_ADD(default, never):TODO;

    /**
        Additive alpha blending.
    **/
    static var BLEND_ADD_ALPHA(default, never):TODO;

    /**
        Alpha blending.
    **/
    static var BLEND_ALPHA(default, never):TODO;

    /**
        Multiply blending.
    **/
    static var BLEND_MULT(default, never):TODO;

    /**
        Clipping mode none.
    **/
    static var CLIPPING_MODE_NONE(default, never):TODO;

    /**
        Clipping mode stencil.
    **/
    static var CLIPPING_MODE_STENCIL(default, never):TODO;

    /**
        In-back.
    **/
    static var EASING_INBACK(default, never):TODO;

    /**
        In-bounce.
    **/
    static var EASING_INBOUNCE(default, never):TODO;

    /**
        In-circlic.
    **/
    static var EASING_INCIRC(default, never):TODO;

    /**
        In-cubic.
    **/
    static var EASING_INCUBIC(default, never):TODO;

    /**
        In-elastic.
    **/
    static var EASING_INELASTIC(default, never):TODO;

    /**
        In-exponential.
    **/
    static var EASING_INEXPO(default, never):TODO;

    /**
        In-out-back.
    **/
    static var EASING_INOUTBACK(default, never):TODO;

    /**
        In-out-bounce.
    **/
    static var EASING_INOUTBOUNCE(default, never):TODO;

    /**
        In-out-circlic.
    **/
    static var EASING_INOUTCIRC(default, never):TODO;

    /**
        In-out-cubic.
    **/
    static var EASING_INOUTCUBIC(default, never):TODO;

    /**
        In-out-elastic.
    **/
    static var EASING_INOUTELASTIC(default, never):TODO;

    /**
        In-out-exponential.
    **/
    static var EASING_INOUTEXPO(default, never):TODO;

    /**
        In-out-quadratic.
    **/
    static var EASING_INOUTQUAD(default, never):TODO;

    /**
        In-out-quartic.
    **/
    static var EASING_INOUTQUART(default, never):TODO;

    /**
        In-out-quintic.
    **/
    static var EASING_INOUTQUINT(default, never):TODO;

    /**
        In-out-sine.
    **/
    static var EASING_INOUTSINE(default, never):TODO;

    /**
        In-quadratic.
    **/
    static var EASING_INQUAD(default, never):TODO;

    /**
        In-quartic.
    **/
    static var EASING_INQUART(default, never):TODO;

    /**
        In-quintic.
    **/
    static var EASING_INQUINT(default, never):TODO;

    /**
        In-sine.
    **/
    static var EASING_INSINE(default, never):TODO;

    /**
        Linear interpolation.
    **/
    static var EASING_LINEAR(default, never):TODO;

    /**
        Out-back.
    **/
    static var EASING_OUTBACK(default, never):TODO;

    /**
        Out-bounce.
    **/
    static var EASING_OUTBOUNCE(default, never):TODO;

    /**
        Out-circlic.
    **/
    static var EASING_OUTCIRC(default, never):TODO;

    /**
        Out-cubic.
    **/
    static var EASING_OUTCUBIC(default, never):TODO;

    /**
        Out-elastic.
    **/
    static var EASING_OUTELASTIC(default, never):TODO;

    /**
        Out-exponential.
    **/
    static var EASING_OUTEXPO(default, never):TODO;

    /**
        Out-in-back.
    **/
    static var EASING_OUTINBACK(default, never):TODO;

    /**
        Out-in-bounce.
    **/
    static var EASING_OUTINBOUNCE(default, never):TODO;

    /**
        Out-in-circlic.
    **/
    static var EASING_OUTINCIRC(default, never):TODO;

    /**
        Out-in-cubic.
    **/
    static var EASING_OUTINCUBIC(default, never):TODO;

    /**
        Out-in-elastic.
    **/
    static var EASING_OUTINELASTIC(default, never):TODO;

    /**
        Out-in-exponential.
    **/
    static var EASING_OUTINEXPO(default, never):TODO;

    /**
        Out-in-quadratic.
    **/
    static var EASING_OUTINQUAD(default, never):TODO;

    /**
        Out-in-quartic.
    **/
    static var EASING_OUTINQUART(default, never):TODO;

    /**
        Out-in-quintic.
    **/
    static var EASING_OUTINQUINT(default, never):TODO;

    /**
        Out-in-sine.
    **/
    static var EASING_OUTINSINE(default, never):TODO;

    /**
        Out-quadratic.
    **/
    static var EASING_OUTQUAD(default, never):TODO;

    /**
        Out-quartic.
    **/
    static var EASING_OUTQUART(default, never):TODO;

    /**
        Out-quintic.
    **/
    static var EASING_OUTQUINT(default, never):TODO;

    /**
        Out-sine.
    **/
    static var EASING_OUTSINE(default, never):TODO;

    /**
        Default keyboard.
    **/
    static var KEYBOARD_TYPE_DEFAULT(default, never):TODO;

    /**
        Email keyboard.
    **/
    static var KEYBOARD_TYPE_EMAIL(default, never):TODO;

    /**
        Number input keyboard.
    **/
    static var KEYBOARD_TYPE_NUMBER_PAD(default, never):TODO;

    /**
        Password keyboard.
    **/
    static var KEYBOARD_TYPE_PASSWORD(default, never):TODO;

    /**
        Elliptical pie node bounds.
    **/
    static var PIEBOUNDS_ELLIPSE(default, never):TODO;

    /**
        Rectangular pie node bounds.
    **/
    static var PIEBOUNDS_RECTANGLE(default, never):TODO;

    /**
        Center pivor.
    **/
    static var PIVOT_CENTER(default, never):TODO;

    /**
        East pivot.
    **/
    static var PIVOT_E(default, never):TODO;

    /**
        North pivot.
    **/
    static var PIVOT_N(default, never):TODO;

    /**
        North-east pivot.
    **/
    static var PIVOT_NE(default, never):TODO;

    /**
        North-west pivot.
    **/
    static var PIVOT_NW(default, never):TODO;

    /**
        South pivot.
    **/
    static var PIVOT_S(default, never):TODO;

    /**
        South-east pivot.
    **/
    static var PIVOT_SE(default, never):TODO;

    /**
        South-west pivot.
    **/
    static var PIVOT_SW(default, never):TODO;

    /**
        West pivot.
    **/
    static var PIVOT_W(default, never):TODO;

    /**
        Loop backward.
    **/
    static var PLAYBACK_LOOP_BACKWARD(default, never):TODO;

    /**
        Loop forward.
    **/
    static var PLAYBACK_LOOP_FORWARD(default, never):TODO;

    /**
        Ping pong loop.
    **/
    static var PLAYBACK_LOOP_PINGPONG(default, never):TODO;

    /**
        Once backward.
    **/
    static var PLAYBACK_ONCE_BACKWARD(default, never):TODO;

    /**
        Once forward.
    **/
    static var PLAYBACK_ONCE_FORWARD(default, never):TODO;

    /**
        Once forward and then backward.
    **/
    static var PLAYBACK_ONCE_PINGPONG(default, never):TODO;

    /**
        Color property.
    **/
    static var PROP_COLOR(default, never):TODO;

    /**
        Fill_angle property.
    **/
    static var PROP_FILL_ANGLE(default, never):TODO;

    /**
        Inner_radius property.
    **/
    static var PROP_INNER_RADIUS(default, never):TODO;

    /**
        Outline color property.
    **/
    static var PROP_OUTLINE(default, never):TODO;

    /**
        Position property.
    **/
    static var PROP_POSITION(default, never):TODO;

    /**
        Rotation property.
    **/
    static var PROP_ROTATION(default, never):TODO;

    /**
        Scale property.
    **/
    static var PROP_SCALE(default, never):TODO;

    /**
        Shadow color property.
    **/
    static var PROP_SHADOW(default, never):TODO;

    /**
        Size property.
    **/
    static var PROP_SIZE(default, never):TODO;

    /**
        Slice9 property.
    **/
    static var PROP_SLICE9(default, never):TODO;

    /**
        Automatic size mode.
        
        The size of the node is determined by the currently assigned texture.
    **/
    static var SIZE_MODE_AUTO(default, never):TODO;

    /**
        Manual size mode.
        
        The size of the node is determined by the size set in the editor, the constructor or by gui.set_size()
    **/
    static var SIZE_MODE_MANUAL(default, never):TODO;
}
package defold;

/**
    <p>Functions, core hooks, messages and constants for manipulation of
    game objects. The "go" namespace is accessible from game object script
    files.</p>

    See `GoProperties` for related properties.
    See `GoMessages` for related messages.
    See `GoVariables` for related variables.
**/
@:native("_G.go")
extern class Go {
    /**
        Called when a script component is finalized.
        
        This is a callback-function, which is called by the engine when a script component is finalized (destroyed). It can
        be used to e.g. take some last action, report the finalization to other game object instances, delete spawned objects
        or release user input focus (see `release_input_focus`).
        
        @param self 
        <span class="type">object</span> reference to the script state to be used for storing data
    **/
    static function final(self:TODO<"object">):Void;

    /**
        Animates a named property of the specified game object or component.
        
        This is only supported for numerical properties. If the node property is already being
        animated, that animation will be canceled and replaced by the new one.
        
        If a `complete_function` (lua function) is specified, that function will be called when the animation has completed.
        By starting a new animation in that function, several animations can be sequenced together. See the examples for more information.
        
        <span class="icon-attention"></span> If you call `go.animate()` from a game object's `final()` function,
        any passed `complete_function` will be ignored and never called upon animation completion.
        
        See the `animation guide` for how to animate them.
        
        @param url 
        <span class="type">string | hash | url</span> url of the game object or component having the property
        
        @param property 
        <span class="type">string | hash</span> id of the property to animate
        
        @param playback 
        <span class="type">constant</span> playback mode of the animation
        
         * `go.PLAYBACK_ONCE_FORWARD`
         * `go.PLAYBACK_ONCE_BACKWARD`
         * `go.PLAYBACK_ONCE_PINGPONG`
         * `go.PLAYBACK_LOOP_FORWARD`
         * `go.PLAYBACK_LOOP_BACKWARD`
         * `go.PLAYBACK_LOOP_PINGPONG`
        
        @param to 
        <span class="type">number | vector3 | vector4 | quaternion</span> target property value
        
        @param easing 
        <span class="type">constant | vector</span> easing to use during animation. Either specify a constant, see the `animation guide` for a complete list, or a vmath.vector with a curve
        
        @param duration 
        <span class="type">number</span> duration of the animation in seconds
        
        @param delay 
        <span class="type">number</span> delay before the animation starts in seconds
        
        @param complete_function 
        <span class="type">function(self, url, property)</span> optional function to call when the animation has completed
        
        <dl>
        <dt>`self`</dt>
        <dd>
        
        <span class="type">object</span> The current object.
        
        </dd>
        <dt>`url`</dt>
        <dd>
        
        <span class="type">url</span> The game object or component instance for which the property is animated.
        
        </dd>
        <dt>`property`</dt>
        <dd>
        
        <span class="type">hash</span> The id of the animated property.
        
        </dd>
        </dl>
    **/
    static function animate(url:EitherType<Url, EitherType<Hash, String>>, property:EitherType<Hash, String>, playback:TODO<"constant">, to:EitherType<TODO<"quaternion">, EitherType<Vector4, EitherType<Vector3, Float>>>, easing:EitherType<Vector, TODO<"constant">>, duration:Float, ?delay:Float, ?complete_function:TODO<"function(self, url, property)">):Void;

    /**
        Cancels all animations of the named property of the specified game object or component.
        
        By calling this function, all stored animations of the given property will be canceled.
        
        See the `animation guide` for how to animate them.
        
        @param url 
        <span class="type">string | hash | url</span> url of the game object or component having the property
        
        @param property 
        <span class="type">string | hash</span> ide of the property to animate
    **/
    static function cancel_animations(url:EitherType<Url, EitherType<Hash, String>>, property:EitherType<Hash, String>):Void;

    /**
        Delete one or more game object instances.
        
        Delete one or more game objects identified by id. Deletion is asynchronous meaning that
        the game object(s) are scheduled for deletion which will happen at the end of the current
        frame. Note that game objects scheduled for deletion will be counted against
        `max_instances` in "game.project" until they are actually removed.
        
        @param id 
        <span class="type">string | hash | url | table</span> optional id or table of id's of the instance(s) to delete, the instance of the calling script is deleted by default
        
        @param recursive 
        <span class="type">boolean</span> optional boolean, set to true to recursively delete child hiearchy in child to parent order
    **/
    static function delete(?id:EitherType<TODO<"table">, EitherType<Url, EitherType<Hash, String>>>, ?recursive:TODO<"boolean">):Void;

    /**
        Gets a named property of the specified game object or component.
        
        @param url 
        <span class="type">string | hash | url</span> url of the game object or component having the property
        
        @param property 
        <span class="type">string | hash</span> id of the property to retrieve
        
        @return value 
        <span class="type">any</span> the value of the specified property
    **/
    static function get(url:EitherType<Url, EitherType<Hash, String>>, property:EitherType<Hash, String>):TODO;

    /**
        Gets the id of an instance.
        
        Returns or constructs an instance identifier. The instance id is a hash
        of the absolute path to the instance.
        
         * If `path` is specified, it can either be absolute or relative to the instance of the calling script.
         * If `path` is not specified, the id of the game object instance the script is attached to will be returned.
        
        @param path 
        <span class="type">string</span> path of the instance for which to return the id
        
        @return id 
        <span class="type">hash</span> instance id
    **/
    static function get_id(?path:String):TODO;

    /**
        Gets the position of a game object instance.
        
        The position is relative the parent (if any). Use `go.get_world_position` to retrieve the global world position.
        
        @param id 
        <span class="type">string | hash | url</span> optional id of the game object instance to get the position for, by default the instance of the calling script
        
        @return position 
        <span class="type">vector3</span> instance position
    **/
    static function get_position(?id:EitherType<Url, EitherType<Hash, String>>):TODO;

    /**
        Gets the rotation of the game object instance.
        
        The rotation is relative to the parent (if any). Use `go.get_world_rotation` to retrieve the global world position.
        
        @param id 
        <span class="type">string | hash | url</span> optional id of the game object instance to get the rotation for, by default the instance of the calling script
        
        @return rotation 
        <span class="type">quaternion</span> instance rotation
    **/
    static function get_rotation(?id:EitherType<Url, EitherType<Hash, String>>):TODO;

    /**
        Gets the 3D scale factor of the game object instance.
        
        The scale is relative the parent (if any). Use `go.get_world_scale` to retrieve the global world 3D scale factor.
        
        @param id 
        <span class="type">string | hash | url</span> optional id of the game object instance to get the scale for, by default the instance of the calling script
        
        @return scale 
        <span class="type">vector3</span> instance scale factor
    **/
    static function get_scale(?id:EitherType<Url, EitherType<Hash, String>>):TODO;

    /**
        Gets the uniform scale factor of the game object instance.
        
        The uniform scale is relative the parent (if any). If the underlying scale vector is non-uniform the min element of the vector is returned as the uniform scale factor.
        
        @param id 
        <span class="type">string | hash | url</span> optional id of the game object instance to get the uniform scale for, by default the instance of the calling script
        
        @return scale 
        <span class="type">number</span> uniform instance scale factor
    **/
    static function get_scale_uniform(?id:EitherType<Url, EitherType<Hash, String>>):TODO;

    /**
        Gets the game object instance world position.
        
        Use `go.get_position` to retrieve the position relative to the parent.
        
        @param id 
        <span class="type">string | hash | url</span> optional id of the game object instance to get the world position for, by default the instance of the calling script
        
        @return position 
        <span class="type">vector3</span> instance world position
    **/
    static function get_world_position(?id:EitherType<Url, EitherType<Hash, String>>):TODO;

    /**
        Gets the game object instance world rotation.
        
        Use `go.get_rotation` to retrieve the rotation relative to the parent.
        
        @param id 
        <span class="type">string | hash | url</span> optional id of the game object instance to get the world rotation for, by default the instance of the calling script
        
        @return rotation 
        <span class="type">quaternion</span> instance world rotation
    **/
    static function get_world_rotation(?id:EitherType<Url, EitherType<Hash, String>>):TODO;

    /**
        Gets the game object instance world 3D scale factor.
        
        Use `go.get_scale` to retrieve the 3D scale factor relative to the parent.
        This vector is derived by decomposing the transformation matrix and should be used with care.
        For most cases it should be fine to use `go.get_world_scale_uniform` instead.
        
        @param id 
        <span class="type">string | hash | url</span> optional id of the game object instance to get the world scale for, by default the instance of the calling script
        
        @return scale 
        <span class="type">vector3</span> instance world 3D scale factor
    **/
    static function get_world_scale(?id:EitherType<Url, EitherType<Hash, String>>):TODO;

    /**
        Gets the uniform game object instance world scale factor.
        
        Use `go.get_scale_uniform` to retrieve the scale factor relative to the parent.
        
        @param id 
        <span class="type">string | hash | url</span> optional id of the game object instance to get the world scale for, by default the instance of the calling script
        
        @return scale 
        <span class="type">number</span> instance world scale factor
    **/
    static function get_world_scale_uniform(?id:EitherType<Url, EitherType<Hash, String>>):TODO;

    /**
        Define a property for the script.
        
        This function defines a property which can then be used in the script through the self-reference.
        The properties defined this way are automatically exposed in the editor in game objects and collections which use the script.
        Note that you can only use this function outside any callback-functions like init and update.
        
        @param name 
        <span class="type">string</span> the id of the property
        
        @param value 
        <span class="type">number | hash | url | vector3 | vector4 | quaternion</span> default value of the property. In the case of a url, only the empty constructor msg.url() is allowed
    **/
    static function property(name:String, value:EitherType<TODO<"quaternion">, EitherType<Vector4, EitherType<Vector3, EitherType<Url, EitherType<Hash, Float>>>>>):Void;

    /**
        Sets a named property of the specified game object or component.
        
        @param url 
        <span class="type">string | hash | url</span> url of the game object or component having the property
        
        @param property 
        <span class="type">string | hash</span> id of the property to set
        
        @param value 
        <span class="type">any</span> the value to set
    **/
    static function set(url:EitherType<Url, EitherType<Hash, String>>, property:EitherType<Hash, String>, value:TODO<"any">):Void;

    /**
        Sets the position of the game object instance.
        
        The position is relative to the parent (if any). The global world position cannot be manually set.
        
        @param position 
        <span class="type">vector3</span> position to set
        
        @param id 
        <span class="type">string | hash | url</span> optional id of the game object instance to set the position for, by default the instance of the calling script
    **/
    static function set_position(position:Vector3, ?id:EitherType<Url, EitherType<Hash, String>>):Void;

    /**
        Sets the rotation of the game object instance.
        
        The rotation is relative to the parent (if any). The global world rotation cannot be manually set.
        
        @param rotation 
        <span class="type">quaternion</span> rotation to set
        
        @param id 
        <span class="type">string | hash | url</span> optional id of the game object instance to get the rotation for, by default the instance of the calling script
    **/
    static function set_rotation(rotation:TODO<"quaternion">, ?id:EitherType<Url, EitherType<Hash, String>>):Void;

    /**
        Sets the scale factor of the game object instance.
        
        The scale factor is relative to the parent (if any). The global world scale factor cannot be manually set.
        
        <span class="icon-attention"></span> Physics are currently not affected when setting scale from this function.
        
        @param scale 
        <span class="type">number | vector3</span> vector or uniform scale factor, must be greater than 0
        
        @param id 
        <span class="type">string | hash | url</span> optional id of the game object instance to get the scale for, by default the instance of the calling script
    **/
    static function set_scale(scale:EitherType<Vector3, Float>, ?id:EitherType<Url, EitherType<Hash, String>>):Void;

    /**
        Called when a script component is initialized.
        
        This is a callback-function, which is called by the engine when a script component is initialized. It can be used
        to set the initial state of the script.
        
        @param self 
        <span class="type">object</span> reference to the script state to be used for storing data
    **/
    static function init(self:TODO<"object">):Void;

    /**
        Called when user input is received.
        
        This is a callback-function, which is called by the engine when user input is sent to the game object instance of the script.
        It can be used to take action on the input, e.g. move the instance according to the input.
        
        For an instance to obtain user input, it must first acquire input focus
        through the message `acquire_input_focus`.
        
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
        <td>If the input was pressed this frame, 0 for false and 1 for true. This is not present for mouse movement.</td>
        </tr>
        <tr>
        <td>`released`</td>
        <td>If the input was released this frame, 0 for false and 1 for true. This is not present for mouse movement.</td>
        </tr>
        <tr>
        <td>`repeated`</td>
        <td>If the input was repeated this frame, 0 for false and 1 for true. This is similar to how a key on a keyboard is repeated when you hold it down. This is not present for mouse movement.</td>
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
        Called when a message has been sent to the script component.
        
        This is a callback-function, which is called by the engine whenever a message has been sent to the script component.
        It can be used to take action on the message, e.g. send a response back to the sender of the message.
        
        The `message` parameter is a table containing the message data. If the message is sent from the engine, the
        documentation of the message specifies which data is supplied.
        
        @param self 
        <span class="type">object</span> reference to the script state to be used for storing data
        
        @param message_id 
        <span class="type">hash</span> id of the received message
        
        @param message 
        <span class="type">table</span> a table containing the message data
        
        @param sender 
        <span class="type">url</span> address of the sender
    **/
    static function on_message(self:TODO<"object">, message_id:Hash, message:TODO<"table">, sender:Url):Void;

    /**
        Called when the script component is reloaded.
        
        This is a callback-function, which is called by the engine when the script component is reloaded, e.g. from the editor.
        It can be used for live development, e.g. to tweak constants or set up the state properly for the instance.
        
        @param self 
        <span class="type">object</span> reference to the script state to be used for storing data
    **/
    static function on_reload(self:TODO<"object">):Void;

    /**
        Called every frame to update the script component.
        
        This is a callback-function, which is called by the engine every frame to update the state of a script component.
        It can be used to perform any kind of game related tasks, e.g. moving the game object instance.
        
        @param self 
        <span class="type">object</span> reference to the script state to be used for storing data
        
        @param dt 
        <span class="type">number</span> the time-step of the frame update
    **/
    static function update(self:TODO<"object">, dt:Float):Void;
}

/**
    Properties related to the `Go` module.
**/
@:publicFields
class GoProperties {
    /**
        <span class="type">vector3</span> game object euler rotation.
        
        The rotation of the game object expressed in Euler angles.
        Euler angles are specified in degrees in the interval (-360, 360).
        The type of the property is vector3.
    **/
    static var euler(default, never) = new Property<TODO>("euler");

    /**
        <span class="type">vector3</span> game object position.
        
        The position of the game object.
        The type of the property is vector3.
    **/
    static var position(default, never) = new Property<TODO>("position");

    /**
        <span class="type">quaternion</span> game object rotation.
        
        The rotation of the game object.
        The type of the property is quaternion.
    **/
    static var rotation(default, never) = new Property<TODO>("rotation");

    /**
        <span class="type">number</span> game object scale.
        
        The uniform scale of the game object. The type of the property is number.
    **/
    static var scale(default, never) = new Property<TODO>("scale");
}

/**
    Messages related to the `Go` module.
**/
@:publicFields
class GoMessages {
    /**
        Acquires the user input focus.
        
        Post this message to a game object instance to make that instance acquire the user input focus.
        
        User input is distributed by the engine to every instance that has
        requested it. The last instance to request focus will receive it first.
        This means that the scripts in the instance will have first-hand-chance
        at reacting on user input, possibly consuming it (by returning
        `true` from `on_input`) so that no other instances
        can react on it. The most common case is for a script to send this message
        to itself when it needs to respond to user input.
        
        A script belonging to an instance which has the user input focus will
        receive the input actions in its `on_input` callback function.
        See `on_input` for more information on how user input can be
        handled.
    **/
    static var acquire_input_focus(default, never) = new Message<Void>("acquire_input_focus");

    /**
        Disables the receiving component.
        
        This message disables the receiving component. All components are enabled by default, which means they will receive input, updates
        and be a part of the simulation. A component is disabled when it receives the `disable` message.
        
        <span class="icon-alert"></span> Components that currently supports this message are:
        
         * Collection Proxy
         * Collision Object
         * Gui
         * Label
         * Spine Model
         * Sprite
         * Tile Grid
         * Model
    **/
    static var disable(default, never) = new Message<Void>("disable");

    /**
        Enables the receiving component.
        
        This message enables the receiving component. All components are enabled by default, which means they will receive input, updates
        and be a part of the simulation. A component is disabled when it receives the `disable` message.
        
        <span class="icon-alert"></span> Components that currently supports this message are:
        
         * Collection Proxy
         * Collision Object
         * Gui
         * Label
         * Spine Model
         * Sprite
         * Tile Grid
         * Model
    **/
    static var enable(default, never) = new Message<Void>("enable");

    /**
        Releases the user input focus.
        
        Post this message to an instance to make that instance release the user input focus.
        See `acquire_input_focus` for more information on how the user input handling
        works.
    **/
    static var release_input_focus(default, never) = new Message<Void>("release_input_focus");

    /**
        Sets the parent of the receiving instance.
        
        When this message is sent to an instance, it sets the parent of that instance. This means that the instance will exist
        in the geometrical space of its parent, like a basic transformation hierarchy or scene graph. If no parent is specified,
        the instance will be detached from any parent and exist in world space. A script can send this message to itself to set
        the parent of its instance.
    **/
    static var set_parent(default, never) = new Message<GoMessageSetParent>("set_parent");
}

/**
    Data for the `GoMessages.set_parent` message.
**/
typedef GoMessageSetParent = {
    /**
        
        <span class="type">hash</span> the id of the new parent
        
    **/
    var parent_id:Hash;

    /**
        
        <span class="type">number</span> if the world transform of the instance should be preserved when changing spaces, 0 for false and 1 for true. The default value is 1.
        
    **/
    var keep_world_transform:Float;
}

@:native("_G.go")
extern class GoVariables {
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
        No playback.
    **/
    static var PLAYBACK_NONE(default, never):TODO;

    /**
        Once backward.
    **/
    static var PLAYBACK_ONCE_BACKWARD(default, never):TODO;

    /**
        Once forward.
    **/
    static var PLAYBACK_ONCE_FORWARD(default, never):TODO;

    /**
        Once ping pong.
    **/
    static var PLAYBACK_ONCE_PINGPONG(default, never):TODO;
}
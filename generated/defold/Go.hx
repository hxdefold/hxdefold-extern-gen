package defold;

/**
    Functions, core hooks, messages and constants for manipulation of
    game objects. The "go" namespace is accessible from game object script
    files.

    See `GoMessages` for related messages.
    See `GoProperties` for related properties.
    See `GoVariables` for related variables.
**/
@:native("_G.go") extern class Go {
	/**
		Called when a script component is finalized.
		
		<div>This is a callback-function, which is called by the engine when a script component is finalized (destroyed). It can
		be used to e.g. take some last action, report the finalization to other game object instances, delete spawned objects
		or release user input focus (see `release_input_focus`).</div>
		
		@param self reference to the script state to be used for storing data (script_ref)
	**/
	static function final(self:TODO<"script_ref">):Void;

	/**
		Animates a named property of the specified game object or component.
		
		This is only supported for numerical properties. If the node property is already being
		animated, that animation will be canceled and replaced by the new one.
		
		If a `complete_function` (lua function) is specified, that function will be called when the animation has completed.
		By starting a new animation in that function, several animations can be sequenced together. See the examples for more information.
		
		*NOTE!* If you call `go.animate()` from a game object's `final()` function, any passed
		`complete_function` will be ignored and never called upon animation completion.
		
		See the <a href="/doc/properties">properties guide</a> for which properties can be animated and how.
		
		@param url url of the game object or component having the property (hash|string|url)
		@param property name of the property to animate (hash|string)
		@param playback playback mode of the animation (constant)
		
		   * `go.PLAYBACK_ONCE_FORWARD`
		   * `go.PLAYBACK_ONCE_BACKWARD`
		   * `go.PLAYBACK_ONCE_PINGPONG`
		   * `go.PLAYBACK_LOOP_FORWARD`
		   * `go.PLAYBACK_LOOP_BACKWARD`
		   * `go.PLAYBACK_LOOP_PINGPONG`
		
		@param to target property value (number|vector3|vector4|quaternion)
		@param easing easing to use during animation. Either specify a constant, see the <a href="/doc/properties">properties guide</a> for a complete list, or a vmath.vector with a curve. (constant|vector)
		@param duration duration of the animation in seconds (number)
		@param delay delay before the animation starts in seconds (number)
		@param complete_function function with parameters (self, url, property) to call when the animation has completed (function)
	**/
	static function animate(url:EitherType<Url, EitherType<String, Hash>>, property:EitherType<String, Hash>, playback:TODO, to:EitherType<TODO<"quaternion">, EitherType<Vector4, EitherType<Vector3, Float>>>, easing:EitherType<Vector, TODO<"constant">>, duration:Float, ?delay:Float, ?complete_function:TODO<"self, url, property) to call when the animation has completed (function">):Void;

	/**
		Cancels all animations of the named property of the specified game object or component.
		
		By calling this function, all stored animations of the given property will be canceled.
		
		See the <a href="/doc/properties">properties guide</a> for which properties can be animated and how.
		
		@param url url of the game object or component having the property (hash|string|url)
		@param property name of the property to animate (hash|string)
	**/
	static function cancel_animations(url:EitherType<Url, EitherType<String, Hash>>, property:EitherType<String, Hash>):Void;

	/**
		Deletes a game object instance.
		
		<div>Delete a game object identified by its id.</div>
		
		@param id optional id of the instance to delete, the instance of the calling script is deleted by default (hash|string|url)
	**/
	static function delete(?id:EitherType<Url, EitherType<String, Hash>>):Void;

	/**
		Deletes a set of game object instance.
		
		<div>Delete all game objects simultaneously as listed in table.
		The table values (not keys) should be game object ids (hashes).</div>
		
		@param ids table with values of instance ids (hashes) to be deleted
	**/
	static function delete_all(?ids:TODO):Void;

	/**
		Gets a named property of the specified game object or component.
		
		@param url url of the game object or component having the property (hash|string|url)
		@param id id of the property to retrieve (hash|string)
		@return the value of the specified property (any)
	**/
	static function get(url:EitherType<Url, EitherType<String, Hash>>, id:EitherType<String, Hash>):TODO;

	/**
		Gets the id of an instance.
		
		The instance id is a hash of the absolute path.
		If `path` is specified, it can either be absolute or relative to the instance of the calling script.
		If `path` is not specified, the id of the instance of the calling script will be returned. See the examples below for more information.
		
		@param path path of the instance for which to return the id (string)
		@return instance id (hash)
	**/
	static function get_id(?path:String):TODO;

	/**
		Gets the position of the instance.
		
		The position is relative the parent (if any). Use `go.get_world_position` to retrieve the global world position.
		
		@param id optional id of the instance to get the position for, by default the instance of the calling script (hash|string|url)
		@return instance position (vector3)
	**/
	static function get_position(?id:EitherType<Url, EitherType<String, Hash>>):TODO;

	/**
		Gets the rotation of the instance.
		
		The rotation is relative to the parent (if any). Use `go.get_world_rotation` to retrieve the global world position.
		
		@param id optional id of the instance to get the rotation for, by default the instance of the calling script (hash|string|url)
		@return instance rotation (quaternion)
	**/
	static function get_rotation(?id:EitherType<Url, EitherType<String, Hash>>):TODO;

	/**
		Gets the uniform scale factor of the instance.
		
		The uniform scale is relative the parent (if any). Use `go.get_world_scale` to retrieve the global world scale factor.
		
		@param id optional id of the instance to get the scale for, by default the instance of the calling script (hash|string|url)
		@return uniform instance scale factor (number)
	**/
	static function get_scale(?id:EitherType<Url, EitherType<String, Hash>>):TODO;

	/**
		Gets the 3D scale factor of the instance.
		
		The scale is relative the parent (if any). Use `go.get_world_scale` to retrieve the global world scale factor.
		
		@param id optional id of the instance to get the scale for, by default the instance of the calling script (hash|string|url)
		@return scale factor (vector3)
	**/
	static function get_scale_vector(?id:EitherType<Url, EitherType<String, Hash>>):TODO;

	/**
		Gets the instance world position.
		
		Use `go.get_position` to retrieve the position relative to the parent.
		
		@param id optional id of the instance to get the world position for, by default the instance of the calling script (hash|string|url)
		@return instance world position (vector3)
	**/
	static function get_world_position(?id:EitherType<Url, EitherType<String, Hash>>):TODO;

	/**
		Gets the instance world rotation.
		
		Use `go.get_rotation` to retrieve the rotation relative to the parent.
		
		@param id optional id of the instance to get the world rotation for, by default the instance of the calling script (hash|string|url)
		@return instance world rotation (quaternion)
	**/
	static function get_world_rotation(?id:EitherType<Url, EitherType<String, Hash>>):TODO;

	/**
		Gets the instance world scale factor.
		
		Use `go.get_scale` to retrieve the scale factor relative to the parent.
		
		@param id optional id of the instance to get the world scale for, by default the instance of the calling script (hash|string|url)
		@return uniform instance world scale factor (number)
	**/
	static function get_world_scale(?id:EitherType<Url, EitherType<String, Hash>>):TODO;

	/**
		Define a property to be used throughout the script.
		
		This function defines a property which can then be used in the script through the self-reference.
		The properties defined this way are automatically exposed in the editor in game objects and collections which use the script.
		Note that you can only use this function outside any callback-functions like init and update.
		
		@param name the name of the property (string)
		@param value default value of the property. In the case of a url, only the empty constructor msg.url() is allowed. (number|hash|url|vector3|vector4|quaternion)
	**/
	static function property(name:String, value:EitherType<TODO<"quaternion">, EitherType<Vector4, EitherType<Vector3, EitherType<Url, EitherType<Hash, TODO<") is allowed. (number">>>>>>):Void;

	/**
		Constructs a ray in world space from a position in screen space.
		
		Do not use this function, WIP!
		
		@param x x-coordinate of the screen space position (number)
		@param y y-coordinate of the screen space position (number)
		@return position of the ray in world-space (vector3)
		@return direction of the ray in world space (vector3)
	**/
	static function screen_ray(x:Float, y:Float):TODO<"multiple">;

	/**
		Sets a named property of the specified game object or component.
		
		@param url url of the game object or component having the property (hash|string|url)
		@param id id of the property to set (hash|string)
		@param value the value to set (any)
	**/
	static function set(url:EitherType<Url, EitherType<String, Hash>>, id:EitherType<String, Hash>, value:TODO<"any">):Void;

	/**
		Sets the position of the instance.
		
		The position is relative to the parent (if any). The global world position cannot be manually set.
		
		@param position position to set (vector3)
		@param id optional id of the instance to set the position for, by default the instance of the calling script (hash|string|url)
	**/
	static function set_position(position:Vector3, ?id:EitherType<Url, EitherType<String, Hash>>):Void;

	/**
		Sets the rotation of the instance.
		
		The rotation is relative to the parent (if any). The global world rotation cannot be manually set.
		
		@param rotation rotation to set (quaternion)
		@param id optional id of the instance to get the rotation for, by default the instance of the calling script (hash|string|url)
	**/
	static function set_rotation(rotation:TODO<"quaternion">, ?id:EitherType<Url, EitherType<String, Hash>>):Void;

	/**
		Sets the scale factor of the instance.
		
		The scale factor is relative to the parent (if any). The global world scale factor cannot be manually set.
		
		*NOTE!* Physics are currently not affected when setting scale from this function.
		
		@param scale vector or uniform scale factor, must be greater than 0 (number|vector3)
		@param id optional id of the instance to get the scale for, by default the instance of the calling script (hash|string|url)
	**/
	static function set_scale(scale:EitherType<Vector3, Float>, ?id:EitherType<Url, EitherType<String, Hash>>):Void;

	/**
		Called when a script component is initialized.
		
		This is a callback-function, which is called by the engine when a script component is initialized. It can be used
		to set the initial state of the script.
		
		@param self reference to the script state to be used for storing data (script_ref)
	**/
	static function init(self:TODO<"script_ref">):Void;

	/**
		Called when user input is received.
		
		This is a callback-function, which is called by the engine when user input is sent to the game object instance of the script.
		It can be used to take action on the input, e.g. move the instance according to the input.
		
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
		@return optional boolean to signal if the input should be consumed (not passed on to others) or not, default is false (boolean)
	**/
	static function on_input(self:TODO<"script_ref">, action_id:Hash, action:TODO<"table">):TODO;

	/**
		Called when a message has been sent to the script component.
		
		This is a callback-function, which is called by the engine whenever a message has been sent to the script component.
		It can be used to take action on the message, e.g. send a response back to the sender of the message.
		
		The `message` parameter is a table containing the message data. If the message is sent from the engine, the
		documentation of the message specifies which data is supplied.
		
		@param self reference to the script state to be used for storing data (script_ref)
		@param message_id id of the received message (hash)
		@param message a table containing the message data (table)
		@param sender address of the sender (url)
	**/
	static function on_message(self:TODO<"script_ref">, message_id:Hash, message:TODO<"table">, sender:Url):Void;

	/**
		Called when the script component is reloaded.
		
		This is a callback-function, which is called by the engine when the script component is reloaded, e.g. from the editor.
		It can be used for live development, e.g. to tweak constants or set up the state properly for the instance.
		
		@param self reference to the script state to be used for storing data (script_ref)
	**/
	static function on_reload(self:TODO<"script_ref">):Void;

	/**
		Called every frame to update the script component.
		
		This is a callback-function, which is called by the engine every frame to update the state of a script component.
		It can be used to perform any kind of game related tasks, e.g. moving the game object instance.
		
		@param self reference to the script state to be used for storing data (script_ref)
		@param dt the time-step of the frame update
	**/
	static function update(self:TODO<"script_ref">, dt:TODO):Void;
}

/**
    Data for the `GoMessages.set_parent` message.
**/
typedef GoMessageSetParent = {
	/**
		the id of the new parent (hash)
	**/
	var parent_id:TODO;
	/**
		if the world transform of the instance should be preserved when changing spaces, 0 for false and 1 for true (number)
	**/
	var keep_world_transform:TODO;
}

/**
    Data for the `GoMessages.transform_response` message.
**/
typedef GoMessageTransformResponse = {
	/**
		local position of the instance (vector3)
	**/
	var position:TODO;
	/**
		local rotation of the instance (quaternion)
	**/
	var rotation:TODO;
	/**
		local scale of the instance (number)
	**/
	var scale:TODO;
	/**
		world position of the instance (vector3)
	**/
	var world_position:TODO;
	/**
		world rotation of the instancee (quaternion)
	**/
	var world_rotation:TODO;
	/**
		world scale of the instance (number)
	**/
	var world_scale:TODO;
}

/**
    Messages related to the `Go` module.
**/
@:publicFields class GoMessages {
	/**
		Acquires the user input focus.
		
		Post this message to a game object instance to make that instance acquire the user input focus.
		
		User input is distributed by the engine to every instance that has requested it. The last instance
		to request focus will receive it first. This means that the scripts in the instance will have
		first-hand-chance at reacting on user input, possibly consuming it so that no other instances
		can react on it. The most common case is for a script to send this message to itself when it needs to
		respond to user input.
		
		A script belonging to an instance which has the user input focus will receive the input actions
		in its `on_input` callback function. See `on_input` for more information on
		how user input can be handled.
	**/
	static var acquire_input_focus(default, never):Message<Void> = new Message("acquire_input_focus");

	/**
		Disables the receiving component.
		
		This message disables the receiving component. All components are enabled by default, which means they will receive input, updates
		and be a part of the simulation. A component is disabled when it receives the `disable` message.
		
		*Note!* Components that currently supports this message are:
		
		   * Collection Proxy
		   * Collision Object
		   * Gui
		   * Spine Model
		   * Sprite
		   * Tile Grid
	**/
	static var disable(default, never):Message<Void> = new Message("disable");

	/**
		Enables the receiving component.
		
		This message enables the receiving component. All components are enabled by default, which means they will receive input, updates
		and be a part of the simulation. A component is disabled when it receives the `disable` message.
		
		*Note!* Components that currently supports this message are:
		
		   * Collection Proxy
		   * Collision Object
		   * Gui
		   * Spine Model
		   * Sprite
		   * Tile Grid
	**/
	static var enable(default, never):Message<Void> = new Message("enable");

	/**
		Releases the user input focus.
		
		Post this message to an instance to make that instance release the user input focus.
		See `acquire_input_focus` for more information on how the user input handling
		works.
	**/
	static var release_input_focus(default, never):Message<Void> = new Message("release_input_focus");

	/**
		(DEPRECATED) requests the transform from an instance.
		
		<div>*DEPRECATED!* See the functions `go.get_position`, `go.get_rotation`, etc. for a simpler way to obtain the transform of another game object instance.</div>
		Send this message to an instance to request its transform (position, rotation, scale).
		The sending script will receive the answer as a `transform_response`-message
		at a later time.
	**/
	static var request_transform(default, never):Message<Void> = new Message("request_transform");

	/**
		Sets the parent of the receiving instance.
		
		When this message is sent to an instance, it sets the parent of that instance. This means that the instance will exist
		in the geometrical space of its parent, like a basic transformation hierarchy or scene graph. If no parent is specified,
		the instance will be detached from any parent and exist in world space. A script can send this message to itself to set
		the parent of its instance.
	**/
	static var set_parent(default, never):Message<GoMessageSetParent> = new Message("set_parent");

	/**
		(DEPRECATED) reports back the transform of an instance.
		
		<div>*DEPRECATED!* See the functions `go.get_position`, `go.get_rotation`, etc. for a simpler way to obtain the transform of another game object instance.</div>
		The response a script receives after it has requested the transform from an instance
		using the `request_transform`-message. See the description of that message
		for a complete example on how to use it.
	**/
	static var transform_response(default, never):Message<GoMessageTransformResponse> = new Message("transform_response");
}

/**
    Properties related to the `Go` module.
**/
@:publicFields class GoProperties {
	/**
		Game object euler rotation (vector3).
		
		The rotation of the game object expressed in euler angles.
		Euler angles are specified in degrees.
		The type of the property is vector3.
	**/
	static var euler(default, never):Property<TODO> = new Property("euler");

	/**
		Game object position (vector3).
		
		The position of the game object.
		The type of the property is vector3.
	**/
	static var position(default, never):Property<TODO> = new Property("position");

	/**
		Game object rotation (quaternion).
		
		The rotation of the game object.
		The type of the property is quaternion.
	**/
	static var rotation(default, never):Property<TODO> = new Property("rotation");

	/**
		Game object scale (vector3).
		
		The non-uniform scale of the game object. The type of the property is vector3.
	**/
	static var scale(default, never):Property<TODO> = new Property("scale");
}

@:native("_G.go") extern class GoVariables {
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
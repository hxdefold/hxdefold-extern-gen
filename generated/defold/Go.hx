package defold;

@:native("_G.go") extern class Go {
	/**
		called when a script component is finalized
		
		<div>This is a callback-function, which is called by the engine when a script component is finalized (destroyed). It can
		be used to e.g. take some last action, report the finalization to other game object instances, delete spawned objects
		or release user input focus (see <code>release_input_focus</code>).</div>
		
		@param self reference to the script state to be used for storing data (script_ref)
	**/
	static function final(self:TODO):TODO;
	/**
		animates a named property of the specified game object or component
		
		<p>
		This is only supported for numerical properties. If the node property is already being
		animated, that animation will be canceled and replaced by the new one.
		</p>
		<p>
		If a <code>complete_function</code> (lua function) is specified, that function will be called when the animation has completed.
		By starting a new animation in that function, several animations can be sequenced together. See the examples for more information.
		
		<b>NOTE!</b> If you call <code>go.animate()</code> from a game object's <code>final()</code> function, any passed
		<code>complete_function</code> will be ignored and never called upon animation completion.
		</p>
		<p>
		See the <a href="/doc/properties">properties guide</a> for which properties can be animated and how.
		</p>
		
		@param url url of the game object or component having the property (hash|string|url)
		@param property name of the property to animate (hash|string)
		@param playback playback mode of the animation (constant)
		<ul>
		  <li><code>go.PLAYBACK_ONCE_FORWARD</code></li>
		  <li><code>go.PLAYBACK_ONCE_BACKWARD</code></li>
		  <li><code>go.PLAYBACK_ONCE_PINGPONG</code></li>
		  <li><code>go.PLAYBACK_LOOP_FORWARD</code></li>
		  <li><code>go.PLAYBACK_LOOP_BACKWARD</code></li>
		  <li><code>go.PLAYBACK_LOOP_PINGPONG</code></li>
		</ul>
		@param to target property value (number|vector3|vector4|quaternion)
		@param easing easing to use during animation. Either specify a constant, see the <a href="/doc/properties">properties guide</a> for a complete list, or a vmath.vector with a curve. (constant|vector)
		@param duration duration of the animation in seconds (number)
		@param delay delay before the animation starts in seconds (number)
		@param complete_function function with parameters (self, url, property) to call when the animation has completed (function)
	**/
	static function animate(url:TODO, property:TODO, playback:TODO, to:TODO, easing:TODO, duration:TODO, ?delay:TODO, ?complete_function:TODO):TODO;
	/**
		cancels all animations of the named property of the specified game object or component
		
		<p>
		By calling this function, all stored animations of the given property will be canceled.
		</p>
		<p>
		See the <a href="/doc/properties">properties guide</a> for which properties can be animated and how.
		</p>
		
		@param url url of the game object or component having the property (hash|string|url)
		@param property name of the property to animate (hash|string)
	**/
	static function cancel_animations(url:TODO, property:TODO):TODO;
	/**
		deletes a game object instance
		
		<div>Delete a game object identified by its id.</div>
		
		@param id optional id of the instance to delete, the instance of the calling script is deleted by default (hash|string|url)
	**/
	static function delete(?id:TODO):TODO;
	/**
		deletes a set of game object instance
		
		<div>Delete all game objects simultaneously as listed in table.
		The table values (not keys) should be game object ids (hashes).</div>
		
		@param ids table with values of instance ids (hashes) to be deleted
	**/
	static function delete_all(?ids:TODO):TODO;
	/**
		gets a named property of the specified game object or component
		
		@param url url of the game object or component having the property (hash|string|url)
		@param id id of the property to retrieve (hash|string)
	**/
	static function get(url:TODO, id:TODO):TODO;
	/**
		gets the id of an instance
		
		The instance id is a hash of the absolute path.
		If <code>path</code> is specified, it can either be absolute or relative to the instance of the calling script.
		If <code>path</code> is not specified, the id of the instance of the calling script will be returned. See the examples below for more information.
		
		@param path path of the instance for which to return the id (string)
	**/
	static function get_id(?path:TODO):TODO;
	/**
		gets the position of the instance
		
		The position is relative the parent (if any). Use <code>go.get_world_position</code> to retrieve the global world position.
		
		@param id optional id of the instance to get the position for, by default the instance of the calling script (hash|string|url)
	**/
	static function get_position(?id:TODO):TODO;
	/**
		gets the rotation of the instance
		
		The rotation is relative to the parent (if any). Use <code>go.get_world_rotation</code> to retrieve the global world position.
		
		@param id optional id of the instance to get the rotation for, by default the instance of the calling script (hash|string|url)
	**/
	static function get_rotation(?id:TODO):TODO;
	/**
		gets the uniform scale factor of the instance
		
		The uniform scale is relative the parent (if any). Use <code>go.get_world_scale</code> to retrieve the global world scale factor.
		
		@param id optional id of the instance to get the scale for, by default the instance of the calling script (hash|string|url)
	**/
	static function get_scale(?id:TODO):TODO;
	/**
		gets the 3D scale factor of the instance
		
		The scale is relative the parent (if any). Use <code>go.get_world_scale</code> to retrieve the global world scale factor.
		
		@param id optional id of the instance to get the scale for, by default the instance of the calling script (hash|string|url)
	**/
	static function get_scale_vector(?id:TODO):TODO;
	/**
		gets the instance world position
		
		Use <code>go.get_position</code> to retrieve the position relative to the parent.
		
		@param id optional id of the instance to get the world position for, by default the instance of the calling script (hash|string|url)
	**/
	static function get_world_position(?id:TODO):TODO;
	/**
		gets the instance world rotation
		
		Use <code>go.get_rotation</code> to retrieve the rotation relative to the parent.
		
		@param id optional id of the instance to get the world rotation for, by default the instance of the calling script (hash|string|url)
	**/
	static function get_world_rotation(?id:TODO):TODO;
	/**
		gets the instance world scale factor
		
		Use <code>go.get_scale</code> to retrieve the scale factor relative to the parent.
		
		@param id optional id of the instance to get the world scale for, by default the instance of the calling script (hash|string|url)
	**/
	static function get_world_scale(?id:TODO):TODO;
	/**
		define a property to be used throughout the script
		
		This function defines a property which can then be used in the script through the self-reference.
		The properties defined this way are automatically exposed in the editor in game objects and collections which use the script.
		Note that you can only use this function outside any callback-functions like init and update.
		
		@param name the name of the property (string)
		@param value default value of the property. In the case of a url, only the empty constructor msg.url() is allowed. (number|hash|url|vector3|vector4|quaternion)
	**/
	static function property(name:TODO, value:TODO):TODO;
	/**
		constructs a ray in world space from a position in screen space
		
		Do not use this function, WIP!
		
		@param x x-coordinate of the screen space position (number)
		@param y y-coordinate of the screen space position (number)
	**/
	static function screen_ray(x:TODO, y:TODO):TODO;
	/**
		sets a named property of the specified game object or component
		
		@param url url of the game object or component having the property (hash|string|url)
		@param id id of the property to set (hash|string)
		@param value the value to set (any)
	**/
	static function set(url:TODO, id:TODO, value:TODO):TODO;
	/**
		sets the position of the instance
		
		The position is relative to the parent (if any). The global world position cannot be manually set.
		
		@param position position to set (vector3)
		@param id optional id of the instance to set the position for, by default the instance of the calling script (hash|string|url)
	**/
	static function set_position(position:TODO, ?id:TODO):TODO;
	/**
		sets the rotation of the instance
		
		The rotation is relative to the parent (if any). The global world rotation cannot be manually set.
		
		@param rotation rotation to set (quaternion)
		@param id optional id of the instance to get the rotation for, by default the instance of the calling script (hash|string|url)
	**/
	static function set_rotation(rotation:TODO, ?id:TODO):TODO;
	/**
		sets the scale factor of the instance
		
		The scale factor is relative to the parent (if any). The global world scale factor cannot be manually set.
		
		<b>NOTE!</b> Physics are currently not affected when setting scale from this function.
		
		@param scale vector or uniform scale factor, must be greater than 0 (number|vector3)
		@param id optional id of the instance to get the scale for, by default the instance of the calling script (hash|string|url)
	**/
	static function set_scale(scale:TODO, ?id:TODO):TODO;
	/**
		called when a script component is initialized
		
		This is a callback-function, which is called by the engine when a script component is initialized. It can be used
		to set the initial state of the script.
		
		@param self reference to the script state to be used for storing data (script_ref)
	**/
	static function init(self:TODO):TODO;
	/**
		called when user input is received
		
		<p>
		This is a callback-function, which is called by the engine when user input is sent to the game object instance of the script.
		It can be used to take action on the input, e.g. move the instance according to the input.
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
		called when a message has been sent to the script component
		
		<p>
		This is a callback-function, which is called by the engine whenever a message has been sent to the script component.
		It can be used to take action on the message, e.g. send a response back to the sender of the message.
		</p>
		<p>
		The <code>message</code> parameter is a table containing the message data. If the message is sent from the engine, the
		documentation of the message specifies which data is supplied.
		</p>
		
		@param self reference to the script state to be used for storing data (script_ref)
		@param message_id id of the received message (hash)
		@param message a table containing the message data (table)
		@param sender address of the sender (url)
	**/
	static function on_message(self:TODO, message_id:TODO, message:TODO, sender:TODO):TODO;
	/**
		called when the script component is reloaded
		
		<p>
		This is a callback-function, which is called by the engine when the script component is reloaded, e.g. from the editor.
		It can be used for live development, e.g. to tweak constants or set up the state properly for the instance.
		</p>
		
		@param self reference to the script state to be used for storing data (script_ref)
	**/
	static function on_reload(self:TODO):TODO;
	/**
		called every frame to update the script component
		
		This is a callback-function, which is called by the engine every frame to update the state of a script component.
		It can be used to perform any kind of game related tasks, e.g. moving the game object instance.
		
		@param self reference to the script state to be used for storing data (script_ref)
		@param dt the time-step of the frame update
	**/
	static function update(self:TODO, dt:TODO):TODO;
}

@:publicFields class GoMessages {
	/**
		acquires the user input focus
		
		<p>
		Post this message to a game object instance to make that instance acquire the user input focus.
		</p>
		<p>
		User input is distributed by the engine to every instance that has requested it. The last instance
		to request focus will receive it first. This means that the scripts in the instance will have
		first-hand-chance at reacting on user input, possibly consuming it so that no other instances
		can react on it. The most common case is for a script to send this message to itself when it needs to
		respond to user input.
		</p>
		<p>
		A script belonging to an instance which has the user input focus will receive the input actions
		in its <code>on_input</code> callback function. See <code>on_input</code> for more information on
		how user input can be handled.
		</p>
	**/
	static var AcquireInputFocus(default, never) : Message<{ }> = new Message("acquire_input_focus");
	/**
		disables the receiving component
		
		<p>
		This message disables the receiving component. For more information what this actually means, please see the message <code>enable</code>.
		</p>
		
		<P>
		<b>Note!</b> Not all components support this message yet. Supported components are:
		<ul>
		  <li>Collection Proxy</li>
		  <li>Collision Object</li>
		  <li>Gui</li>
		  <li>Sprite</li>
		</ul>
		</p>
	**/
	static var Disable(default, never) : Message<{ }> = new Message("disable");
	/**
		enables the receiving component
		
		<p>
		This message enables the receiving component. All components are enabled by default, which means they will receive updates
		and be a part of the simulation. A component is disabled when it receives the <code>disable</code> message. For more details
		about the effects on each component, see the <it>User Guide</it>.
		</p>
		
		<P>
		<b>Note!</b> Not all components support this message yet. Supported components are:
		<ul>
		  <li>Collection Proxy</li>
		  <li>Collision Object</li>
		  <li>Gui</li>
		  <li>Sprite</li>
		</ul>
		</p>
	**/
	static var Enable(default, never) : Message<{ }> = new Message("enable");
	/**
		releases the user input focus
		
		Post this message to an instance to make that instance release the user input focus.
		See <code>acquire_input_focus</code> for more information on how the user input handling
		works.
	**/
	static var ReleaseInputFocus(default, never) : Message<{ }> = new Message("release_input_focus");
	/**
		(DEPRECATED) requests the transform from an instance
		
		<div><b>DEPRECATED!</b> See the functions <code>go.get_position</code>, <code>go.get_rotation</code>, etc. for a simpler way to obtain the transform of another game object instance.</div>
		Send this message to an instance to request its transform (position, rotation, scale).
		The sending script will receive the answer as a <code>transform_response</code>-message
		at a later time.
	**/
	static var RequestTransform(default, never) : Message<{ }> = new Message("request_transform");
	/**
		sets the parent of the receiving instance
		
		When this message is sent to an instance, it sets the parent of that instance. This means that the instance will exist
		in the geometrical space of its parent, like a basic transformation hierarchy or scene graph. If no parent is specified,
		the instance will be detached from any parent and exist in world space. A script can send this message to itself to set
		the parent of its instance.
		
		@param parent_id the id of the new parent (hash)
		@param keep_world_transform if the world transform of the instance should be preserved when changing spaces, 0 for false and 1 for true (number)
	**/
	static var SetParent(default, never) : Message<{ var parent_id : TODO; var keep_world_transform : TODO; }> = new Message("set_parent");
	/**
		(DEPRECATED) reports back the transform of an instance
		
		<div><b>DEPRECATED!</b> See the functions <code>go.get_position</code>, <code>go.get_rotation</code>, etc. for a simpler way to obtain the transform of another game object instance.</div>
		The response a script receives after it has requested the transform from an instance
		using the <code>request_transform</code>-message. See the description of that message
		for a complete example on how to use it.
		
		@param position local position of the instance (vector3)
		@param rotation local rotation of the instance (quaternion)
		@param scale local scale of the instance (number)
		@param world_position world position of the instance (vector3)
		@param world_rotation world rotation of the instancee (quaternion)
		@param world_scale world scale of the instance (number)
	**/
	static var TransformResponse(default, never) : Message<{ var position : TODO; var rotation : TODO; var scale : TODO; var world_position : TODO; var world_rotation : TODO; var world_scale : TODO; }> = new Message("transform_response");
}

@:publicFields class GoProperties {
	/**
		game object euler rotation (vector3)
		
		The rotation of the game object expressed in euler angles.
		Euler angles are specified in degrees.
		The type of the property is vector3.
	**/
	static var Euler(default, never) : Property<TODO> = new Property("euler");
	/**
		game object position (vector3)
		
		The position of the game object.
		The type of the property is vector3.
	**/
	static var Position(default, never) : Property<TODO> = new Property("position");
	/**
		game object rotation (quaternion)
		
		The rotation of the game object.
		The type of the property is quaternion.
	**/
	static var Rotation(default, never) : Property<TODO> = new Property("rotation");
	/**
		game object scale (vector3)
		
		The non-uniform scale of the game object. The type of the property is vector3.
	**/
	static var Scale(default, never) : Property<TODO> = new Property("scale");
}

@:native("_G.go") extern class GoVariables {
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
		no playback
	**/
	static var PLAYBACK_NONE(default, never) : TODO;
	/**
		once backward
	**/
	static var PLAYBACK_ONCE_BACKWARD(default, never) : TODO;
	/**
		once forward
	**/
	static var PLAYBACK_ONCE_FORWARD(default, never) : TODO;
	/**
		once ping pong
	**/
	static var PLAYBACK_ONCE_PINGPONG(default, never) : TODO;
}
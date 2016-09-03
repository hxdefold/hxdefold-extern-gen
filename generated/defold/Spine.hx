package defold;

@:native("_G.spine") extern class Spine {
	/**
		cancel all animation on a spine model
		
		@param url the spine model for which to cancel the animation (url)
	**/
	static function cancel(url:TODO):TODO;
	/**
		retrieve the game object corresponding to a spine model skeleton bone
		
		The returned game object can be used for parenting and transform queries.
		This function has complexity O(n), where n is the number of bones in the spine model skeleton.
		Game objects corresponding to a spine model skeleton bone can not be individually deleted.
		Only available from .script files.
		
		@param url the spine model to query (url)
		@param bone_id id of the corresponding bone (string|hash)
	**/
	static function get_go(url:TODO, bone_id:TODO):TODO;
	/**
		play an animation on a spine model
		
		@param url the spine model for which to play the animation (url)
		@param animation_id id of the animation to play (string|hash)
		@param playback playback mode of the animation (constant)
		<ul>
		  <li><code>go.PLAYBACK_ONCE_FORWARD</code></li>
		  <li><code>go.PLAYBACK_ONCE_BACKWARD</code></li>
		  <li><code>go.PLAYBACK_ONCE_PINGPONG</code></li>
		  <li><code>go.PLAYBACK_LOOP_FORWARD</code></li>
		  <li><code>go.PLAYBACK_LOOP_BACKWARD</code></li>
		  <li><code>go.PLAYBACK_LOOP_PINGPONG</code></li>
		</ul>
		@param blend_duration duration of a linear blend between the current and new animations
		@param complete_function function to call when the animation has completed (function)
	**/
	static function play(url:TODO, animation_id:TODO, playback:TODO, blend_duration:TODO, ?complete_function:TODO):TODO;
	/**
		reset a shader constant for a spine model
		
		The constant must be defined in the material assigned to the spine model.
		Resetting a constant through this function implies that the value defined in the material will be used.
		Which spine model to reset a constant for is identified by the URL.
		
		@param url the spine model that should have a constant reset (url)
		@param name of the constant (string|hash)
	**/
	static function reset_constant(url:TODO, name:TODO):TODO;
	/**
		set a shader constant for a spine model
		
		The constant must be defined in the material assigned to the spine model.
		Setting a constant through this function will override the value set for that constant in the material.
		The value will be overridden until spine.reset_constant is called.
		Which spine model to set a constant for is identified by the URL.
		
		@param url the spine model that should have a constant set (url)
		@param name of the constant (string|hash)
		@param value of the constant (vec4)
	**/
	static function set_constant(url:TODO, name:TODO, value:TODO):TODO;
	/**
		set the IK constraint object target position to follow position of a game object
		
		Only available from .script files.
		
		@param url the spine model containing the object (url)
		@param ik_constraint_id id of the corresponding IK constraint object (string|hash)
		@param target_url target game object (url)
	**/
	static function set_ik_target(url:TODO, ik_constraint_id:TODO, target_url:TODO):TODO;
	/**
		set the target position of an IK constraint object
		
		Only available from .script files.
		
		@param url the spine model containing the object (url)
		@param ik_constraint_id id of the corresponding IK constraint object (string|hash)
		@param position (vec3)
	**/
	static function set_ik_target_position(url:TODO, ik_constraint_id:TODO, position:TODO):TODO;
}

@:publicFields class SpineMessages {
	/**
		reports the completion of a Spine animation
		
		<p>
		This message is sent when a Spine animation has finished playing back to the script
		that started the animation. This message is sent only for animations that play with
		the following playback modes and no message is sent if the animation is cancelled with
		spine.cancel():
		<ul>
		 <li>go.PLAYBACK_ONCE_FORWARD</li>
		 <li>go.PLAYBACK_ONCE_BACKWARD</li>
		 <li>go.PLAYBACK_ONCE_PINGPONG</li>
		</ul>
		</p>
		
		@param animation_id the id of the completed animation (hash)
		@param playback the playback mode of the completed animation (constant)
	**/
	static var SpineAnimationDone(default, never) : Message<{ var animation_id : TODO; var playback : TODO; }> = new Message("spine_animation_done");
	/**
		reports an incoming event from the Spine animation
		
		<p>
		This message is sent when Spine animation playback fires events. These events
		has to be defined on the animation track in the Spine animation editor. An event
		can contain custom values expressed in the fields "integer", "float" and "string".
		</p>
		
		@param event_id the id of the event (hash)
		@param animation_id the id of the animation (hash)
		@param t the time of the event in seconds, relative to the start of the animation (number)
		@param blend_weight the blend weight (between 0.0-1.0) of the current animation at time t (number)
		@param integer user defined integer value for the event (number)
		@param float user defined floating point value for the event (number)
		@param string user defined string value for the event (hash)
	**/
	static var SpineEvent(default, never) : Message<{ var event_id : TODO; var animation_id : TODO; var t : TODO; var blend_weight : TODO; var integer : TODO; var float : TODO; var string : TODO; }> = new Message("spine_event");
}
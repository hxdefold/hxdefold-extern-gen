package defold;

/**
	Functions and messages for interacting with model components.

	See `ModelProperties` for related properties.
**/
@:native("_G.model") extern class Model {
	/**
		Cancel all animation on a model.
		
		@param url the model for which to cancel the animation (url)
	**/
	static function cancel(url:Url):Void;

	/**
		Retrieve the game object corresponding to a model skeleton bone.
		
		The returned game object can be used for parenting and transform queries.
		This function has complexity O(n), where n is the number of bones in the model skeleton.
		Game objects corresponding to a model skeleton bone can not be individually deleted.
		Only available from .script files.
		
		@param url the model to query (url)
		@param bone_id id of the corresponding bone (string|hash)
		@return id of the game object
	**/
	static function get_go(url:Url, bone_id:EitherType<Hash, String>):TODO;

	/**
		Play an animation on a model.
		
		@param url the model for which to play the animation (url)
		@param anim_id id of the animation to play (string|hash)
		@param playback playback mode of the animation (constant)
		
		   * `go.PLAYBACK_ONCE_FORWARD`
		   * `go.PLAYBACK_ONCE_BACKWARD`
		   * `go.PLAYBACK_ONCE_PINGPONG`
		   * `go.PLAYBACK_LOOP_FORWARD`
		   * `go.PLAYBACK_LOOP_BACKWARD`
		   * `go.PLAYBACK_LOOP_PINGPONG`
		
		@param play_properties optional table with properties (table)
		
		   * `blend_duration` duration of a linear blend between the current and new animation (number)
		   * `offset` the normalized initial value of the animation cursor when the animation starts playing (number)
		   * `playback_rate` the rate with which the animation will be played. Must be positive (number)
	**/
	static function play_anim(url:Url, anim_id:EitherType<Hash, String>, playback:TODO, ?play_properties:TODO):Void;

	/**
		Reset a shader constant for a model.
		
		The constant must be defined in the material assigned to the model.
		Resetting a constant through this function implies that the value defined in the material will be used.
		Which model to reset a constant for is identified by the URL.
		
		@param url the model that should have a constant reset (url)
		@param name of the constant (string|hash)
	**/
	static function reset_constant(url:Url, name:EitherType<Hash, String>):Void;

	/**
		Set a shader constant for a model component.
		
		The constant must be defined in the material assigned to the model.
		Setting a constant through this function will override the value set for that constant in the material.
		The value will be overridden until model.reset_constant is called.
		Which model to set a constant for is identified by the URL.
		
		@param url the model that should have a constant set (url)
		@param name of the constant (string|hash)
		@param value of the constant (vec4)
	**/
	static function set_constant(url:Url, name:EitherType<Hash, String>, value:Vector4):Void;
}

/**
	Properties related to the `Model` module.
**/
@:publicFields class ModelProperties {
	/**
		Model cursor (number).
		
		The normalized animation cursor. The type of the property is number.
	**/
	static var cursor(default, never):Property<TODO> = new Property("cursor");

	/**
		Model playback_rate (number).
		
		The animation playback rate. A multiplier to the animation playback rate. The type of the property is number.
	**/
	static var playback_rate(default, never):Property<TODO> = new Property("playback_rate");
}
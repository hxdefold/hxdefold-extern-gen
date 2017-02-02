package defold;

/**
	Functions, messages and properties used to manipulate sprite components.

	See `SpriteMessages` for related messages.
	See `SpriteProperties` for related properties.
**/
@:native("_G.sprite") extern class Sprite {
	/**
		Reset a shader constant for a sprite.
		
		The constant must be defined in the material assigned to the sprite.
		Resetting a constant through this function implies that the value defined in the material will be used.
		Which sprite to reset a constant for is identified by the URL.
		
		@param url the sprite that should have a constant reset (url)
		@param name of the constant (string|hash)
	**/
	static function reset_constant(url:TODO, name:TODO):TODO;
	/**
		Set a shader constant for a sprite.
		
		The constant must be defined in the material assigned to the sprite.
		Setting a constant through this function will override the value set for that constant in the material.
		The value will be overridden until sprite.reset_constant is called.
		Which sprite to set a constant for is identified by the URL.
		
		@param url the sprite that should have a constant set (url)
		@param name of the constant (string|hash)
		@param value of the constant (vec4)
	**/
	static function set_constant(url:TODO, name:TODO, value:TODO):TODO;
	/**
		Make a sprite flip the animations horizontally or not.
		
		Which sprite to flip is identified by the URL.
		If the currently playing animation is flipped by default, flipping it again will make it appear like the original texture.
		
		@param url the sprite that should flip its animations (url)
		@param flip if the sprite should flip its animations or not (boolean)
	**/
	static function set_hflip(url:TODO, flip:TODO):TODO;
	/**
		Make a sprite flip the animations vertically or not.
		
		Which sprite to flip is identified by the URL.
		If the currently playing animation is flipped by default, flipping it again will make it appear like the original texture.
		
		@param url the sprite that should flip its animations (url)
		@param flip if the sprite should flip its animations or not (boolean)
	**/
	static function set_vflip(url:TODO, flip:TODO):TODO;
}

/**
	Data for the `SpriteMessages.animation_done` message.
**/
typedef SpriteMessageAnimationDone = {
	/**
		the current tile of the sprite (number)
	**/
	var current_tile : TODO;
	/**
		id of the animation that was completed (hash)
	**/
	var id : TODO;
}

/**
	Data for the `SpriteMessages.play_animation` message.
**/
typedef SpriteMessagePlayAnimation = {
	/**
		the id of the animation to play
	**/
	var id : TODO;
}

/**
	Messages related to the `Sprite` module.
**/
@:publicFields class SpriteMessages {
	/**
		Reports that an animation has completed.
		
		This message is sent to the sender of a `play_animation` message when the
		animation has completed.
		
		Note that this message is sent only for animations that play with the following
		playback modes:
		
		 * Once Forward
		 * Once Backward
		 * Once Ping Pong
		
		See `play_animation` for more information and examples of how to use
		this message.
	**/
	static var animation_done(default, never) : Message<SpriteMessageAnimationDone> = new Message("animation_done");
	/**
		Plays a sprite animation.
		
		Post this message to a sprite-component to make it play an animation from its tile set.
	**/
	static var play_animation(default, never) : Message<SpriteMessagePlayAnimation> = new Message("play_animation");
}

/**
	Properties related to the `Sprite` module.
**/
@:publicFields class SpriteProperties {
	/**
		Sprite scale (vector3).
		
		The non-uniform scale of the sprite. The type of the property is vector3.
	**/
	static var scale(default, never) : Property<TODO> = new Property("scale");
	/**
		Sprite size (vector3).
		
		[READ ONLY] Returns the size of the sprite, not allowing for any additional scaling that may be applied.
		The type of the property is vector3.
	**/
	static var size(default, never) : Property<TODO> = new Property("size");
}
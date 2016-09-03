package defold;

@:native("_G.sprite") extern class Sprite {
	/**
		reset a shader constant for a sprite
		
		The constant must be defined in the material assigned to the sprite.
		Resetting a constant through this function implies that the value defined in the material will be used.
		Which sprite to reset a constant for is identified by the URL.
		
		@param url the sprite that should have a constant reset (url)
		@param name of the constant (string|hash)
	**/
	static function reset_constant(url:TODO, name:TODO):TODO;
	/**
		set a shader constant for a sprite
		
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
		make a sprite flip the animations horizontally or not
		
		Which sprite to flip is identified by the URL.
		If the currently playing animation is flipped by default, flipping it again will make it appear like the original texture.
		
		@param url the sprite that should flip its animations (url)
		@param flip if the sprite should flip its animations or not (boolean)
	**/
	static function set_hflip(url:TODO, flip:TODO):TODO;
	/**
		make a sprite flip the animations vertically or not
		
		Which sprite to flip is identified by the URL.
		If the currently playing animation is flipped by default, flipping it again will make it appear like the original texture.
		
		@param url the sprite that should flip its animations (url)
		@param flip if the sprite should flip its animations or not (boolean)
	**/
	static function set_vflip(url:TODO, flip:TODO):TODO;
}

@:publicFields class SpriteMessages {
	/**
		reports that an animation has completed
		
		This message is sent to the sender of a <code>play_animation</code> message when the animation has completed.
		Note that only animations played either forward or backward once ever completes. See <code>play_animation</code>
		for more information and examples of how to use this message.
		
		@param current_tile the current tile of the sprite (number)
		@param id id of the animation that was completed (hash)
	**/
	static var AnimationDone(default, never) : Message<{ var current_tile : TODO; var id : TODO; }> = new Message("animation_done");
	/**
		plays a sprite animation
		
		<p>
		Post this message to a sprite-component to make it play an animation from its tile set.
		</p>
		
		@param id the id of the animation to play
	**/
	static var PlayAnimation(default, never) : Message<{ var id : TODO; }> = new Message("play_animation");
}

@:publicFields class SpriteProperties {
	/**
		sprite scale (vector3)
		
		The non-uniform scale of the sprite. The type of the property is vector3.
	**/
	static var Scale(default, never) : Property<TODO> = new Property("scale");
	/**
		sprite size (vector3)
		
		[READ ONLY] Returns the size of the sprite, not allowing for any additional scaling that may be applied.
		The type of the property is vector3.
	**/
	static var Size(default, never) : Property<TODO> = new Property("size");
}
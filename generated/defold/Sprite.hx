package defold;

/**
    <p>Functions, messages and properties used to manipulate sprite components.</p>

    See `SpriteProperties` for related properties.
    See `SpriteMessages` for related messages.
**/
@:native("_G.sprite")
extern class Sprite {
    /**
        Play an animation on a sprite component.
        
        Play an animation on a sprite component from its tile set
        
        An optional completion callback function can be provided that will be called when
        the animation has completed playing. If no function is provided,
        a `animation_done` message is sent to the script that started the animation.
        
        @param url 
        <span class="type">string | hash | url</span> the sprite that should play the animation
        
        @param id 
        hash name hash of the animation to play
        
        @param complete_function 
        <span class="type">function(self, message_id, message, sender))</span> function to call when the animation has completed.
        
        <dl>
        <dt>`self`</dt>
        <dd><span class="type">object</span> The current object.</dd>
        <dt>`message_id`</dt>
        <dd><span class="type">hash</span> The name of the completion message, `"animation_done"`.</dd>
        <dt>`message`</dt>
        <dd><span class="type">table</span> Information about the completion:</dd>
        </dl>
        
         * <span class="type">number</span> `current_tile` - the current tile of the sprite.
         * <span class="type">hash</span> `id` - id of the animation that was completed.
        
        <dl>
        <dt>`sender`</dt>
        <dd><span class="type">url</span> The invoker of the callback: the sprite component.</dd>
        </dl>
    **/
    static function play_flipbook(url:EitherType<Url, EitherType<Hash, String>>, id:TODO, ?complete_function:TODO<"function(self, message_id, message, sender))">):Void;

    /**
        Reset a shader constant for a sprite.
        
        Resets a shader constant for a sprite component.
        The constant must be defined in the material assigned to the sprite.
        Resetting a constant through this function implies that the value defined in the material will be used.
        Which sprite to reset a constant for is identified by the URL.
        
        @param url 
        <span class="type">string | hash | url</span> the sprite that should have a constant reset
        
        @param constant 
        <span class="type">string | hash</span> name of the constant
    **/
    static function reset_constant(url:EitherType<Url, EitherType<Hash, String>>, constant:EitherType<Hash, String>):Void;

    /**
        Set a shader constant for a sprite.
        
        Sets a shader constant for a sprite component.
        The constant must be defined in the material assigned to the sprite.
        Setting a constant through this function will override the value set for that constant in the material.
        The value will be overridden until `sprite.reset_constant` is called.
        Which sprite to set a constant for is identified by the URL.
        
        @param url 
        <span class="type">string | hash | url</span> the sprite that should have a constant set
        
        @param constant 
        <span class="type">string | hash</span> name of the constant
        
        @param value 
        <span class="type">vector4</span> of the constant
    **/
    static function set_constant(url:EitherType<Url, EitherType<Hash, String>>, constant:EitherType<Hash, String>, value:Vector4):Void;

    /**
        Set horizontal flipping on a sprite's animations.
        
        Sets horizontal flipping of the provided sprite's animations.
        The sprite is identified by its URL.
        If the currently playing animation is flipped by default, flipping it again will make it appear like the original texture.
        
        @param url 
        <span class="type">string | hash | url</span> the sprite that should flip its animations
        
        @param flip 
        <span class="type">boolean</span> `true` if the sprite should flip its animations, `false` if not
    **/
    static function set_hflip(url:EitherType<Url, EitherType<Hash, String>>, flip:TODO<"boolean">):Void;

    /**
        Set vertical flipping on a sprite's animations.
        
        Sets vertical flipping of the provided sprite's animations.
        The sprite is identified by its URL.
        If the currently playing animation is flipped by default, flipping it again will make it appear like the original texture.
        
        @param url 
        <span class="type">string | hash | url</span> the sprite that should flip its animations
        
        @param flip 
        <span class="type">boolean</span> `true` if the sprite should flip its animations, `false` if not
    **/
    static function set_vflip(url:EitherType<Url, EitherType<Hash, String>>, flip:TODO<"boolean">):Void;
}

/**
    Properties related to the `Sprite` module.
**/
@:publicFields
class SpriteProperties {
    /**
        <span class="type">vector3</span> sprite scale.
        
        The non-uniform scale of the sprite. The type of the property is vector3.
    **/
    static var scale(default, never) = new Property<TODO>("scale");

    /**
        <span class="type">vector3</span> sprite size.
        
        <span class="mark">READ ONLY</span> Returns the size of the sprite, not allowing for any additional scaling that may be applied.
        The type of the property is vector3.
    **/
    static var size(default, never) = new Property<TODO>("size");

    /**
        <span class="type">hash</span> sprite texture0.
        
        <span class="mark">READ ONLY</span> Returns the texture path hash of the sprite. Used for getting/setting resource data
    **/
    static var texture0(default, never) = new Property<TODO>("texture0");
}

/**
    Messages related to the `Sprite` module.
**/
@:publicFields
class SpriteMessages {
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
    static var animation_done(default, never) = new Message<SpriteMessageAnimationDone>("animation_done");

    /**
        Play a sprite animation.
        
        Post this message to a sprite component to make it play an animation from its tile set.
    **/
    static var play_animation(default, never) = new Message<SpriteMessagePlayAnimation>("play_animation");
}

/**
    Data for the `SpriteMessages.animation_done` message.
**/
typedef SpriteMessageAnimationDone = {
    /**
        
        <span class="type">number</span> the current tile of the sprite
        
    **/
    var current_tile:Float;

    /**
        
        <span class="type">hash</span> id of the animation that was completed
        
    **/
    var id:Hash;
}

/**
    Data for the `SpriteMessages.play_animation` message.
**/
typedef SpriteMessagePlayAnimation = {
    /**
        
        <span class="type">hash</span> the id of the animation to play
        
    **/
    var id:Hash;
}
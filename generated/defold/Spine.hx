package defold;

/**
    <p>Functions and messages for interacting with the 'Spine' 2D bone
    animation system.</p>

    See `SpineProperties` for related properties.
    See `SpineMessages` for related messages.
**/
@:native("_G.spine")
extern class Spine {
    /**
        Cancel all animation on a spine model.
        
        Cancels all running animations on a specified spine model component.
        
        @param url 
        <span class="type">string | hash | url</span> the spine model for which to cancel the animation
    **/
    static function cancel(url:EitherType<Url, EitherType<Hash, String>>):Void;

    /**
        Retrieve the game object corresponding to a spine model skeleton bone.
        
        Returns the id of the game object that corresponds to a specified skeleton bone.
        The returned game object can be used for parenting and transform queries.
        This function has complexity `O(n)`, where `n` is the number of bones in the spine model skeleton.
        Game objects corresponding to a spine model skeleton bone can not be individually deleted.
        
        @param url 
        <span class="type">string | hash | url</span> the spine model to query
        
        @param bone_id 
        <span class="type">string | hash</span> id of the corresponding bone
        
        @return id 
        <span class="type">hash</span> id of the game object
    **/
    static function get_go(url:EitherType<Url, EitherType<Hash, String>>, bone_id:EitherType<Hash, String>):TODO;

    /**
        Play an animation on a spine model.
        
        Plays a specified animation on a spine model component with specified playback
        mode and parameters.
        
        An optional completion callback function can be provided that will be called when
        the animation has completed playing. If no function is provided,
        a `spine_animation_done` message is sent to the script that started the animation.
        
        <span class="icon-attention"></span> The callback is not called (or message sent) if the animation is
        cancelled with `spine.cancel`. The callback is called (or message sent) only for
        animations that play with the following playback modes:
        
         * `go.PLAYBACK_ONCE_FORWARD`
         * `go.PLAYBACK_ONCE_BACKWARD`
         * `go.PLAYBACK_ONCE_PINGPONG`
        
        @param url 
        <span class="type">string | hash | url</span> the spine model for which to play the animation
        
        @param anim_id 
        <span class="type">string | hash</span> id of the animation to play
        
        @param playback 
        <span class="type">constant</span> playback mode of the animation
        
         * `go.PLAYBACK_ONCE_FORWARD`
         * `go.PLAYBACK_ONCE_BACKWARD`
         * `go.PLAYBACK_ONCE_PINGPONG`
         * `go.PLAYBACK_LOOP_FORWARD`
         * `go.PLAYBACK_LOOP_BACKWARD`
         * `go.PLAYBACK_LOOP_PINGPONG`
        
        @param play_properties 
        <span class="type">table</span> optional table with properties:
        
        <dl>
        <dt>`blend_duration`</dt>
        <dd><span class="type">number</span> duration of a linear blend between the current and new animation.</dd>
        <dt>`offset`</dt>
        <dd><span class="type">number</span> the normalized initial value of the animation cursor when the animation starts playing.</dd>
        <dt>`playback_rate`</dt>
        <dd><span class="type">number</span> the rate with which the animation will be played. Must be positive.</dd>
        </dl>
        @param complete_function 
        <span class="type">function(self, message_id, message, sender))</span> function to call when the animation has completed.
        
        <dl>
        <dt>`self`</dt>
        <dd><span class="type">object</span> The current object.</dd>
        <dt>`message_id`</dt>
        <dd><span class="type">hash</span> The name of the completion message, `"spine_animation_done"`.</dd>
        <dt>`message`</dt>
        <dd><span class="type">table</span> Information about the completion:</dd>
        </dl>
        
         * <span class="type">hash</span> `animation_id` - the animation that was completed.
         * <span class="type">constant</span> `playback` - the playback mode for the animation.
        
        <dl>
        <dt>`sender`</dt>
        <dd><span class="type">url</span> The invoker of the callback: the spine model component.</dd>
        </dl>
    **/
    static function play_anim(url:EitherType<Url, EitherType<Hash, String>>, anim_id:EitherType<Hash, String>, playback:TODO<"constant">, ?play_properties:TODO<"table">, ?complete_function:TODO<"function(self, message_id, message, sender))">):Void;

    /**
        Reset a shader constant for a spine model.
        
        Resets a shader constant for a spine model component.
        The constant must be defined in the material assigned to the spine model.
        Resetting a constant through this function implies that the value defined in the material will be used.
        Which spine model to reset a constant for is identified by the URL.
        
        @param url 
        <span class="type">string | hash | url</span> the spine model that should have a constant reset
        
        @param constant 
        <span class="type">string | hash</span> name of the constant
    **/
    static function reset_constant(url:EitherType<Url, EitherType<Hash, String>>, constant:EitherType<Hash, String>):Void;

    /**
        Set a shader constant for a spine model.
        
        Sets a shader constant for a spine model component.
        The constant must be defined in the material assigned to the spine model.
        Setting a constant through this function will override the value set for that constant in the material.
        The value will be overridden until spine.reset_constant is called.
        Which spine model to set a constant for is identified by the URL.
        
        @param url 
        <span class="type">string | hash | url</span> the spine model that should have a constant set
        
        @param constant 
        <span class="type">string | hash</span> name of the constant
        
        @param value 
        <span class="type">vector4</span> value of the constant
    **/
    static function set_constant(url:EitherType<Url, EitherType<Hash, String>>, constant:EitherType<Hash, String>, value:Vector4):Void;

    /**
        Set the IK constraint object target position to follow position of a game object.
        
        Sets a game object as target position of an inverse kinematic (IK) object. As the
        target game object's position is updated, the constraint object is updated with the
        new position.
        
        @param url 
        <span class="type">string | hash | url</span> the spine model containing the object
        
        @param ik_constraint_id 
        <span class="type">string | hash</span> id of the corresponding IK constraint object
        
        @param target_url 
        <span class="type">string | hash | url</span> target game object
    **/
    static function set_ik_target(url:EitherType<Url, EitherType<Hash, String>>, ik_constraint_id:EitherType<Hash, String>, target_url:EitherType<Url, EitherType<Hash, String>>):Void;

    /**
        Set the target position of an IK constraint object.
        
        Sets a static (vector3) target position of an inverse kinematic (IK) object.
        
        @param url 
        <span class="type">string | hash | url</span> the spine model containing the object
        
        @param ik_constraint_id 
        <span class="type">string | hash</span> id of the corresponding IK constraint object
        
        @param position 
        <span class="type">vector3</span> target position
    **/
    static function set_ik_target_position(url:EitherType<Url, EitherType<Hash, String>>, ik_constraint_id:EitherType<Hash, String>, position:Vector3):Void;
}

/**
    Properties related to the `Spine` module.
**/
@:publicFields
class SpineProperties {
    /**
        <span class="type">hash</span> spine animation.
        
        The current animation set on the component. The type of the property is hash.
    **/
    static var animation(default, never) = new Property<TODO>("animation");

    /**
        <span class="type">number</span> spine cursor.
        
        The normalized animation cursor. The type of the property is number.
        
        <span class="icon-attention"></span> Please note that spine events may not fire as expected when the cursor is manipulated directly.
    **/
    static var cursor(default, never) = new Property<TODO>("cursor");

    /**
        <span class="type">number</span> spine playback_rate.
        
        The animation playback rate. A multiplier to the animation playback rate. The type of the property is number.
        
        The playback_rate is a non-negative number, a negative value will be clamped to 0.
    **/
    static var playback_rate(default, never) = new Property<TODO>("playback_rate");

    /**
        <span class="type">hash</span> spine skin.
        
        The current skin on the component. The type of the property is hash.
        If setting the skin property the skin must be present on the spine
        model or a runtime error is signalled.
    **/
    static var skin(default, never) = new Property<TODO>("skin");
}

/**
    Messages related to the `Spine` module.
**/
@:publicFields
class SpineMessages {
    /**
        Reports the completion of a Spine animation.
        
        This message is sent when a Spine animation has finished playing back to the script
        that started the animation.
        
        <span class="icon-attention"></span> No message is sent if a completion callback function was supplied
        when the animation was started. No message is sent if the animation is cancelled with
        model.cancel(). This message is sent only for animations that play with
        the following playback modes:
        
         * `go.PLAYBACK_ONCE_FORWARD`
         * `go.PLAYBACK_ONCE_BACKWARD`
         * `go.PLAYBACK_ONCE_PINGPONG`
    **/
    static var spine_animation_done(default, never) = new Message<SpineMessageSpineAnimationDone>("spine_animation_done");

    /**
        Reports an incoming event from the Spine animation.
        
        This message is sent when Spine animation playback fires events. These events
        has to be defined on the animation track in the Spine animation editor. An event
        can contain custom values expressed in the fields `integer`, `float` and `string`.
    **/
    static var spine_event(default, never) = new Message<SpineMessageSpineEvent>("spine_event");
}

/**
    Data for the `SpineMessages.spine_animation_done` message.
**/
typedef SpineMessageSpineAnimationDone = {
    /**
        
        <span class="type">hash</span> the id of the completed animation
        
    **/
    var animation_id:Hash;

    /**
        
        <span class="type">constant</span> the playback mode of the completed animation
        
    **/
    var playback:TODO<"constant">;
}

/**
    Data for the `SpineMessages.spine_event` message.
**/
typedef SpineMessageSpineEvent = {
    /**
        
        <span class="type">hash</span> the id of the event.
        
    **/
    var event_id:Hash;

    /**
        
        <span class="type">hash</span> the id of the animation.
        
    **/
    var animation_id:Hash;

    /**
        
        <span class="type">number</span> the time of the event in seconds, relative to the start of the animation.
        
    **/
    var t:Float;

    /**
        
        [type:number the blend weight (between 0.0-1.0) of the current animation at time t.
        
    **/
    var blend_weight:TODO;

    /**
        
        <span class="type">number</span> user defined integer value for the event
        
    **/
    var integer:Float;

    /**
        
        <span class="type">number</span> user defined floating point value for the event
        
    **/
    var float:Float;

    /**
        
        <span class="type">hash</span> user defined string value (hashed) for the event
        
    **/
    var string:Hash;
}
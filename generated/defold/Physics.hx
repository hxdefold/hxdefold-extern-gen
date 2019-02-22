package defold;

/**
    <p>Functions and messages for collision object physics interaction
    with other objects (collisions and ray-casting) and control of
    physical behaviors.</p>

    See `PhysicsProperties` for related properties.
    See `PhysicsMessages` for related messages.
**/
@:native("_G.physics")
extern class Physics {
    /**
        Requests a ray cast to be performed.
        
        Ray casts are used to test for intersections against collision objects in the physics world.
        Collision objects of types kinematic, dynamic and static are tested against. Trigger objects
        do not intersect with ray casts.
        Which collision objects to hit is filtered by their collision groups and can be configured
        through `groups`.
        The actual ray cast will be performed during the physics-update.
        
         * If an object is hit, the result will be reported via a `ray_cast_response` message.
         * If there is no object hit, the result will be reported via a `ray_cast_missed` message.
        
        @param from 
        <span class="type">vector3</span> the world position of the start of the ray
        
        @param to 
        <span class="type">vector3</span> the world position of the end of the ray
        
        @param groups 
        <span class="type">table</span> a lua table containing the hashed groups for which to test collisions against
        
        @param request_id 
        <span class="type">number</span> a number between 0-255 that will be sent back in the response for identification, 0 by default
    **/
    static function ray_cast(from:Vector3, to:Vector3, groups:TODO<"table">, ?request_id:Float):Void;
}

/**
    Properties related to the `Physics` module.
**/
@:publicFields
class PhysicsProperties {
    /**
        <span class="type">number</span> collision object angular damping.
        
        The angular damping value for the collision object. Setting this value alters the damping of
        angular motion of the object (rotation). Valid values are between 0 (no damping) and 1 (full damping).
    **/
    static var angular_damping(default, never) = new Property<TODO>("angular_damping");

    /**
        <span class="type">vector3</span> collision object angular velocity.
        
        <span class="mark">READ ONLY</span> Returns the current angular velocity of the collision object component as a <span class="type">vector3</span>.
        The velocity is measured as a rotation around the vector with a speed equivalent to the vector length
        in radians/s.
    **/
    static var angular_velocity(default, never) = new Property<TODO>("angular_velocity");

    /**
        <span class="type">number</span> collision object linear damping.
        
        The linear damping value for the collision object. Setting this value alters the damping of
        linear motion of the object. Valid values are between 0 (no damping) and 1 (full damping).
    **/
    static var linear_damping(default, never) = new Property<TODO>("linear_damping");

    /**
        <span class="type">vector3</span> collision object linear velocity.
        
        <span class="mark">READ ONLY</span> Returns the current linear velocity of the collision object component as a vector3.
        The velocity is measured in units/s (pixels/s).
    **/
    static var linear_velocity(default, never) = new Property<TODO>("linear_velocity");

    /**
        <span class="type">number</span> collision object mass.
        
        <span class="mark">READ ONLY</span> Returns the defined physical mass of the collision object component as a number.
    **/
    static var mass(default, never) = new Property<TODO>("mass");
}

/**
    Messages related to the `Physics` module.
**/
@:publicFields
class PhysicsMessages {
    /**
        Applies a force on a collision object.
        
        Post this message to a collision-object-component to apply the specified force on the collision object.
        The collision object must be dynamic.
    **/
    static var apply_force(default, never) = new Message<PhysicsMessageApplyForce>("apply_force");

    /**
        Reports a collision between two collision objects.
        
        This message is broadcasted to every component of an instance that has a collision object,
        when the collision object collides with another collision object. For a script to take action
        when such a collision happens, it should check for this message in its `on_message` callback
        function.
        
        This message only reports that a collision actually happened and will only be sent once per
        colliding pair and frame.
        To retrieve more detailed information, check for the `contact_point_response` instead.
    **/
    static var collision_response(default, never) = new Message<PhysicsMessageCollisionResponse>("collision_response");

    /**
        Reports a contact point between two collision objects.
        
        This message is broadcasted to every component of an instance that has a collision object,
        when the collision object has contact points with respect to another collision object.
        For a script to take action when such contact points occur, it should check for this message
        in its `on_message` callback function.
        
        Since multiple contact points can occur for two colliding objects, this message can be sent
        multiple times in the same frame for the same two colliding objects. To only be notified once
        when the collision occurs, check for the `collision_response` message instead.
    **/
    static var contact_point_response(default, never) = new Message<PhysicsMessageContactPointResponse>("contact_point_response");

    /**
        Reports a ray cast miss.
        
        This message is sent back to the sender of a `ray_cast_request`, if the ray didn't hit any
        collision object. See `physics.ray_cast` for examples of how to use it.
    **/
    static var ray_cast_missed(default, never) = new Message<PhysicsMessageRayCastMissed>("ray_cast_missed");

    /**
        Reports a ray cast hit.
        
        This message is sent back to the sender of a `ray_cast_request`, if the ray hit a
        collision object. See `physics.ray_cast` for examples of how to use it.
    **/
    static var ray_cast_response(default, never) = new Message<PhysicsMessageRayCastResponse>("ray_cast_response");

    /**
        Reports interaction (enter/exit) between a trigger collision object and another collision object.
        
        This message is broadcasted to every component of an instance that has a collision object,
        when the collision object interacts with another collision object and one of them is a trigger.
        For a script to take action when such an interaction happens, it should check for this message
        in its `on_message` callback function.
        
        This message only reports that an interaction actually happened and will only be sent once per
        colliding pair and frame. To retrieve more detailed information, check for the
        `contact_point_response` instead.
    **/
    static var trigger_response(default, never) = new Message<PhysicsMessageTriggerResponse>("trigger_response");
}

/**
    Data for the `PhysicsMessages.apply_force` message.
**/
typedef PhysicsMessageApplyForce = {
    /**
        
        <span class="type">vector3</span> the force to be applied on the collision object, measured in Newton
        
    **/
    var force:Vector3;

    /**
        
        <span class="type">vector3</span> the position where the force should be applied
        
    **/
    var position:Vector3;
}

/**
    Data for the `PhysicsMessages.collision_response` message.
**/
typedef PhysicsMessageCollisionResponse = {
    /**
        
        <span class="type">hash</span> the id of the instance the collision object collided with
        
    **/
    var other_id:Hash;

    /**
        
        <span class="type">vector3</span> the world position of the instance the collision object collided with
        
    **/
    var other_position:Vector3;

    /**
        
        <span class="type">hash</span> the collision group of the other collision object (hash)
        
    **/
    var other_group:Hash;

    /**
        
        <span class="type">hash</span> the collision group of the own collision object (hash)
        
    **/
    var own_group:Hash;
}

/**
    Data for the `PhysicsMessages.contact_point_response` message.
**/
typedef PhysicsMessageContactPointResponse = {
    /**
        
        <span class="type">vector3</span> world position of the contact point
        
    **/
    var position:Vector3;

    /**
        
        <span class="type">vector3</span> normal in world space of the contact point, which points from the other object towards the current object
        
    **/
    var normal:Vector3;

    /**
        
        <span class="type">vector3</span> the relative velocity of the collision object as observed from the other object
        
    **/
    var relative_velocity:Vector3;

    /**
        
        <span class="type">number</span> the penetration distance between the objects, which is always positive
        
    **/
    var distance:Float;

    /**
        
        <span class="type">number</span> the impulse the contact resulted in
        
    **/
    var applied_impulse:Float;

    /**
        
        <span class="type">number</span> life time of the contact, <strong>not currently used</strong>
        
    **/
    var life_time:Float;

    /**
        
        <span class="type">number</span> the mass of the current collision object in kg
        
    **/
    var mass:Float;

    /**
        
        <span class="type">number</span> the mass of the other collision object in kg
        
    **/
    var other_mass:Float;

    /**
        
        <span class="type">hash</span> the id of the instance the collision object is in contact with
        
    **/
    var other_id:Hash;

    /**
        
        <span class="type">vector3</span> the world position of the other collision object
        
    **/
    var other_position:Vector3;

    /**
        
        <span class="type">hash</span> the collision group of the other collision object (hash)
        
    **/
    var other_group:Hash;

    /**
        
        <span class="type">hash</span> the collision group of the own collision object (hash)
        
    **/
    var own_group:Hash;
}

/**
    Data for the `PhysicsMessages.ray_cast_missed` message.
**/
typedef PhysicsMessageRayCastMissed = {
    /**
        
        <span class="type">number</span> id supplied when the ray cast was requested
        
    **/
    var request_id:Float;
}

/**
    Data for the `PhysicsMessages.ray_cast_response` message.
**/
typedef PhysicsMessageRayCastResponse = {
    /**
        
        <span class="type">number</span> the fraction of the hit measured along the ray, where 0 is the start of the ray and 1 is the end
        
    **/
    var fraction:Float;

    /**
        
        <span class="type">vector3</span> the world position of the hit
        
    **/
    var position:Vector3;

    /**
        
        <span class="type">vector3</span> the normal of the surface of the collision object where it was hit
        
    **/
    var normal:Vector3;

    /**
        
        <span class="type">hash</span> the instance id of the hit collision object
        
    **/
    var id:Hash;

    /**
        
        <span class="type">hash</span> the collision group of the hit collision object as a hashed name
        
    **/
    var group:Hash;

    /**
        
        <span class="type">number</span> id supplied when the ray cast was requested
        
    **/
    var request_id:Float;
}

/**
    Data for the `PhysicsMessages.trigger_response` message.
**/
typedef PhysicsMessageTriggerResponse = {
    /**
        
        <span class="type">hash</span> the id of the instance the collision object collided with (hash)
        
    **/
    var other_id:Hash;

    /**
        
        <span class="type">boolean</span> if the interaction was an entry or not
        
    **/
    var enter:TODO<"boolean">;

    /**
        
        <span class="type">hash</span> the collision group of the triggering collision object (hash)
        
    **/
    var other_group:Hash;

    /**
        
        <span class="type">hash</span> the collision group of the own collision object (hash)
        
    **/
    var own_group:Hash;
}
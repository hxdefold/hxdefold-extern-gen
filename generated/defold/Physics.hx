package defold;

/**
    Data for the `CollisionObjectMessages.apply_force` message.
**/
typedef CollisionObjectMessageApplyForce = {
    /**
        the force to be applied on the collision object, measured in Newton (vector3)
    **/
    var force:TODO;

    /**
        the position where the force should be applied (vector3)
    **/
    var position:TODO;
}

/**
    Data for the `CollisionObjectMessages.collision_response` message.
**/
typedef CollisionObjectMessageCollisionResponse = {
    /**
        the id of the instance the collision object collided with (hash)
    **/
    var other_id:TODO;

    /**
        the world position of the instance the collision object collided with (vec3)
    **/
    var other_position:TODO;

    /**
        the collision group of the other collision object (hash)
    **/
    var group:TODO;
}

/**
    Data for the `CollisionObjectMessages.contact_point_response` message.
**/
typedef CollisionObjectMessageContactPointResponse = {
    /**
        world position of the contact point (vector3)
    **/
    var position:TODO;

    /**
        normal in world space of the contact point, which points from the other object towards the current object (vector3)
    **/
    var normal:TODO;

    /**
        the relative velocity of the collision object as observed from the other object (vector3)
    **/
    var relative_velocity:TODO;

    /**
        the penetration distance between the objects, which is always positive (number)
    **/
    var distance:TODO;

    /**
        the impulse the contact resulted in (number)
    **/
    var applied_impulse:TODO;

    /**
        life time of the contact, *not currently used* (number)
    **/
    var life_time:TODO;

    /**
        the mass of the current collision object in kg (number)
    **/
    var mass:TODO;

    /**
        the mass of the other collision object in kg (number)
    **/
    var other_mass:TODO;

    /**
        the id of the instance the collision object is in contact with (hash)
    **/
    var other_id:TODO;

    /**
        the world position of the other collision object (vector3)
    **/
    var other_position:TODO;

    /**
        the collision group of the other collision object (hash)
    **/
    var group:TODO;
}

/**
    Functions and messages for collision object physics interaction
    with other objects (collisions and ray-casting) and control of
    physical behaviors.

    See `PhysicsMessages` for related messages.
    See `PhysicsProperties` for related properties.
**/
@:native("_G.physics")
extern class Physics {
    /**
        Requests a ray cast to be performed.
        
        Ray casts are used to test for intersections against collision objects in the physics world.
        Which collision objects to hit is filtered by their collision groups and can be configured through `groups`.
        The actual ray cast will be performed during the physics-update.
        If an object is hit, the result will be reported via a `ray_cast_response` message.
        
        @param from the world position of the start of the ray (vector3)
        @param to the world position of the end of the ray (vector3)
        @param groups a lua table containing the hashed groups for which to test collisions against (table)
        @param request_id a number between 0-255 that will be sent back in the response for identification, 0 by default (number)
    **/
    static function ray_cast(from:Vector3, to:Vector3, groups:TODO<"table">, ?request_id:Float):Void;
}

/**
    Data for the `PhysicsMessages.ray_cast_response` message.
**/
typedef PhysicsMessageRayCastResponse = {
    /**
        the fraction of the hit measured along the ray, where 0 is the start of the ray and 1 is the end (number)
    **/
    var fraction:TODO;

    /**
        the world position of the hit
    **/
    var position:TODO;

    /**
        the normal of the surface of the collision object where it was hit
    **/
    var normal:TODO;

    /**
        the instance id of the hit collision object
    **/
    var id:TODO;

    /**
        the collision group of the hit collision object as a hashed name
    **/
    var group:TODO;

    /**
        id supplied when the ray cast was requested
    **/
    var request_id:TODO;
}

/**
    Data for the `PhysicsMessages.trigger_response` message.
**/
typedef PhysicsMessageTriggerResponse = {
    /**
        the id of the instance the collision object collided with (hash)
    **/
    var other_id:TODO;

    /**
        if the interaction was an entry or not (exit)
    **/
    var enter:TODO;

    /**
        the collision group of the triggering object as a hashed name
    **/
    var group:TODO;
}

/**
    Data for the `PhysicsMessages.velocity_response` message.
**/
typedef PhysicsMessageVelocityResponse = {
    /**
        the linear velocity, i.e. translation, of the collision object in units/s (pixels/s (vector3)
    **/
    var linear_velocity:TODO;

    /**
        the angular velocity, i.e. rotation, of the collision object in radians/s.
        The velocity is measured as a rotation around the vector with a speed equivalent to the vector length (vector3)
    **/
    var angular_velocity:TODO;
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
    static var apply_force(default, never):Message<CollisionObjectMessageApplyForce> = new Message("apply_force");

    /**
        Reports a collision between two collision objects.
        
        This message is broadcasted to every component of an instance that has a collision object, when the collision
        object collides with another collision object. For a script to take action when such a collision happens, it
        should check for this message in its `on_message` callback function.
        
        This message only reports that a collision actually happened and will only be sent once per colliding pair and frame.
        To retrieve more detailed information, check for the `contact_point_response` instead.
    **/
    static var collision_response(default, never):Message<CollisionObjectMessageCollisionResponse> = new Message("collision_response");

    /**
        Reports a contact point between two collision objects.
        
        This message is broadcasted to every component of an instance that has a collision object, when the collision
        object has contact points with respect to another collision object. For a script to take action when
        such contact points occur, it should check for this message in its `on_message` callback function.
        
        Since multiple contact points can occur for two colliding objects, this message can be sent multiple times in
        the same frame for the same two colliding objects. To only be notified once when the collision occurs, check
        for the `collision_response` message instead.
    **/
    static var contact_point_response(default, never):Message<CollisionObjectMessageContactPointResponse> = new Message("contact_point_response");

    /**
        Reports a ray cast hit.
        
        This message is sent back to the sender of a `ray_cast_request`, if the ray hit a collision object.
        See `request_ray_cast` for examples of how to use it.
    **/
    static var ray_cast_response(default, never):Message<PhysicsMessageRayCastResponse> = new Message("ray_cast_response");

    /**
        (DEPRECATED) requests the velocity of a collision object.
        
        Post this message to a collision-object-component to retrieve its velocity.
    **/
    @:deprecated("Read properties <code>linear_velocity</code> and <code>angular_velocity</code>\nwith <code>go.get()</code> instead.")
    static var request_velocity(default, never):Message<Void> = new Message("request_velocity");

    /**
        Reports interaction (enter/exit) between a trigger collision object and another collision object.
        
        This message is broadcasted to every component of an instance that has a collision object, when the collision
        object interacts with another collision object and one of them is a trigger.
        For a script to take action when such an interaction happens, it
        should check for this message in its `on_message` callback function.
        
        This message only reports that an interaction actually happened and will only be sent once per colliding pair and frame.
        To retrieve more detailed information, check for the `contact_point_response` instead.
    **/
    static var trigger_response(default, never):Message<PhysicsMessageTriggerResponse> = new Message("trigger_response");

    /**
        (DEPRECATED) reports the velocity of a collision object.
        
        See `request_velocity` for examples on how to use it.
        
         This message is sent back to the sender of a `request_velocity` message.
    **/
    @:deprecated("Read properties <code>linear_velocity</code> and <code>angular_velocity</code>\nwith <code>go.get()</code> instead.")
    static var velocity_response(default, never):Message<PhysicsMessageVelocityResponse> = new Message("velocity_response");
}

/**
    Properties related to the `Physics` module.
**/
@:publicFields
class PhysicsProperties {
    /**
        Collision object angular damping (number).
        
        The angular damping value for the collision object. Setting this value alters the damping of
        angular motion of the object (rotation). Valid values are between 0 (no damping) and 1 (full damping).
    **/
    static var angular_damping(default, never):Property<TODO> = new Property("angular_damping");

    /**
        Collision object angular velocity (vector3).
        
        [READ ONLY] Returns the current linear velocity of the collision object component as a vector3.
        The velocity is measured as a rotation around the vector with a speed equivalent to the vector length
        in radians/s.
    **/
    static var angular_velocity(default, never):Property<TODO> = new Property("angular_velocity");

    /**
        Collision object linear damping (number).
        
        The linear damping value for the collision object. Setting this value alters the damping of
        linear motion of the object. Valid values are between 0 (no damping) and 1 (full damping).
    **/
    static var linear_damping(default, never):Property<TODO> = new Property("linear_damping");

    /**
        Collision object linear velocity (vector3).
        
        [READ ONLY] Returns the current linear velocity of the collision object component as a vector3.
        The velocity is measured in units/s (pixels/s).
    **/
    static var linear_velocity(default, never):Property<TODO> = new Property("linear_velocity");

    /**
        Collision object mass (number).
        
        [READ ONLY] Returns the defined physical mass of the collision object component as a number.
    **/
    static var mass(default, never):Property<TODO> = new Property("mass");
}
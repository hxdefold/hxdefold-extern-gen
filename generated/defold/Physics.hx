package defold;

/**
    <p>Functions and messages for collision object physics interaction
    with other objects (collisions and ray-casting) and control of
    physical behaviors.</p>

    See `PhysicsProperties` for related properties.
    See `PhysicsMessages` for related messages.
    See `PhysicsVariables` for related variables.
**/
@:native("_G.physics")
extern class Physics {
    /**
        Create a physics joint.
        
        Create a physics joint between two collision object components.
        
        Note: Currently only supported in 2D physics.
        
        @param joint_type 
        <span class="type">number</span> the joint type
        
        @param collisionobject_a 
        <span class="type">string | hash | url</span> first collision object
        
        @param joint_id 
        <span class="type">string | hash</span> id of the joint
        
        @param position_a 
        <span class="type">vector3</span> local position where to attach the joint on the first collision object
        
        @param collisionobject_b 
        <span class="type">string | hash | url</span> second collision object
        
        @param position_b 
        <span class="type">vector3</span> local position where to attach the joint on the second collision object
        
        @param properties 
        <span class="type">table</span> optional joint specific properties table
        
        See each joint type for possible properties field. The one field that is accepted for all joint types is:
        - <span class="type">boolean</span> `collide_connected`: Set this flag to true if the attached bodies should collide.
    **/
    static function create_joint(joint_type:Float, collisionobject_a:EitherType<Url, EitherType<Hash, String>>, joint_id:EitherType<Hash, String>, position_a:Vector3, collisionobject_b:EitherType<Url, EitherType<Hash, String>>, position_b:Vector3, ?properties:TODO<"table">):Void;

    /**
        Destroy a physics joint.
        
        Destroy an already physics joint. The joint has to be created before a
        destroy can be issued.
        
        Note: Currently only supported in 2D physics.
        
        @param collisionobject 
        <span class="type">string | hash | url</span> collision object where the joint exist
        
        @param joint_id 
        <span class="type">string | hash</span> id of the joint
    **/
    static function destroy_joint(collisionobject:EitherType<Url, EitherType<Hash, String>>, joint_id:EitherType<Hash, String>):Void;

    /**
        Get the gravity for collection.
        
        Get the gravity in runtime. The gravity returned is not global, it will return
        the gravity for the collection that the function is called from.
        
        Note: For 2D physics the z component will always be zero.
        
        @return [type:vector3] 
        gravity vector of collection
    **/
    static function get_gravity():TODO;

    /**
        Get properties for a joint.
        
        Get a table for properties for a connected joint. The joint has to be created before
        properties can be retrieved.
        
        Note: Currently only supported in 2D physics.
        
        @param collisionobject 
        <span class="type">string | hash | url</span> collision object where the joint exist
        
        @param joint_id 
        <span class="type">string | hash</span> id of the joint
        
        @return [type:table] 
        properties table. See the joint types for what fields are available, the only field available for all types is:
        
         * <span class="type">boolean</span> `collide_connected`: Set this flag to true if the attached bodies should collide.
    **/
    static function get_joint_properties(collisionobject:EitherType<Url, EitherType<Hash, String>>, joint_id:EitherType<Hash, String>):TODO;

    /**
        Get the reaction force for a joint.
        
        Get the reaction force for a joint. The joint has to be created before
        the reaction force can be calculated.
        
        Note: Currently only supported in 2D physics.
        
        @param collisionobject 
        <span class="type">string | hash | url</span> collision object where the joint exist
        
        @param joint_id 
        <span class="type">string | hash</span> id of the joint
        
        @return force 
        <span class="type">vector3</span> reaction force for the joint
    **/
    static function get_joint_reaction_force(collisionobject:EitherType<Url, EitherType<Hash, String>>, joint_id:EitherType<Hash, String>):TODO;

    /**
        Get the reaction torque for a joint.
        
        Get the reaction torque for a joint. The joint has to be created before
        the reaction torque can be calculated.
        
        Note: Currently only supported in 2D physics.
        
        @param collisionobject 
        <span class="type">string | hash | url</span> collision object where the joint exist
        
        @param joint_id 
        <span class="type">string | hash</span> id of the joint
        
        @return torque 
        <span class="type">float</span> the reaction torque on bodyB in N*m.
    **/
    static function get_joint_reaction_torque(collisionobject:EitherType<Url, EitherType<Hash, String>>, joint_id:EitherType<Hash, String>):TODO;

    /**
        Requests a ray cast to be performed.
        
        Ray casts are used to test for intersections against collision objects in the physics world.
        Collision objects of types kinematic, dynamic and static are tested against. Trigger objects
        do not intersect with ray casts.
        Which collision objects to hit is filtered by their collision groups and can be configured
        through `groups`.
        
        @param from 
        <span class="type">vector3</span> the world position of the start of the ray
        
        @param to 
        <span class="type">vector3</span> the world position of the end of the ray
        
        @param groups 
        <span class="type">table</span> a lua table containing the hashed groups for which to test collisions against
        
        @return result 
        <span class="type">table</span> It returns a table. If missed it returns nil. See `ray_cast_response` for details on the returned values.
    **/
    static function raycast(from:Vector3, to:Vector3, groups:TODO<"table">):TODO;

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
        <span class="type">number</span> a number between [0,-255]. It will be sent back in the response for identification, 0 by default
    **/
    static function raycast_async(from:Vector3, to:Vector3, groups:TODO<"table">, ?request_id:Float):Void;

    /**
        Set the gravity for collection.
        
        Set the gravity in runtime. The gravity change is not global, it will only affect
        the collection that the function is called from.
        
        Note: For 2D physics the z component of the gravity vector will be ignored.
        
        @param gravity 
        <span class="type">vector3</span> the new gravity vector
    **/
    static function set_gravity(gravity:Vector3):Void;

    /**
        Set properties for a joint.
        
        Updates the properties for an already connected joint. The joint has to be created before
        properties can be changed.
        
        Note: Currently only supported in 2D physics.
        
        @param collisionobject 
        <span class="type">string | hash | url</span> collision object where the joint exist
        
        @param joint_id 
        <span class="type">string | hash</span> id of the joint
        
        @param properties 
        <span class="type">table</span> joint specific properties table
        
        Note: The `collide_connected` field cannot be updated/changed after a connection has been made.
    **/
    static function set_joint_properties(collisionobject:EitherType<Url, EitherType<Hash, String>>, joint_id:EitherType<Hash, String>, properties:TODO<"table">):Void;
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
        collision object. See `physics.raycast_async` for examples of how to use it.
    **/
    static var ray_cast_missed(default, never) = new Message<PhysicsMessageRayCastMissed>("ray_cast_missed");

    /**
        Reports a ray cast hit.
        
        This message is sent back to the sender of a `ray_cast_request`, if the ray hit a
        collision object. See `physics.raycast_async` for examples of how to use it.
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

@:native("_G.physics")
extern class PhysicsVariables {
    /**
        Fixed joint type.
        
        The following properties are available when connecting a joint of `JOINT_TYPE_FIXED` type:
        - <span class="type">number</span> `max_length`: The maximum length of the rope.
    **/
    static var JOINT_TYPE_FIXED(default, never):TODO;

    /**
        Hinge joint type.
        
        The following properties are available when connecting a joint of `JOINT_TYPE_HINGE` type:
        - <span class="type">number</span> `reference_angle`: The bodyB angle minus bodyA angle in the reference state (radians).
        - <span class="type">number</span> `lower_angle`: The lower angle for the joint limit (radians).
        - <span class="type">number</span> `upper_angle`: The upper angle for the joint limit (radians).
        - <span class="type">number</span> `max_motor_torque`: The maximum motor torque used to achieve the desired motor speed. Usually in N-m.
        - <span class="type">number</span> `motor_speed`: The desired motor speed. Usually in radians per second.
        - <span class="type">boolean</span> `enable_limit`: A flag to enable joint limits.
        - <span class="type">boolean</span> `enable_motor`: A flag to enable the joint motor.
        
        Read only fields, available from `physics.get_joint_properties()`:
        - <span class="type">number</span> `joint_angle`: Current joint angle in radians.
        - <span class="type">number</span> `joint_speed`: Current joint angle speed in radians per second.
    **/
    static var JOINT_TYPE_HINGE(default, never):TODO;

    /**
        Hinge joint type.
        
        The following properties are available when connecting a joint of `JOINT_TYPE_SLIDER` type:
        - <span class="type">vector3</span> `local_axis_a`: The local translation unit axis in bodyA.
        - <span class="type">number</span> `reference_angle`: The constrained angle between the bodies: bodyB_angle - bodyA_angle.
        - <span class="type">boolean</span> `enable_limit`: Enable/disable the joint limit.
        - <span class="type">number</span> `lower_translation`: The lower translation limit, usually in meters.
        - <span class="type">number</span> `upper_translation`: The upper translation limit, usually in meters.
        - <span class="type">boolean</span> `enable_motor`: Enable/disable the joint motor.
        - <span class="type">number</span> `max_motor_force`: The maximum motor torque, usually in N-m.
        - <span class="type">number</span> `motor_speed`: The desired motor speed in radians per second.
        
        Read only fields, available from `physics.get_joint_properties()`:
        - <span class="type">number</span> `joint_translation`: Current joint translation, usually in meters.
        - <span class="type">number</span> `joint_speed`: Current joint translation speed, usually in meters per second.
    **/
    static var JOINT_TYPE_SLIDER(default, never):TODO;

    /**
        Spring joint type.
        
        The following properties are available when connecting a joint of `JOINT_TYPE_SPRING` type:
        - <span class="type">number</span> `length`: The natural length between the anchor points.
        - <span class="type">number</span> `frequency`: The mass-spring-damper frequency in Hertz. A value of 0 disables softness.
        - <span class="type">number</span> `damping`: The damping ratio. 0 = no damping, 1 = critical damping.
    **/
    static var JOINT_TYPE_SPRING(default, never):TODO;
}
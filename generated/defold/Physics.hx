package defold;

@:native("_G.physics") extern class Physics {
	/**
		requests a ray cast to be performed
		
		Ray casts are used to test for intersections against collision objects in the physics world.
		Which collision objects to hit is filtered by their collision groups and can be configured through <code>groups</code>.
		The actual ray cast will be performed during the physics-update.
		If an object is hit, the result will be reported via a <code>ray_cast_response</code> message.
		
		@param from the world position of the start of the ray (vector3)
		@param to the world position of the end of the ray (vector3)
		@param groups a lua table containing the hashed groups for which to test collisions against (table)
		@param request_id a number between 0-255 that will be sent back in the response for identification, 0 by default (number)
	**/
	static function ray_cast(from:TODO, to:TODO, groups:TODO, ?request_id:TODO):TODO;
}

@:publicFields class PhysicsMessages {
	/**
		applies a force on a collision object
		
		Post this message to a collision-object-component to apply the specified force on the collision object.
		The collision object must be dynamic.
		
		@param force the force to be applied on the collision object, measured in Newton (vector3)
		@param position the position where the force should be applied (vector3)
	**/
	static var ApplyForce(default, never) : Message<{ var force : TODO; var position : TODO; }> = new Message("apply_force");
	/**
		reports a collision between two collision objects
		
		<p>
		This message is broadcasted to every component of an instance that has a collision object, when the collision
		object collides with another collision object. For a script to take action when such a collision happens, it
		should check for this message in its <code>on_message</code> callback function.
		</p>
		<p>
		This message only reports that a collision actually happened and will only be sent once per colliding pair and frame.
		To retrieve more detailed information, check for the <code>contact_point_response</code> instead.
		</p>
		
		@param other_id the id of the instance the collision object collided with (hash)
		@param other_position the world position of the instance the collision object collided with (vec3)
		@param group the collision group of the other collision object (hash)
	**/
	static var CollisionResponse(default, never) : Message<{ var other_id : TODO; var other_position : TODO; var group : TODO; }> = new Message("collision_response");
	/**
		reports a contact point between two collision objects
		
		<p>
		This message is broadcasted to every component of an instance that has a collision object, when the collision
		object has contact points with respect to another collision object. For a script to take action when
		such contact points occur, it should check for this message in its <code>on_message</code> callback function.
		</p>
		<p>
		Since multiple contact points can occur for two colliding objects, this message can be sent multiple times in
		the same frame for the same two colliding objects. To only be notified once when the collision occurs, check
		for the <code>collision_response</code> message instead.
		</p>
		
		@param position world position of the contact point (vector3)
		@param normal normal in world space of the contact point, which points from the other object towards the current object (vector3)
		@param relative_velocity the relative velocity of the collision object as observed from the other object (vector3)
		@param distance the penetration distance between the objects, which is always positive (number)
		@param applied_impulse the impulse the contact resulted in (number)
		@param life_time life time of the contact, <b>not currently used</b> (number)
		@param mass the mass of the current collision object in kg (number)
		@param other_mass the mass of the other collision object in kg (number)
		@param other_id the id of the instance the collision object is in contact with (hash)
		@param other_position the world position of the other collision object (vector3)
		@param group the collision group of the other collision object (hash)
	**/
	static var ContactPointResponse(default, never) : Message<{ var position : TODO; var normal : TODO; var relative_velocity : TODO; var distance : TODO; var applied_impulse : TODO; var life_time : TODO; var mass : TODO; var other_mass : TODO; var other_id : TODO; var other_position : TODO; var group : TODO; }> = new Message("contact_point_response");
	/**
		reports a ray cast hit
		
		This message is sent back to the sender of a <code>ray_cast_request</code>, if the ray hit a collision object.
		See <code>request_ray_cast</code> for examples of how to use it.
		
		@param fraction the fraction of the hit measured along the ray, where 0 is the start of the ray and 1 is the end (number)
		@param position the world position of the hit
		@param normal the normal of the surface of the collision object where it was hit
		@param id the instance id of the hit collision object
		@param group the collision group of the hit collision object as a hashed name
		@param request_id id supplied when the ray cast was requested
	**/
	static var RayCastResponse(default, never) : Message<{ var fraction : TODO; var position : TODO; var normal : TODO; var id : TODO; var group : TODO; var request_id : TODO; }> = new Message("ray_cast_response");
	/**
		(DEPRECATED) requests the velocity of a collision object
		
		<b>DEPRECATED!</b> Post this message to a collision-object-component to retrieve its velocity.
		
		Read properties <code>linear_velocity</code> and <code>angular_velocity</code>
		with <code>go.get()</code> instead.
	**/
	static var RequestVelocity(default, never) : Message<{ }> = new Message("request_velocity");
	/**
		reports interaction (enter/exit) between a trigger collision object and another collision object
		
		<p>
		This message is broadcasted to every component of an instance that has a collision object, when the collision
		object interacts with another collision object and one of them is a trigger.
		For a script to take action when such an interaction happens, it
		should check for this message in its <code>on_message</code> callback function.
		</p>
		<p>
		This message only reports that an interaction actually happened and will only be sent once per colliding pair and frame.
		To retrieve more detailed information, check for the <code>contact_point_response</code> instead.
		</p>
		
		@param other_id the id of the instance the collision object collided with (hash)
		@param enter if the interaction was an entry or not (exit)
		@param group the collision group of the triggering object as a hashed name
	**/
	static var TriggerResponse(default, never) : Message<{ var other_id : TODO; var enter : TODO; var group : TODO; }> = new Message("trigger_response");
	/**
		(DEPRECATED) reports the velocity of a collision object
		
		<b>DEPRECATED!</b> This message is sent back to the sender of a <code>request_velocity</code> message.
		See <code>request_velocity</code> for examples on how to use it.
		
		Read properties <code>linear_velocity</code> and <code>angular_velocity</code>
		with <code>go.get()</code> instead.
		
		@param linear_velocity the linear velocity, i.e. translation, of the collision object in units/s (pixels/s (vector3)
		@param angular_velocity the angular velocity, i.e. rotation, of the collision object in radians/s.
		The velocity is measured as a rotation around the vector with a speed equivalent to the vector length (vector3)
	**/
	static var VelocityResponse(default, never) : Message<{ var linear_velocity : TODO; var angular_velocity : TODO; }> = new Message("velocity_response");
}

@:publicFields class PhysicsProperties {
	/**
		collision object angular damping (number)
		
		The angular damping value for the collision object. Setting this value alters the damping of
		angular motion of the object (rotation). Valid values are between 0 (no damping) and 1 (full damping).
	**/
	static var AngularDamping(default, never) : Property<TODO> = new Property("angular_damping");
	/**
		collision object angular velocity (vector3)
		
		[READ ONLY] Returns the current linear velocity of the collision object component as a vector3.
		The velocity is measured as a rotation around the vector with a speed equivalent to the vector length
		in radians/s.
	**/
	static var AngularVelocity(default, never) : Property<TODO> = new Property("angular_velocity");
	/**
		collision object linear damping (number)
		
		The linear damping value for the collision object. Setting this value alters the damping of
		linear motion of the object. Valid values are between 0 (no damping) and 1 (full damping).
	**/
	static var LinearDamping(default, never) : Property<TODO> = new Property("linear_damping");
	/**
		collision object linear velocity (vector3)
		
		[READ ONLY] Returns the current linear velocity of the collision object component as a vector3.
		The velocity is measured in units/s (pixels/s).
	**/
	static var LinearVelocity(default, never) : Property<TODO> = new Property("linear_velocity");
	/**
		collision object mass (number)
		
		[READ ONLY] Returns the defined physical mass of the collision object component as a number.
	**/
	static var Mass(default, never) : Property<TODO> = new Property("mass");
}
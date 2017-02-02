package defold;

/**
    Functions for controlling particle effect component playback and
    shader constants.

    See `ParticlefxVariables` for related variables.
**/
@:native("_G.particlefx") extern class Particlefx {
	/**
		Start playing a particle FX.
		
		Particle FX started this way need to be manually stopped through particlefx.stop.
		Which particle FX to play is identified by the URL.
		
		@param url the particle fx that should start playing (url)
		@param emitter_state_cb optional callback that will be called when an emitter attached to this particlefx changes state.
	**/
	static function play(url:Url, ?emitter_state_cb:TODO):Void;

	/**
		Reset a shader constant for a particle FX emitter.
		
		The constant must be defined in the material assigned to the emitter.
		Resetting a constant through this function implies that the value defined in the material will be used.
		Which particle FX to reset a constant for is identified by the URL.
		
		@param url the particle FX that should have a constant reset (url)
		@param emitter_id the id of the emitter (string|hash)
		@param name the name of the constant (string|hash)
	**/
	static function reset_constant(url:Url, emitter_id:EitherType<Hash, String>, name:EitherType<Hash, String>):Void;

	/**
		Set a shader constant for a particle FX emitter.
		
		The constant must be defined in the material assigned to the emitter.
		Setting a constant through this function will override the value set for that constant in the material.
		The value will be overridden until particlefx.reset_constant is called.
		Which particle FX to set a constant for is identified by the URL.
		
		@param url the particle FX that should have a constant set (url)
		@param emitter_id the id of the emitter (string|hash)
		@param name the name of the constant (string|hash)
		@param value the value of the constant (vec4)
	**/
	static function set_constant(url:Url, emitter_id:EitherType<Hash, String>, name:EitherType<Hash, String>, value:Vector4):Void;

	/**
		Stop playing a particle fx.
		
		Stopping a particle FX does not remove the already spawned particles.
		Which particle fx to stop is identified by the URL.
		
		@param url the particle fx that should stop playing (url)
	**/
	static function stop(url:Url):Void;
}

@:native("_G.particlefx") extern class ParticlefxVariables {
	/**
		Postspawn state.
		
		The emitter is not spawning any particles, but has particles that are still alive.
	**/
	static var EMITTER_STATE_POSTSPAWN(default, never):TODO;

	/**
		Prespawn state.
		
		The emitter will be in this state when it has been started but before spawning any particles. Normally the emitter is in this state for a short time, depending on if a start delay has been set for this emitter or not.
	**/
	static var EMITTER_STATE_PRESPAWN(default, never):TODO;

	/**
		Sleeping state.
		
		The emitter does not have any living particles and will not spawn any particles in this state.
	**/
	static var EMITTER_STATE_SLEEPING(default, never):TODO;

	/**
		Spawning state.
		
		The emitter is spawning particles.
	**/
	static var EMITTER_STATE_SPAWNING(default, never):TODO;
}
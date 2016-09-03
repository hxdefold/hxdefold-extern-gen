package defold;

@:native("_G.particlefx") extern class Particlefx {
	/**
		start playing a particle FX
		
		Particle FX started this way need to be manually stopped through particlefx.stop.
		Which particle FX to play is identified by the URL.
		
		@param url the particle fx that should start playing (url)
	**/
	static function play(url:TODO):TODO;
	/**
		reset a shader constant for a particle FX emitter
		
		The constant must be defined in the material assigned to the emitter.
		Resetting a constant through this function implies that the value defined in the material will be used.
		Which particle FX to reset a constant for is identified by the URL.
		
		@param url the particle FX that should have a constant reset (url)
		@param emitter_id the id of the emitter (string|hash)
		@param name the name of the constant (string|hash)
	**/
	static function reset_constant(url:TODO, emitter_id:TODO, name:TODO):TODO;
	/**
		set a shader constant for a particle FX emitter
		
		The constant must be defined in the material assigned to the emitter.
		Setting a constant through this function will override the value set for that constant in the material.
		The value will be overridden until particlefx.reset_constant is called.
		Which particle FX to set a constant for is identified by the URL.
		
		@param url the particle FX that should have a constant set (url)
		@param emitter_id the id of the emitter (string|hash)
		@param name the name of the constant (string|hash)
		@param value the value of the constant (vec4)
	**/
	static function set_constant(url:TODO, emitter_id:TODO, name:TODO, value:TODO):TODO;
	/**
		stop playing a particle fx
		
		Stopping a particle FX does not remove the already spawned particles.
		Which particle fx to stop is identified by the URL.
		
		@param url the particle fx that should stop playing (url)
	**/
	static function stop(url:TODO):TODO;
}
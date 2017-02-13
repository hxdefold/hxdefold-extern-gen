package defold;

/**
    <p>Functions for controlling particle effect component playback and
    shader constants.</p>

    See `ParticlefxVariables` for related variables.
**/
@:native("_G.particlefx")
extern class Particlefx {
    /**
        Start playing a particle FX.
        
        Starts playing a particle FX component.
        Particle FX started this way need to be manually stopped through `particlefx.stop()`.
        Which particle FX to play is identified by the URL.
        
        @param url 
        <span class="type">string | hash | url</span> the particle fx that should start playing.
        
        @param emitter_state_function 
        <span class="type">function(self, id, emitter, state)</span> optional callback function that will be called when an emitter attached to this particlefx changes state.
        
        <dl>
        <dt>`self`</dt>
        <dd><span class="type">object</span> The current object</dd>
        <dt>`id`</dt>
        <dd><span class="type">hash</span> The id of the particle fx component</dd>
        <dt>`emitter`</dt>
        <dd><span class="type">hash</span> The id of the emitter</dd>
        <dt>`state`</dt>
        <dd><span class="type">constant</span> the new state of the emitter:</dd>
        </dl>
        
         * `particlefx.EMITTER_STATE_POSTSPAWN`
         * `particlefx.EMITTER_STATE_PRESPAWN`
         * `particlefx.EMITTER_STATE_SLEEPING`
         * `particlefx.EMITTER_STATE_SPAWNING`
    **/
    static function play(url:EitherType<Url, EitherType<Hash, String>>, ?emitter_state_function:TODO<"function(self, id, emitter, state)">):Void;

    /**
        Reset a shader constant for a particle FX component emitter.
        
        Resets a shader constant for a particle FX component emitter.
        The constant must be defined in the material assigned to the emitter.
        Resetting a constant through this function implies that the value defined in the material will be used.
        Which particle FX to reset a constant for is identified by the URL.
        
        @param url 
        <span class="type">string | hash | url</span> the particle FX that should have a constant reset
        
        @param emitter 
        <span class="type">string | hash</span> the id of the emitter
        
        @param constant 
        <span class="type">string | hash</span> the name of the constant
    **/
    static function reset_constant(url:EitherType<Url, EitherType<Hash, String>>, emitter:EitherType<Hash, String>, constant:EitherType<Hash, String>):Void;

    /**
        Set a shader constant for a particle FX component emitter.
        
        Sets a shader constant for a particle FX component emitter.
        The constant must be defined in the material assigned to the emitter.
        Setting a constant through this function will override the value set for that constant in the material.
        The value will be overridden until particlefx.reset_constant is called.
        Which particle FX to set a constant for is identified by the URL.
        
        @param url 
        <span class="type">string | hash | url</span> the particle FX that should have a constant set
        
        @param emitter 
        <span class="type">string | hash</span> the id of the emitter
        
        @param constant 
        <span class="type">string | hash</span> the name of the constant
        
        @param value 
        <span class="type">vector4</span> the value of the constant
    **/
    static function set_constant(url:EitherType<Url, EitherType<Hash, String>>, emitter:EitherType<Hash, String>, constant:EitherType<Hash, String>, value:Vector4):Void;

    /**
        Stop playing a particle fx.
        
        Stops a particle FX component from playing.
        Stopping a particle FX does not remove already spawned particles.
        Which particle FX to stop is identified by the URL.
        
        @param url 
        <span class="type">string | hash | url</span> the particle fx that should stop playing
    **/
    static function stop(url:EitherType<Url, EitherType<Hash, String>>):Void;
}

@:native("_G.particlefx")
extern class ParticlefxVariables {
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
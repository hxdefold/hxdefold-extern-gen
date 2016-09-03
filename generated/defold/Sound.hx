package defold;

@:native("_G.sound") extern class Sound {
	/**
		get mixer group gain
		
		Get mixer group gain
		<p>
		Note that gain is in linear scale.
		</p>
		
		@param group group name (hash|string)
	**/
	static function get_group_gain(group:TODO):TODO;
	/**
		get mixer group name string
		
		Get a mixer group name as a string.
		<p>Note that this function does not return correct group name in release mode</p>
		
		@param group group name (hash|string)
	**/
	static function get_group_name(group:TODO):TODO;
	/**
		get all mixer group names
		
		Get all mixer group names
	**/
	static function get_groups():TODO;
	/**
		get peak gain value from mixer group
		
		Get peak value from mixer group.
		<p>
		Note that the returned value might be an approximation and in particular
		the effective window might be larger than specified.
		</p>
		
		@param group group name (hash|string)
		@param window window length in seconds (number)
	**/
	static function get_peak(group:TODO, window:TODO):TODO;
	/**
		get rms value from mixer group
		
		Get RMS (Root Mean Square) value from mixer group.
		<p>
		Note that the returned value might be an approximation and in particular
		the effective window might be larger than specified.
		</p>
		
		@param group group name (hash|string)
		@param window window length in seconds (number)
	**/
	static function get_rms(group:TODO, window:TODO):TODO;
	/**
		check if background music is playing
		
		Checks if background music is playing, e.g. from iTunes
	**/
	static function is_music_playing():TODO;
	/**
		check if a phone call is active
		
		Checks if a phone call is active. If there is an active phone call all
		other sounds will be muted until the phone call is finished.
	**/
	static function is_phone_call_active():TODO;
	/**
		set mixer group gain
		
		Set mixer group gain
		<p>
		Note that gain is in linear scale.
		</p>
		
		@param group group name (hash|string)
		@param gain gain in linear scale (number)
	**/
	static function set_group_gain(group:TODO, gain:TODO):TODO;
}

@:publicFields class SoundMessages {
	/**
		plays a sound
		
		Post this message to a sound-component to make it play its sound. Multiple voices is support. The limit is set to 32 voices per sound component.
		
		@param delay delay in seconds before the sound starts playing, default is 0 (number)
		@param gain sound gain between 0 and 1, default is 1 (number)
	**/
	static var PlaySound(default, never) : Message<{ @:optional
	var delay : TODO; @:optional
	var gain : TODO; }> = new Message("play_sound");
	/**
		set sound gain
		
		Post this message to a sound-component to set gain on all active playing voices.
		
		@param gain sound gain between 0 and 1, default is 1 (number)
	**/
	static var SetGain(default, never) : Message<{ @:optional
	var gain : TODO; }> = new Message("set_gain");
	/**
		stop a playing a sound(s)
		
		Post this message to a sound-component to make it stop playing all active voices
	**/
	static var StopSound(default, never) : Message<{ }> = new Message("stop_sound");
}
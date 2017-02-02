package defold;

/**
    Functions and messages for controlling sound components and
    mixer groups.

    See `SoundMessages` for related messages.
**/
@:native("_G.sound")
extern class Sound {
    /**
        Get mixer group gain.
        
        Get mixer group gain
        
        Note that gain is in linear scale.
        
        @param group group name (hash|string)
        @return gain in linear scale
    **/
    static function get_group_gain(group:EitherType<String, Hash>):TODO;

    /**
        Get mixer group name string.
        
        Get a mixer group name as a string.
        
        Note that this function does not return correct group name in release mode
        
        @param group group name (hash|string)
        @return group name (string)
    **/
    static function get_group_name(group:EitherType<String, Hash>):TODO;

    /**
        Get all mixer group names.
        
        Get all mixer group names
        
        @return table of mixer groups names (table)
    **/
    static function get_groups():TODO;

    /**
        Get peak gain value from mixer group.
        
        Get peak value from mixer group.
        
        Note that the returned value might be an approximation and in particular
        the effective window might be larger than specified.
        
        @param group group name (hash|string)
        @param window window length in seconds (number)
        @return peak value for left channel (number)
        @return peak value for right channel (number)
    **/
    static function get_peak(group:EitherType<String, Hash>, window:Float):TODO<"multiple">;

    /**
        Get rms value from mixer group.
        
        Get RMS (Root Mean Square) value from mixer group.
        
        Note that the returned value might be an approximation and in particular
        the effective window might be larger than specified.
        
        @param group group name (hash|string)
        @param window window length in seconds (number)
        @return rms value for left channel (number)
        @return rms value for right channel (number)
    **/
    static function get_rms(group:EitherType<String, Hash>, window:Float):TODO<"multiple">;

    /**
        Check if background music is playing.
        
        Checks if background music is playing, e.g. from iTunes
        
        @return true if music is playing (bool)
    **/
    static function is_music_playing():TODO;

    /**
        Check if a phone call is active.
        
        Checks if a phone call is active. If there is an active phone call all
        other sounds will be muted until the phone call is finished.
        
        @return true if there is an active phone call (bool)
    **/
    static function is_phone_call_active():TODO;

    /**
        Set mixer group gain.
        
        Set mixer group gain
        
        Note that gain is in linear scale.
        
        @param group group name (hash|string)
        @param gain gain in linear scale (number)
    **/
    static function set_group_gain(group:EitherType<String, Hash>, gain:Float):Void;
}

/**
    Messages related to the `Sound` module.
**/
@:publicFields
class SoundMessages {
    /**
        Plays a sound.
        
        Post this message to a sound-component to make it play its sound. Multiple voices is support. The limit is set to 32 voices per sound component.
    **/
    static var play_sound(default, never) = new Message<SoundMessagePlaySound>("play_sound");

    /**
        Set sound gain.
        
        Post this message to a sound-component to set gain on all active playing voices.
    **/
    static var set_gain(default, never) = new Message<SoundMessageSetGain>("set_gain");

    /**
        Stop a playing a sound(s).
        
        Post this message to a sound-component to make it stop playing all active voices
    **/
    static var stop_sound(default, never) = new Message<Void>("stop_sound");
}

/**
    Data for the `SoundMessages.play_sound` message.
**/
typedef SoundMessagePlaySound = {
    /**
        delay in seconds before the sound starts playing, default is 0 (number)
    **/
    @:optional var delay:TODO;

    /**
        sound gain between 0 and 1, default is 1 (number)
    **/
    @:optional var gain:TODO;
}

/**
    Data for the `SoundMessages.set_gain` message.
**/
typedef SoundMessageSetGain = {
    /**
        sound gain between 0 and 1, default is 1 (number)
    **/
    @:optional var gain:TODO;
}
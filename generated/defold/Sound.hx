package defold;

/**
    <p>Functions and messages for controlling sound components and
    mixer groups.</p>

    See `SoundMessages` for related messages.
**/
@:native("_G.sound")
extern class Sound {
    /**
        Get mixer group gain.
        
        Get mixer group gain
        
        <span class="icon-attention"></span> Note that gain is in linear scale, between 0 and 1.
        To get the dB value from the gain, use the formula `20 * log(gain)`.
        Inversely, to find the linear value from a dB value, use the formula
        `10<sup>db/20</sup>`.
        
        @param group 
        <span class="type">string | hash</span> group name
        
        @return gain 
        <span class="type">number</span> gain in linear scale
    **/
    static function get_group_gain(group:EitherType<Hash, String>):TODO;

    /**
        Get mixer group name string.
        
        Get a mixer group name as a string.
        
        <span class="icon-attention"></span> This function is to be used for debugging and
        development tooling only. The function does a reverse hash lookup, which does not
        return a proper string value when the game is built in release mode.
        
        @param group 
        <span class="type">string | hash</span> group name
        
        @return name 
        <span class="type">string</span> group name
    **/
    static function get_group_name(group:EitherType<Hash, String>):TODO;

    /**
        Get all mixer group names.
        
        Get a table of all mixer group names (hashes).
        
        @return groups 
        <span class="type">table</span> table of mixer group names
    **/
    static function get_groups():TODO;

    /**
        Get peak gain value from mixer group.
        
        Get peak value from mixer group.
        
        <span class="icon-attention"></span> Note that gain is in linear scale, between 0 and 1.
        To get the dB value from the gain, use the formula `20 * log(gain)`.
        Inversely, to find the linear value from a dB value, use the formula
        `10<sup>db/20</sup>`.
        Also note that the returned value might be an approximation and in particular
        the effective window might be larger than specified.
        
        @param group 
        <span class="type">string | hash</span> group name
        
        @param window 
        <span class="type">number</span> window length in seconds
        
        @return peak_l 
        <span class="type">number</span> peak value for left channel
        
        @return peak_r 
        <span class="type">number</span> peak value for right channel
    **/
    static function get_peak(group:EitherType<Hash, String>, window:Float):TODO<"multiple">;

    /**
        Get RMS value from mixer group.
        
        Get RMS (Root Mean Square) value from mixer group. This value is the
        square root of the mean (average) value of the squared function of
        the instantaneous values.
        
        For instance: for a sinewave signal with a peak gain of -1.94 dB (0.8 linear),
        the RMS is `0.8 &times; 1/sqrt(2)` which is about 0.566.
        
        <span class="icon-attention"></span> Note the returned value might be an approximation and in particular
        the effective window might be larger than specified.
        
        @param group 
        <span class="type">string | hash</span> group name
        
        @param window 
        <span class="type">number</span> window length in seconds
        
        @return rms_l 
        <span class="type">number</span> RMS value for left channel
        
        @return rms_r 
        <span class="type">number</span> RMS value for right channel
    **/
    static function get_rms(group:EitherType<Hash, String>, window:Float):TODO<"multiple">;

    /**
        Check if background music is playing.
        
        Checks if background music is playing, e.g. from iTunes.
        
        <span class="icon-macos"></span><span class="icon-windows"></span><span class="icon-linux"></span><span class="icon-html5"></span> On non mobile platforms,
        this function always return `false`.
        
        <span class="icon-attention"></span><span class="icon-android"></span> On Android you can only get a correct reading
        of this state if your game is not playing any sounds itself. This is a limitation
        in the Android SDK. If your game is playing any sounds, <em>even with a gain of zero</em>, this
        function will return `false`.
        
        The best time to call this function is:
        
         * In the `init` function of your main collection script before any sounds are triggered
         * In a window listener callback when the window.WINDOW_EVENT_FOCUS_GAINED event is received
        
        Both those times will give you a correct reading of the state even when your application is
        swapped out and in while playing sounds and it works equally well on Android and iOS.
        
        @return playing 
        <span class="type">boolean</span> `true` if music is playing, otherwise `false`.
    **/
    static function is_music_playing():TODO;

    /**
        Check if a phone call is active.
        
        Checks if a phone call is active. If there is an active phone call all
        other sounds will be muted until the phone call is finished.
        
        <span class="icon-macos"></span><span class="icon-windows"></span><span class="icon-linux"></span><span class="icon-html5"></span> On non mobile platforms,
        this function always return `false`.
        
        @return call_active 
        <span class="type">boolean</span> `true` if there is an active phone call, `false` otherwise.
    **/
    static function is_phone_call_active():TODO;

    /**
        Plays a sound.
        
        Make the sound component play its sound. Multiple voices is supported. The limit is set to 32 voices per sound component.
        
        <span class="icon-attention"></span> Note that gain is in linear scale, between 0 and 1.
        To get the dB value from the gain, use the formula `20 * log(gain)`.
        Inversely, to find the linear value from a dB value, use the formula
        `10<sup>db/20</sup>`.
        
        @param url 
        <span class="type">string | hash | url</span> the sound that should play
        
        @param play_properties <dl>
        <dt><span class="type">table</span> optional table with properties:</dt>
        <dt>`delay`</dt>
        <dd><span class="type">number</span> delay in seconds before the sound starts playing, default is 0.</dd>
        <dt>`gain`</dt>
        <dd><span class="type">number</span> sound gain between 0 and 1, default is 1. The final gain of the sound will be a combination of this gain, the group gain and the master gain.</dd>
        </dl>
    **/
    static function play(url:EitherType<Url, EitherType<Hash, String>>, ?play_properties:TODO<"table">):Void;

    /**
        Set sound gain.
        
        Set gain on all active playing voices of a sound.
        
        <span class="icon-attention"></span> Note that gain is in linear scale, between 0 and 1.
        To get the dB value from the gain, use the formula `20 * log(gain)`.
        Inversely, to find the linear value from a dB value, use the formula
        `10<sup>db/20</sup>`.
        
        @param url 
        <span class="type">string | hash | url</span> the sound to set the gain of
        
        @param gain 
        <span class="type">number</span> sound gain between 0 and 1. The final gain of the sound will be a combination of this gain, the group gain and the master gain.
    **/
    static function set_gain(url:EitherType<Url, EitherType<Hash, String>>, ?gain:Float):Void;

    /**
        Set mixer group gain.
        
        Set mixer group gain
        
        <span class="icon-attention"></span> Note that gain is in linear scale, between 0 and 1.
        To get the dB value from the gain, use the formula `20 * log(gain)`.
        Inversely, to find the linear value from a dB value, use the formula
        `10<sup>db/20</sup>`.
        
        @param group 
        <span class="type">string | hash</span> group name
        
        @param gain 
        <span class="type">number</span> gain in linear scale
    **/
    static function set_group_gain(group:EitherType<Hash, String>, gain:Float):Void;

    /**
        Stop a playing a sound(s).
        
        Stop playing all active voices
        
        @param url 
        <span class="type">string | hash | url</span> the sound that should stop
    **/
    static function stop(url:EitherType<Url, EitherType<Hash, String>>):Void;
}

/**
    Messages related to the `Sound` module.
**/
@:publicFields
class SoundMessages {
    /**
        Plays a sound.
        
        Post this message to a sound-component to make it play its sound. Multiple voices is support. The limit is set to 32 voices per sound component.
        
        <span class="icon-attention"></span> Note that gain is in linear scale, between 0 and 1.
        To get the dB value from the gain, use the formula `20 * log(gain)`.
        Inversely, to find the linear value from a dB value, use the formula
        `10<sup>db/20</sup>`.
    **/
    static var play_sound(default, never) = new Message<SoundMessagePlaySound>("play_sound");

    /**
        Set sound gain.
        
        Post this message to a sound-component to set gain on all active playing voices.
        
        <span class="icon-attention"></span> Note that gain is in linear scale, between 0 and 1.
        To get the dB value from the gain, use the formula `20 * log(gain)`.
        Inversely, to find the linear value from a dB value, use the formula
        `10<sup>db/20</sup>`.
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
        
        <span class="type">number</span> delay in seconds before the sound starts playing, default is 0.
        
    **/
    @:optional var delay:Float;

    /**
        
        <span class="type">number</span> sound gain between 0 and 1, default is 1.
        
    **/
    @:optional var gain:Float;
}

/**
    Data for the `SoundMessages.set_gain` message.
**/
typedef SoundMessageSetGain = {
    /**
        
        <span class="type">number</span> sound gain between 0 and 1, default is 1.
        
    **/
    @:optional var gain:Float;
}
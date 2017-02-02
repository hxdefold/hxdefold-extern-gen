package defold;

/**
	This module currently has no functions.


	See `EngineMessages` for related messages.
**/
@:native("_G") extern class Engine {

}

/**
	Data for the `EngineMessages.exit` message.
**/
typedef EngineMessageExit = {
	/**
		exit code to report to the OS, 0 means clean exit (number)
	**/
	var code:TODO;
}

/**
	Data for the `EngineMessages.reboot` message.
**/
typedef EngineMessageReboot = {
	/**
		argument 1
	**/
	var arg1:TODO;
	/**
		argument 2
	**/
	var arg2:TODO;
	/**
		argument 3
	**/
	var arg3:TODO;
	/**
		argument 4
	**/
	var arg4:TODO;
	/**
		argument 5
	**/
	var arg5:TODO;
	/**
		argument 6
	**/
	var arg6:TODO;
}

/**
	Data for the `EngineMessages.set_update_frequency` message.
**/
typedef EngineMessageSetUpdateFrequency = {
	/**
		target frequency. 60 for 60 fps
	**/
	var frequency:TODO;
}

/**
	Data for the `EngineMessages.start_record` message.
**/
typedef EngineMessageStartRecord = {
	/**
		file name to write the video to
	**/
	var file_name:TODO;
	/**
		frame period to record, ie write every nth frame. Default value is 2
	**/
	var frame_period:TODO;
	/**
		frames per second. Playback speed for the video. Default value is 30. The fps value doens't affect the recording. It's only meta-data in the written video file.
	**/
	var fps:TODO;
}

/**
	Messages related to the `Engine` module.
**/
@:publicFields class EngineMessages {
	/**
		Exits application.
		
		Terminates the game application and reports the specified `code` to the OS.
		This message can only be sent to the designated `@system` socket.
	**/
	static var exit(default, never):Message<EngineMessageExit> = new Message("exit");

	/**
		Reboot engine with arguments.
		
		Arguments will be translated into command line arguments. Sending the reboot
		command is equivalent to starting the engine with the same arguments.
	**/
	static var reboot(default, never):Message<EngineMessageReboot> = new Message("reboot");

	/**
		Set update frequency.
		
		Set game update-frequency. This option is equivalent to display.update_frequency but
		set in run-time
	**/
	static var set_update_frequency(default, never):Message<EngineMessageSetUpdateFrequency> = new Message("set_update_frequency");

	/**
		Starts video recording.
		
		Starts video recording of the game frame-buffer to file. Current video format is the
		open vp8 codec in the ivf container. It's possible to upload this format directly
		to YouTube. The VLC video player has native support but with the known issue that
		not the entirely files is played back. It's probably an issue with VLC.
		The Miro Video Converter has support for vp8/ivf.
		NOTE: Audio is currently not supported
	**/
	static var start_record(default, never):Message<EngineMessageStartRecord> = new Message("start_record");

	/**
		Stop current video recording.
	**/
	static var stop_record(default, never):Message<Void> = new Message("stop_record");

	/**
		Shows/hides the on-screen physics visual debugging.
		
		This message can only be sent to the designated `@system` socket.
	**/
	static var toggle_physics_debug(default, never):Message<Void> = new Message("toggle_physics_debug");

	/**
		Shows/hides the on-screen profiler.
		
		This message can only be sent to the designated `@system` socket.
	**/
	static var toggle_profile(default, never):Message<Void> = new Message("toggle_profile");
}
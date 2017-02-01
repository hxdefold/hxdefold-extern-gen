package defold;

@:publicFields class EngineMessages {
	/**
		exits application
		
		Terminates the game application and reports the specified `code` to the OS.
		This message can only be sent to the designated `@system` socket.
		
		@param code exit code to report to the OS, 0 means clean exit (number)
	**/
	static var Exit(default, never) : Message<{ var code : TODO; }> = new Message("exit");
	/**
		reboot engine with arguments
		
		Arguments will be translated into command line arguments. Sending the reboot
		command is equivalent to starting the engine with the same arguments.
		
		@param arg1 argument 1
		@param arg2 argument 2
		@param arg3 argument 3
		@param arg4 argument 4
		@param arg5 argument 5
		@param arg6 argument 6
	**/
	static var Reboot(default, never) : Message<{ var arg1 : TODO; var arg2 : TODO; var arg3 : TODO; var arg4 : TODO; var arg5 : TODO; var arg6 : TODO; }> = new Message("reboot");
	/**
		set update frequency
		
		Set game update-frequency. This option is equivalent to display.update_frequency but
		set in run-time
		
		@param frequency target frequency. 60 for 60 fps
	**/
	static var SetUpdateFrequency(default, never) : Message<{ var frequency : TODO; }> = new Message("set_update_frequency");
	/**
		starts video recording
		
		Starts video recording of the game frame-buffer to file. Current video format is the
		open vp8 codec in the ivf container. It's possible to upload this format directly
		to YouTube. The VLC video player has native support but with the known issue that
		not the entirely files is played back. It's probably an issue with VLC.
		The Miro Video Converter has support for vp8/ivf.
		NOTE: Audio is currently not supported
		
		@param file_name file name to write the video to
		@param frame_period frame period to record, ie write every nth frame. Default value is 2
		@param fps frames per second. Playback speed for the video. Default value is 30. The fps value doens't affect the recording. It's only meta-data in the written video file.
	**/
	static var StartRecord(default, never) : Message<{ var file_name : TODO; var frame_period : TODO; var fps : TODO; }> = new Message("start_record");
	/**
		stop current video recording
	**/
	static var StopRecord(default, never) : Message<{ }> = new Message("stop_record");
	/**
		shows/hides the on-screen physics visual debugging
		
		This message can only be sent to the designated `@system` socket.
	**/
	static var TogglePhysicsDebug(default, never) : Message<{ }> = new Message("toggle_physics_debug");
	/**
		shows/hides the on-screen profiler
		
		This message can only be sent to the designated `@system` socket.
	**/
	static var ToggleProfile(default, never) : Message<{ }> = new Message("toggle_profile");
}
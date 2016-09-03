package defold;

@:publicFields class CameraMessages {
	/**
		makes the receiving camera become the active camera
		
		<p>
		Post this message to a camera-component to activate it.
		</p>
		<p>
		Several cameras can be active at the same time, but only the camera that was last activated will be used for rendering.
		When the camera is deactivated (see <code>release_camera_focus</code>), the previously activated camera will again be used for rendering automatically.
		</p>
		<p>
		The reason it is called "camera focus" is the similarity to how acquiring input focus works (see <code>acquire_input_focus</code>).
		</p>
	**/
	static var AcquireCameraFocus(default, never) : Message<{ }> = new Message("acquire_camera_focus");
	/**
		deactivates the receiving camera
		
		<p>
		Post this message to a camera-component to deactivate it. The camera is then removed from the active cameras.
		See <code>acquire_camera_focus</code> for more information how the active cameras are used in rendering.
		</p>
	**/
	static var ReleaseCameraFocus(default, never) : Message<{ }> = new Message("release_camera_focus");
	/**
		sets camera properties
		
		<p>
		Post this message to a camera-component to set its properties at run-time.
		</p>
		
		@param aspect_ratio Aspect ratio of the screen (width divided by height)
		@param fov Field of view of the lens, measured as the angle between the right and left edge (radians)
		@param near_z Position of the near clipping plane (distance from camera along relative z)
		@param far_z Position of the far clipping plane (distance from camera along relative z)
	**/
	static var SetCamera(default, never) : Message<{ var aspect_ratio : TODO; var fov : TODO; var near_z : TODO; var far_z : TODO; }> = new Message("set_camera");
}
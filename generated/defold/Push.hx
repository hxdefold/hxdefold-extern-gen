package defold;

/**
	Functions and constants for interacting with local, as well as
	Apple's and Google's push notification services.

	See `PushVariables` for related variables.
**/
@:native("_G.push") extern class Push {
	/**
		Cancel a scheduled local push notification.
		
		Use this function to cancel a previously scheduled local push notification. The
		notification is identified by a numeric id as returned by +push.schedule()+.
		
		@param id the numeric id of the local push notification (number)
	**/
	static function cancel(id:Float):Void;
	/**
		Retrieve data on all scheduled local push notifications.
		
		Returns a table with all data associated with all scheduled local push notifications.
		The table contains key, value pairs where the key is the push notification id and the
		value is a table with the notification data, corresponding to the data given by
		push.get_scheduled(id).
		
		@return data table with all data associated with all scheduled notifications (table)
	**/
	static function get_all_scheduled():TODO;
	/**
		Retrieve data on a scheduled local push notification.
		
		Returns a table with all data associated with a specified local push notification.
		The notification is identified by a numeric id as returned by +push.schedule()+.
		
		@param id the numeric id of the local push notification (number)
		@return data table with all data associated with the notification (table)
	**/
	static function get_scheduled(id:Float):TODO;
	/**
		Register for push notifications.
		
		Send a request for push notifications. Note that the notifications table parameter
		is iOS only and will be ignored on Android.
		
		@param notifications the types of notifications to listen to. (iOS only) (table)
		@param callback register callback function (function)
	**/
	static function register(notifications:TODO<"iOS only) (table">, callback:TODO<"function">):Void;
	/**
		Schedule a local push notification to be triggered at a specific time in the future.
		
		Local push notifications are scheduled with this function.
		The returned `id` value is uniquely identifying the scheduled notification
		and can be stored for later reference.
		
		@param time number of seconds into the future until the notification should be triggered (number)
		@param title localized title to be displayed to the user if the application is not running (string)
		@param alert localized body message of the notification to be displayed to the user if the application is not running (string)
		@param payload JSON string to be passed to the registered listener function (string)
		@param notification_settings table with notification and platform specific fields (table)
		<dl>
		 <dt>`action`</dt>
		 <dd>(iOS only). The alert action string to be used as the title of the
		         right button of the alert or the value of the unlock slider, where the value replaces
		         "unlock" in "slide to unlock" text. (string)</dd>
		 <dt>`badge_count`</dt>
		 <dd>(iOS only). The numeric value of the icon badge. (number)</dd>
		 <dt>`badge_number`</dt>
		 <dd>Deprecated! Use badge_count instead</dd>
		 <dt>`priority`</dt>
		 <dd>(Android only). The priority is a hint to the device UI about how the notification
		     should be displayed. There are five priority levels, from -2 to 2 where -1 is the
		     lowest priority and 2 the highest. Unless specified, a default priority level of 2
		     is used. (number)</dd>
		</dl>
		@return id unique id that can be used to cancel or inspect the notification (number)
		@return err error string if something went wrong, otherwise nil (string)
	**/
	static function schedule(time:Float, title:String, alert:String, payload:String, notification_settings:TODO):TODO<"multiple">;
	/**
		Set badge icon count.
		
		Set the badge count for application icon.
		NOTE: This function is only available on iOS.
		
		@param count badge count (number)
	**/
	static function set_badge_count(count:Float):Void;
	/**
		Set push listener.
		
		The listener callback has the following signature: function(self, payload, origin, activated) where payload is a table
		with the push payload, origin is either ORIGIN_LOCAL or ORIGIN_REMOTE, and activated is either true or false depending
		on if the application was activated via the notification.
		
		@param listener listener callback function (function)
	**/
	static function set_listener(listener:TODO<"function">):Void;
}

@:native("_G.push") extern class PushVariables {
	/**
		Alert notification type.
	**/
	static var NOTIFICATION_ALERT(default, never) : TODO;
	/**
		Badge notification type.
	**/
	static var NOTIFICATION_BADGE(default, never) : TODO;
	/**
		Sound notification type.
	**/
	static var NOTIFICATION_SOUND(default, never) : TODO;
	/**
		Local push origin.
	**/
	static var ORIGIN_LOCAL(default, never) : TODO;
	/**
		Remote push origin.
	**/
	static var ORIGIN_REMOTE(default, never) : TODO;
}
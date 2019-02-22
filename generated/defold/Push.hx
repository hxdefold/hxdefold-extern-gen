package defold;

/**
    <p>Functions and constants for interacting with local, as well as
    Apple's and Google's push notification services. These API:s only exist on mobile platforms.
    <span class="icon-ios"></span> <span class="icon-android"></span></p>

    See `PushVariables` for related variables.
**/
@:native("_G.push")
extern class Push {
    /**
        Cancel a scheduled local push notification.
        
        Use this function to cancel a previously scheduled local push notification. The
        notification is identified by a numeric id as returned by `push.schedule()`.
        
        @param id 
        <span class="type">number</span> the numeric id of the local push notification
    **/
    static function cancel(id:Float):Void;

    /**
        Retrieve data on all scheduled local push notifications.
        
        Returns a table with all data associated with all scheduled local push notifications.
        The table contains key, value pairs where the key is the push notification id and the
        value is a table with the notification data, corresponding to the data given by
        `push.get_scheduled(id)`.
        
        @return data 
        <span class="type">table</span> table with all data associated with all scheduled notifications
    **/
    static function get_all_scheduled():TODO;

    /**
        Retrieve data on a scheduled local push notification.
        
        Returns a table with all data associated with a specified local push notification.
        The notification is identified by a numeric id as returned by `push.schedule()`.
        
        @param id 
        <span class="type">number</span> the numeric id of the local push notification
        
        @return data 
        <span class="type">table</span> table with all data associated with the notification
    **/
    static function get_scheduled(id:Float):TODO;

    /**
        Register for push notifications.
        
        Send a request for push notifications. Note that the notifications table parameter
        is iOS only and will be ignored on Android.
        
        @param notifications 
        <span class="type">table</span> the types of notifications to listen to. <span class="icon-ios"></span>
        
        @param callback 
        <span class="type">function(self, token, error)</span> register callback function.
        
        <dl>
        <dt>self</dt>
        <dd>
        
        <span class="type">object</span> The current object.
        
        </dd>
        <dt>token</dt>
        <dd>
        
        <span class="type">string</span> The returned push token if registration is successful.
        
        </dd>
        <dt>error</dt>
        <dd>
        
        <span class="type">table</span> A table containing eventual error information.
        
        </dd>
        </dl>
    **/
    static function register(notifications:TODO<"table</span> the types of notifications to listen to. <span class=\"icon-ios\">">, callback:TODO<"function(self, token, error)">):Void;

    /**
        Schedule a local push notification to be triggered at a specific time in the future.
        
        Local push notifications are scheduled with this function.
        The returned `id` value is uniquely identifying the scheduled notification
        and can be stored for later reference.
        
        @param time 
        <span class="type">number</span> number of seconds into the future until the notification should be triggered
        
        @param title 
        <span class="type">string</span> localized title to be displayed to the user if the application is not running
        
        @param alert 
        <span class="type">string</span> localized body message of the notification to be displayed to the user if the application is not running
        
        @param payload 
        <span class="type">string</span> JSON string to be passed to the registered listener function
        
        @param notification_settings 
        <span class="type">table</span> table with notification and platform specific fields
        
        <dl>
        <dt>action <span class="icon-ios"></span></dt>
        <dd><span class="type">string</span>
         The alert action string to be used as the title of the right button of the
         alert or the value of the unlock slider, where the value replaces
         "unlock" in "slide to unlock" text.</dd>
        <dt>badge_count <span class="icon-ios"></span></dt>
        <dd><span class="type">number</span> The numeric value of the icon badge.</dd>
        <dt><s>badge_number</s></dt>
        <dd>Deprecated! Use badge_count instead</dd>
        <dt>priority <span class="icon-android"></span></dt>
        <dd><span class="type">number</span>
         The priority is a hint to the device UI about how the notification
         should be displayed. There are five priority levels, from -2 to 2 where -1 is the
         lowest priority and 2 the highest. Unless specified, a default priority level of 2
         is used.</dd>
        </dl>
        @return id 
        <span class="type">number</span> unique id that can be used to cancel or inspect the notification
        
        @return err 
        <span class="type">string</span> error string if something went wrong, otherwise nil
    **/
    static function schedule(time:Float, title:String, alert:String, payload:String, notification_settings:TODO<"table">):TODO<"multiple">;

    /**
        Set badge icon count <span class="icon-ios"></span>.
        
        Set the badge count for application icon.
        This function is only available on iOS. <span class="icon-ios"></span>
        
        @param count 
        <span class="type">number</span> badge count
    **/
    static function set_badge_count(count:Float):Void;

    /**
        Set push listener.
        
        Sets a listener function to listen to push notifications.
        
        @param listener 
        <span class="type">function(self, payload, origin, activated)</span> listener callback function.
        Pass an empty function if you no longer wish to receive callbacks.
        
        <dl>
        <dt>`self`</dt>
        <dd><span class="type">object</span> The current object</dd>
        <dt>`payload`</dt>
        <dd><span class="type">table</span> the push payload</dd>
        <dt>`origin`</dt>
        <dd><span class="type">constant</span> push.ORIGIN_LOCAL or push.ORIGIN_REMOTE</dd>
        <dt>`activated`</dt>
        <dd><span class="type">boolean</span> true or false depending on if the application was
         activated via the notification.</dd>
        </dl>
    **/
    static function set_listener(listener:TODO<"function(self, payload, origin, activated)">):Void;
}

@:native("_G.push")
extern class PushVariables {
    /**
        Alert notification type.
    **/
    static var NOTIFICATION_ALERT(default, never):TODO;

    /**
        Badge notification type.
    **/
    static var NOTIFICATION_BADGE(default, never):TODO;

    /**
        Sound notification type.
    **/
    static var NOTIFICATION_SOUND(default, never):TODO;

    /**
        Local push origin.
    **/
    static var ORIGIN_LOCAL(default, never):TODO;

    /**
        Remote push origin.
    **/
    static var ORIGIN_REMOTE(default, never):TODO;

    /**
        Default notification priority <span class="icon-android"></span>.
        
        The default notification priority. Only available on Android. <span class="icon-android"></span>
    **/
    static var PRIORITY_DEFAULT(default, never):TODO;

    /**
        Higher notification priority <span class="icon-android"></span>.
        
        Priority for more important notifications or alerts. Only available on Android. <span class="icon-android"></span>
    **/
    static var PRIORITY_HIGH(default, never):TODO;

    /**
        Lower notification priority <span class="icon-android"></span>.
        
        Priority for items that are less important. Only available on Android. <span class="icon-android"></span>
    **/
    static var PRIORITY_LOW(default, never):TODO;

    /**
        Highest notification priority <span class="icon-android"></span>.
        
        Set this priority for your application's most important items that require the user's prompt attention or input. Only available on Android. <span class="icon-android"></span>
    **/
    static var PRIORITY_MAX(default, never):TODO;

    /**
        Lowest notification priority <span class="icon-android"></span>.
        
        This priority is for items might not be shown to the user except under special circumstances, such as detailed notification logs. Only available on Android. <span class="icon-android"></span>
    **/
    static var PRIORITY_MIN(default, never):TODO;
}
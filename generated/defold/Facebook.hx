package defold;

/**
    <p>Functions and constants for interacting with Facebook APIs.</p>

    See `FacebookVariables` for related variables.
**/
@:native("_G.facebook")
extern class Facebook {
    /**
        Get the current Facebook access token.
        
        This function returns the currently stored access token after a previous
        sucessful login. If it returns nil no access token exists and you need
        to perform a login to get the wanted permissions.
        
        @return token 
        <span class="type">string</span> the access token or nil if the user is not logged in
    **/
    static function access_token():TODO;

    /**
        Disable event usage with Facebook Analytics.
        
        This function will disable event usage for Facebook Analytics which means
        that Facebook won't be able to use event data for ad-tracking. Events will
        still be sent to Facebook for insights.
        
        <span class="icon-attention"></span> Event usage cannot be controlled and is always enabled for the
        Facebook Canvas platform, therefore this function has no effect on Facebook
        Canvas.
    **/
    static function disable_event_usage():Void;

    /**
        Enable event usage with Facebook Analytics.
        
        This function will enable event usage for Facebook Analytics which means
        that Facebook will be able to use event data for ad-tracking.
        
        <span class="icon-attention"></span> Event usage cannot be controlled and is always enabled for the
        Facebook Canvas platform, therefore this function has no effect on Facebook
        Canvas.
    **/
    static function enable_event_usage():Void;

    /**
        Login to Facebook and request a set of publish permissions.
        
        Login to Facebook and request a set of publish permissions. The user is
        prompted to authorize the application using the login dialog of the specific
        platform. Even if the user is already logged in to Facebook this function
        can still be used to request additional publish permissions.
        
        <span class="icon-attention"></span> Note that this function cannot be used to request read permissions.
        If the application requires both publish and read permissions, individual
        calls to both `login_with_publish_permissions`
        and `login_with_read_permissions` has to be made.
        
        A comprehensive list of permissions can be found in the `Facebook documentation`,
        as well as a `guide to best practises for login management`.
        
        @param permissions 
        <span class="type">table</span> Table with the requested publish permission strings.
        
        @param audience 
        <span class="type">constant | number</span> The audience that should be able to see the publications.
        
         * `facebook.AUDIENCE_NONE`
         * `facebook.AUDIENCE_ONLYME`
         * `facebook.AUDIENCE_FRIENDS`
         * `facebook.AUDIENCE_EVERYONE`
        
        @param callback 
        <span class="type">function(self, data)</span> Callback function that is executed when the permission request dialog is closed.
        
        <dl>
        <dt>`self`</dt>
        <dd><span class="type">object</span> The context of the calling script</dd>
        <dt>`data`</dt>
        <dd><span class="type">table</span> A table that contains the response</dd>
        </dl>
    **/
    static function login_with_publish_permissions(permissions:TODO<"table">, audience:EitherType<Float, TODO<"constant">>, callback:TODO<"function(self, data)">):Void;

    /**
        Login to Facebook and request a set of read permissions.
        
        Login to Facebook and request a set of read permissions. The user is
        prompted to authorize the application using the login dialog of the specific
        platform. Even if the user is already logged in to Facebook this function
        can still be used to request additional read permissions.
        
        <span class="icon-attention"></span> Note that this function cannot be used to request publish permissions.
        If the application requires both read and publish permissions, individual
        calls to both `login_with_publish_permissions`
        and `login_with_read_permissions` has to be made.
        
        A comprehensive list of permissions can be found in the `Facebook documentation`,
        as well as a `guide to best practises for login management`.
        
        @param permissions 
        <span class="type">table</span> Table with the requested read permission strings.
        
        @param callback 
        <span class="type">function(self, data)</span> callback function that is executed when the permission request dialog is closed.
        
        <dl>
        <dt>`self`</dt>
        <dd><span class="type">object</span> The context of the calling script</dd>
        <dt>`data`</dt>
        <dd><span class="type">table</span> A table that contains the response</dd>
        </dl>
    **/
    static function login_with_read_permissions(permissions:TODO<"table">, callback:TODO<"function(self, data)">):Void;

    /**
        Logout from Facebook.
        
        Logout from Facebook.
    **/
    static function logout():Void;

    /**
        Get the currently granted permissions.
        
        This function returns a table with all the currently granted permission strings.
        
        @return permissions 
        <span class="type">table</span> the permissions
    **/
    static function permissions():TODO;

    /**
        Post an event to Facebook Analytics.
        
        This function will post an event to Facebook Analytics where it can be used
        in the Facebook Insights system.
        
        @param event 
        <span class="type">constant | string</span> An event can either be one of the predefined
        constants below or a text string which can be used to define a custom event that is
        registered with Facebook Analytics.
        
         * `facebook.EVENT_ACHIEVED_LEVEL`
         * `facebook.EVENT_ADDED_PAYMENT_INFO`
         * `facebook.EVENT_ADDED_TO_CART`
         * `facebook.EVENT_ADDED_TO_WISHLIST`
         * `facebook.EVENT_COMPLETED_REGISTRATION`
         * `facebook.EVENT_COMPLETED_TUTORIAL`
         * `facebook.EVENT_INITIATED_CHECKOUT`
         * `facebook.EVENT_PURCHASED`
         * `facebook.EVENT_RATED`
         * `facebook.EVENT_SEARCHED`
         * `facebook.EVENT_SPENT_CREDITS`
         * `facebook.EVENT_TIME_BETWEEN_SESSIONS`
         * `facebook.EVENT_UNLOCKED_ACHIEVEMENT`
         * `facebook.EVENT_VIEWED_CONTENT`
        
        @param value 
        <span class="type">number</span> a numeric value for the event. This should
        represent the value of the event, such as the level achieved, price for an
        item or number of orcs killed.
        
        @param params 
        <span class="type">table</span> optional table with parameters and their values. A key in the
        table can either be one of the predefined constants below or a text which
        can be used to define a custom parameter.
        
         * `facebook.PARAM_CONTENT_ID`
         * `facebook.PARAM_CONTENT_TYPE`
         * `facebook.PARAM_CURRENCY`
         * `facebook.PARAM_DESCRIPTION`
         * `facebook.PARAM_LEVEL`
         * `facebook.PARAM_MAX_RATING_VALUE`
         * `facebook.PARAM_NUM_ITEMS`
         * `facebook.PARAM_PAYMENT_INFO_AVAILABLE`
         * `facebook.PARAM_REGISTRATION_METHOD`
         * `facebook.PARAM_SEARCH_STRING`
         * `facebook.PARAM_SOURCE_APPLICATION`
         * `facebook.PARAM_SUCCESS`
    **/
    static function post_event(event:EitherType<String, TODO<"constant">>, value:Float, ?params:TODO<"table">):Void;

    /**
        Show facebook web dialog.
        
        Display a Facebook web dialog of the type specified in the `dialog` parameter.
        The `param` table should be set up according to the requirements of each dialog
        type. Note that some parameters are mandatory. Below is the list of available dialogs and
        where to find Facebook's developer documentation on parameters and response data.
        
        <h3>"apprequests"</h3>
        
        Shows a Game Request dialog. Game Requests allows players to invite their friends to play a
        game. Available parameters:
        
         * <span class="type">string</span> `title`
         * <span class="type">string</span> `message`
         * <span class="type">number</span> `action_type`
         * <span class="type">number</span> `filters`
         * <span class="type">string</span> `data`
         * <span class="type">string</span> `object_id`
         * <span class="type">table</span> `suggestions`
         * <span class="type">table</span> `recipients`
         * <span class="type">string</span> `to`
        
        On success, the "result" table parameter passed to the callback function will include the following fields:
        
         * <span class="type">string</span> `request_id`
         * <span class="type">table</span> `to`
        
        Details for each parameter: <a href='https://developers.facebook.com/docs/games/services/gamerequests/v2.6#dialogparameters'>https://developers.facebook.com/docs/games/services/gamerequests/v2.6#dialogparameters</a>
        
        <h3>"feed"</h3>
        
        The Feed Dialog allows people to publish individual stories to their timeline.
        
         * <span class="type">string</span> `caption`
         * <span class="type">string</span> `description`
         * <span class="type">string</span> `picture`
         * <span class="type">string</span> `link`
         * <span class="type">table</span> `people_ids`
         * <span class="type">string</span> `place_id`
         * <span class="type">string</span> `ref`
        
        On success, the "result" table parameter passed to the callback function will include the following fields:
        
         * <span class="type">string</span> `post_id`
        
        Details for each parameter: <a href='https://developers.facebook.com/docs/sharing/reference/feed-dialog/v2.6#params'>https://developers.facebook.com/docs/sharing/reference/feed-dialog/v2.6#params</a>
        
        <h3>"appinvite"</h3>
        
        The App Invite dialog is available only on iOS and Android.
        Note that the `url` parameter
        corresponds to the appLinkURL (iOS) and setAppLinkUrl (Android) properties.
        
         * <span class="type">string</span> `url`
         * <span class="type">string</span> `preview_image`
        
        Details for each parameter: <a href='https://developers.facebook.com/docs/reference/ios/current/class/FBSDKAppInviteContent/'>https://developers.facebook.com/docs/reference/ios/current/class/FBSDKAppInviteContent/</a>
        
        @param dialog 
        <span class="type">string</span> dialog to show.
        - `"apprequests"`
        - `"feed"`
        - `"appinvite"`
        
        @param param 
        <span class="type">table</span> table with dialog parameters
        
        @param callback 
        <span class="type">function(self, result, error)</span> callback function that is called when the dialog is closed.
        
        <dl>
        <dt>`self`</dt>
        <dd><span class="type">object</span> The context of the calling script</dd>
        <dt>`result`</dt>
        <dd><span class="type">table</span> Table with dialog specific results. See above.</dd>
        <dt>`error`</dt>
        <dd><span class="type">table</span> Error message. If there is no error, `error` is `nil`.</dd>
        </dl>
    **/
    static function show_dialog(dialog:String, param:TODO<"table">, callback:TODO<"function(self, result, error)">):Void;
}

@:native("_G.facebook")
extern class FacebookVariables {
    /**
        Publish permission to reach everyone.
    **/
    static var AUDIENCE_EVERYONE(default, never):TODO;

    /**
        Publish permission to reach user friends.
    **/
    static var AUDIENCE_FRIENDS(default, never):TODO;

    /**
        Publish permission to reach no audience.
    **/
    static var AUDIENCE_NONE(default, never):TODO;

    /**
        Publish permission to reach only me (private to current user).
    **/
    static var AUDIENCE_ONLYME(default, never):TODO;

    /**
        Log this event when a person achieves specific levels you define within your application, business, or organization.
    **/
    static var EVENT_ACHIEVED_LEVEL(default, never):TODO;

    /**
        Log this event when the user has entered their payment info.
    **/
    static var EVENT_ADDED_PAYMENT_INFO(default, never):TODO;

    /**
        Log this event when the user has added an item to their cart.
        
        The value_to_sum passed to facebook.post_event should be the item's price.
    **/
    static var EVENT_ADDED_TO_CART(default, never):TODO;

    /**
        Log this event when the user has added an item to their wish list.
        
        The value_to_sum passed to facebook.post_event should be the item's price.
    **/
    static var EVENT_ADDED_TO_WISHLIST(default, never):TODO;

    /**
        Log this event when a user has completed registration with the app.
    **/
    static var EVENT_COMPLETED_REGISTRATION(default, never):TODO;

    /**
        Log this event when the user has completed a tutorial in the app.
    **/
    static var EVENT_COMPLETED_TUTORIAL(default, never):TODO;

    /**
        Log this event when the user has entered the checkout process.
        
        The value_to_sum passed to facebook.post_event should be the total price in
        the cart.
    **/
    static var EVENT_INITIATED_CHECKOUT(default, never):TODO;

    /**
        Log this event when the user has completed a purchase..
    **/
    static var EVENT_PURCHASED(default, never):TODO;

    /**
        Log this event when the user has rated an item in the app.
        
        The value_to_sum passed to facebook.post_event should be the numeric rating.
    **/
    static var EVENT_RATED(default, never):TODO;

    /**
        Log this event when a user has performed a search within the app.
    **/
    static var EVENT_SEARCHED(default, never):TODO;

    /**
        Log this event when the user has spent app credits.
        
        The value_to_sum passed to facebook.post_event should be the number of
        credits spent.
        
        <span class="icon-attention"></span> This event is currently an undocumented event in the Facebook
        SDK.
    **/
    static var EVENT_SPENT_CREDITS(default, never):TODO;

    /**
        Log this event when measuring the time between user sessions.
    **/
    static var EVENT_TIME_BETWEEN_SESSIONS(default, never):TODO;

    /**
        Log this event when the user has unlocked an achievement in the app.
    **/
    static var EVENT_UNLOCKED_ACHIEVEMENT(default, never):TODO;

    /**
        Log this event when a user has viewed a form of content in the app.
    **/
    static var EVENT_VIEWED_CONTENT(default, never):TODO;

    /**
        Game request action type "askfor" for "apprequests" dialog.
    **/
    static var GAMEREQUEST_ACTIONTYPE_ASKFOR(default, never):TODO;

    /**
        Game request action type "none" for "apprequests" dialog.
    **/
    static var GAMEREQUEST_ACTIONTYPE_NONE(default, never):TODO;

    /**
        Game request action type "send" for "apprequests" dialog.
    **/
    static var GAMEREQUEST_ACTIONTYPE_SEND(default, never):TODO;

    /**
        Game request action type "turn" for "apprequests" dialog.
    **/
    static var GAMEREQUEST_ACTIONTYPE_TURN(default, never):TODO;

    /**
        Game request filter type "app_non_users" for "apprequests" dialog.
    **/
    static var GAMEREQUEST_FILTER_APPNONUSERS(default, never):TODO;

    /**
        Game request filter type "app_users" for "apprequests" dialog.
    **/
    static var GAMEREQUEST_FILTER_APPUSERS(default, never):TODO;

    /**
        Game request filter type "none" for "apprequests" dialog.
    **/
    static var GAMEREQUEST_FILTER_NONE(default, never):TODO;

    /**
        Parameter key used to specify an ID for the content being logged about.
        
        The parameter key could be an EAN, article identifier, etc., depending
        on the nature of the app.
    **/
    static var PARAM_CONTENT_ID(default, never):TODO;

    /**
        Parameter key used to specify a generic content type/family for the logged event.
        
        The key is an arbitrary type/family (e.g. "music", "photo", "video") depending
        on the nature of the app.
    **/
    static var PARAM_CONTENT_TYPE(default, never):TODO;

    /**
        Parameter key used to specify currency used with logged event.
        
        Use a currency value key, e.g. "USD", "EUR", "GBP" etc.
        See ISO-4217 for specific values.
    **/
    static var PARAM_CURRENCY(default, never):TODO;

    /**
        Parameter key used to specify a description appropriate to the event being logged.
        
        Use this for app specific event description, for instance the name of the achievement
        unlocked in the facebook.EVENT_UNLOCKED_ACHIEVEMENT event.
    **/
    static var PARAM_DESCRIPTION(default, never):TODO;

    /**
        Parameter key used to specify the level achieved.
    **/
    static var PARAM_LEVEL(default, never):TODO;

    /**
        Parameter key used to specify the maximum rating available.
        
        Set to specify the max rating available for the facebook.EVENT_RATED event.
        E.g., "5" or "10".
    **/
    static var PARAM_MAX_RATING_VALUE(default, never):TODO;

    /**
        Parameter key used to specify how many items are being processed.
        
        Set to specify the number of items being processed for an
        facebook.EVENT_INITIATED_CHECKOUT or facebook.EVENT_PURCHASED event.
    **/
    static var PARAM_NUM_ITEMS(default, never):TODO;

    /**
        Parameter key used to specify whether payment info is available.
        
        Set to specify if payment info is available for the
        facebook.EVENT_INITIATED_CHECKOUT event.
    **/
    static var PARAM_PAYMENT_INFO_AVAILABLE(default, never):TODO;

    /**
        Parameter key used to specify method user has used to register for the app.
        
        Set to specify what registation method a user used for the app, e.g.
        "Facebook", "email", "Twitter", etc.
    **/
    static var PARAM_REGISTRATION_METHOD(default, never):TODO;

    /**
        Parameter key used to specify user search string.
        
        Set this to the the string that the user provided for a search
        operation.
    **/
    static var PARAM_SEARCH_STRING(default, never):TODO;

    /**
        Parameter key used to specify source application package.
    **/
    static var PARAM_SOURCE_APPLICATION(default, never):TODO;

    /**
        Parameter key used to specify activity success.
        
        Set this key to indicate whether the activity being logged about was
        successful or not.
    **/
    static var PARAM_SUCCESS(default, never):TODO;

    /**
        The Facebook login session has closed because login failed.
    **/
    static var STATE_CLOSED_LOGIN_FAILED(default, never):TODO;

    /**
        The Facebook login session is open.
    **/
    static var STATE_OPEN(default, never):TODO;
}
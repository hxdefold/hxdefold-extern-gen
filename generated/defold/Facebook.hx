package defold;

@:native("_G.facebook") extern class Facebook {
	/**
		get the current Facebook access token
	**/
	static function access_token():TODO;
	/**
		Disable event usage with Facebook Analytics
		
		This function will disable event usage for Facebook Analytics which means
		that Facebook won't be able to use event data for ad-tracking. Events will
		still be sent to Facebook for insights.
		
		<b>NOTE!</b> Event usage cannot be controlled and is always enabled for the
		Facebook Canvas platform, therefore this function has no effect on Facebook
		Canvas.
	**/
	static function disable_event_usage():TODO;
	/**
		Enable event usage with Facebook Analytics
		
		This function will enable event usage for Facebook Analytics which means
		that Facebook will be able to use event data for ad-tracking.
		
		<b>NOTE!</b> Event usage cannot be controlled and is always enabled for the
		Facebook Canvas platform, therefore this function has no effect on Facebook
		Canvas.
	**/
	static function enable_event_usage():TODO;
	/**
		initiate a Facebook login
		
		This function opens a Facebook login dialog allowing the user to log into Facebook
		with his/her account. This performs a login requesting read permission for:
		<ul>
		  <li><code>"public_profile"</code></li>
		  <li><code>"email"</code></li>
		  <li><code>"user_friends"</code></li>
		</ul>
		The actual permission that the user grants can be retrieved with <code>facebook.permissions()</code>.
		
		@param callback callback function with parameters (self, status, error), when the login attempt is done. (function)
	**/
	static function login(callback:TODO):TODO;
	/**
		logout from Facebook
		
		Logout from Facebook.
	**/
	static function logout():TODO;
	/**
		return a table with "me" user data
		
		This function returns a table of user data as requested from the Facebook Graph API
		"me" path. The user data is fetched during facebook.login().
		
		The table contains the following fields:
		
		<ul>
		  <li><code>"name"</code></li>
		  <li><code>"last_name"</code></li>
		  <li><code>"first_name"</code></li>
		  <li><code>"id"</code></li>
		  <li><code>"email"</code></li>
		  <li><code>"link"</code></li>
		  <li><code>"gender"</code></li>
		  <li><code>"locale"</code></li>
		  <li><code>"updated_time"</code></li>
		</ul>
	**/
	static function me():TODO;
	/**
		get the currently granted permissions
		
		This function returns a table with all the currently granted permission strings.
	**/
	static function permissions():TODO;
	/**
		post an event to Facebook Analytics
		
		This function will post an event to Facebook Analytics where it can be used
		in the Facebook Insights system.
		
		@param event (constant|text) An event can either be one of the predefined
		constants below or a text which can be used to define a custom event that is
		registered with Facebook Analytics.
		<ul>
		    <li>facebook.EVENT_ACHIEVED_LEVEL</li>
		    <li>facebook.EVENT_ACTIVATED_APP</li>
		    <li>facebook.EVENT_ADDED_PAYMENT_INFO</li>
		    <li>facebook.EVENT_ADDED_TO_CART</li>
		    <li>facebook.EVENT_ADDED_TO_WISHLIST</li>
		    <li>facebook.EVENT_COMPLETED_REGISTRATION</li>
		    <li>facebook.EVENT_COMPLETED_TUTORIAL</li>
		    <li>facebook.EVENT_DEACTIVATED_APP</li>
		    <li>facebook.EVENT_INITIATED_CHECKOUT</li>
		    <li>facebook.EVENT_PURCHASED</li>
		    <li>facebook.EVENT_RATED</li>
		    <li>facebook.EVENT_SEARCHED</li>
		    <li>facebook.EVENT_SESSION_INTERRUPTIONS</li>
		    <li>facebook.EVENT_SPENT_CREDITS</li>
		    <li>facebook.EVENT_TIME_BETWEEN_SESSIONS</li>
		    <li>facebook.EVENT_UNLOCKED_ACHIEVEMENT</li>
		    <li>facebook.EVENT_VIEWED_CONTENT</li>
		</ul>
		@param value_to_sum (number) A numeric value for the event. This should
		represent the value of the event, such as the level achieved, price for an
		item or number of orcs killed.
		@param params (table) A table with parameters and their values. A key in the
		table can either be one of the predefined constants below or a text which
		can be used to define a custom parameter. Optional argument.
		<ul>
		    <li>facebook.PARAM_CONTENT_ID</li>
		    <li>facebook.PARAM_CONTENT_TYPE</li>
		    <li>facebook.PARAM_CURRENCY</li>
		    <li>facebook.PARAM_DESCRIPTION</li>
		    <li>facebook.PARAM_LEVEL</li>
		    <li>facebook.PARAM_MAX_RATING_VALUE</li>
		    <li>facebook.PARAM_NUM_ITEMS</li>
		    <li>facebook.PARAM_PAYMENT_INFO_AVAILABLE</li>
		    <li>facebook.PARAM_REGISTRATION_METHOD</li>
		    <li>facebook.PARAM_SEARCH_STRING</li>
		    <li>facebook.PARAM_SOURCE_APPLICATION</li>
		    <li>facebook.PARAM_SUCCESS</li>
		</ul>
	**/
	static function post_event(event:TODO, value_to_sum:TODO, params:TODO):TODO;
	/**
		logs the user in with the requested publish permissions
		
		Log in the user on Facebook with the specified publish permissions. Check the permissions the user
		 actually granted with <code>facebook.permissions()</code>.
		
		@param permissions a table with the requested permissions (table)
		@param audience (constant|number)
		<ul>
		    <li>facebook.AUDIENCE_NONE</li>
		    <li>facebook.AUDIENCE_ONLYME</li>
		    <li>facebook.AUDIENCE_FRIENDS</li>
		    <li>facebook.AUDIENCE_EVERYONE</li>
		</ul>
		@param callback callback function with parameters (self, error) that is called when the permission request dialog is closed. (function)
	**/
	static function request_publish_permissions(permissions:TODO, audience:TODO, callback:TODO):TODO;
	/**
		logs the user in with the requested read permissions
		
		Log in the user on Facebook with the specified read permissions. Check the permissions the user
		actually granted with <code>facebook.permissions()</code>.
		
		@param permissions a table with the requested permission strings (table)
		The following strings are valid permission identifiers and are requested by default on login:
		<ul>
		  <li><code>"public_profile"</code></li>
		  <li><code>"email"</code></li>
		  <li><code>"user_friends"</code></li>
		</ul>
		A comprehensive list of permissions can be found at <a href='https://developers.facebook.com/docs/facebook-login/permissions/v2.6'>https://developers.facebook.com/docs/facebook-login/permissions/v2.6</a>
		@param callback callback function with parameters (self, error) that is called when the permission request dialog is closed. (function)
	**/
	static function request_read_permissions(permissions:TODO, callback:TODO):TODO;
	/**
		show facebook web dialog
		
		Display a Facebook web dialog of the type specified in the <code>dialog</code> parameter.
		The <code>param</code> table should be set up according to the requirements of each dialog
		type. Note that some parameters are mandatory. Below is the list of available dialogs and
		where to find Facebook's developer documentation on parameters and response data.
		
		<code>apprequests</code>
		
		Shows a Game Request dialog. Game Requests allows players to invite their friends to play a
		game. Available parameters:
		
		<ul>
		  <li><code>title</code> (string)</li>
		  <li><code>message</code> (string)</li>
		  <li><code>action_type</code> (number)</li>
		  <li><code>filters</code> (number)</li>
		  <li><code>data</code> (string)</li>
		  <li><code>object_id</code> (string)</li>
		  <li><code>suggestions</code> (table)</li>
		  <li><code>recipients</code> (table)</li>
		  <li><code>to</code> (string)</li>
		</ul>
		
		On success, the "result" table parameter passed to the callback function will include the following fields:
		<ul>
		  <li><code>request_id</code> (string)</li>
		  <li><code>to</code> (table)</li>
		</ul>
		
		Details for each parameter: <a href='https://developers.facebook.com/docs/games/services/gamerequests/v2.6#dialogparameters'>https://developers.facebook.com/docs/games/services/gamerequests/v2.6#dialogparameters</a>
		
		<code>feed</code>
		
		The Feed Dialog allows people to publish individual stories to their timeline.
		
		<ul>
		  <li><code>caption</code> (string)</li>
		  <li><code>description</code> (string)</li>
		  <li><code>picture</code> (string)</li>
		  <li><code>link</code> (string)</li>
		  <li><code>people_ids</code> (table)</li>
		  <li><code>place_id</code> (string)</li>
		  <li><code>ref</code> (string)</li>
		</ul>
		
		On success, the "result" table parameter passed to the callback function will include the following fields:
		<ul>
		  <li><code>post_id</code> (string)</li>
		</ul>
		
		Details for each parameter: <a href='https://developers.facebook.com/docs/sharing/reference/feed-dialog/v2.6#params'>https://developers.facebook.com/docs/sharing/reference/feed-dialog/v2.6#params</a>
		
		<code>appinvite</code>
		
		The App Invite dialog is available only on iOS and Android. Note that the <code>url</code> parameter
		corresponds to the appLinkURL (iOS) and setAppLinkUrl (Android) properties.
		
		<ul>
		  <li><code>url</code> (string)</li>
		  <li><code>preview_image</code> (string)</li>
		</ul>
		
		Details for each parameter: <a href='https://developers.facebook.com/docs/reference/ios/current/class/FBSDKAppInviteContent/'>https://developers.facebook.com/docs/reference/ios/current/class/FBSDKAppInviteContent/</a>
		
		@param dialog dialog to show. "apprequests", "feed" or "appinvite" (string)
		@param param table with dialog parameters (table)
		@param callback callback function with parameters (self, result, error) that is called when the dialog is closed. Result is table with an url-field set. (function)
	**/
	static function show_dialog(dialog:TODO, param:TODO, callback:TODO):TODO;
}

@:native("_G.facebook") extern class FacebookVariables {
	/**
		Publish permission to reach everyone.
	**/
	static var AUDIENCE_EVERYONE(default, never) : TODO;
	/**
		Publish permission to reach user friends.
	**/
	static var AUDIENCE_FRIENDS(default, never) : TODO;
	/**
		Publish permission to reach no audience.
	**/
	static var AUDIENCE_NONE(default, never) : TODO;
	/**
		Publish permission to reach only me (private to current user).
	**/
	static var AUDIENCE_ONLYME(default, never) : TODO;
	/**
		Log this event when the user has entered their payment info.
	**/
	static var EVENT_ADDED_PAYMENT_INFO(default, never) : TODO;
	/**
		Log this event when the user has added an item to their cart. The
		
		value_to_sum passed to facebook.post_event should be the item's price.
	**/
	static var EVENT_ADDED_TO_CART(default, never) : TODO;
	/**
		Log this event when the user has added an item to their wishlist. The
		
		value_to_sum passed to facebook.post_event should be the item's price.
	**/
	static var EVENT_ADDED_TO_WISHLIST(default, never) : TODO;
	/**
		Log this event when a user has completed registration with the app.
	**/
	static var EVENT_COMPLETED_REGISTRATION(default, never) : TODO;
	/**
		Log this event when the user has completed a tutorial in the app.
	**/
	static var EVENT_COMPLETED_TUTORIAL(default, never) : TODO;
	/**
		Log this event when the user has entered the checkout process. The
		
		value_to_sum passed to facebook.post_event should be the total price in
		the cart.
	**/
	static var EVENT_INITIATED_CHECKOUT(default, never) : TODO;
	/**
		Log this event when the user has completed a purchase.
	**/
	static var EVENT_PURCHASED(default, never) : TODO;
	/**
		Log this event when the user has rated an item in the app. The
		
		value_to_sum  passed to facebook.post_event should be the numeric rating.
	**/
	static var EVENT_RATED(default, never) : TODO;
	/**
		Log this event when a user has performed a search within the app.
	**/
	static var EVENT_SEARCHED(default, never) : TODO;
	/**
		Log this event when the user has spent app credits. The value_to_sum
		
		passed to facebook.post_event should be the number of credits spent.
		
		<p>
		<b>NOTE!</b> This event is currently an undocumented event in the Facebook
		SDK.
		</p>
	**/
	static var EVENT_SPENT_CREDITS(default, never) : TODO;
	/**
		Log this event when measuring the time between user sessions.
	**/
	static var EVENT_TIME_BETWEEN_SESSIONS(default, never) : TODO;
	/**
		Log this event when the user has unlocked an achievement in the app.
	**/
	static var EVENT_UNLOCKED_ACHIEVEMENT(default, never) : TODO;
	/**
		Log this event when a user has viewed a form of content in the app.
	**/
	static var EVENT_VIEWED_CONTENT(default, never) : TODO;
	/**
		Game Request action type "askfor" for "apprequests" dialog
	**/
	static var GAMEREQUEST_ACTIONTYPE_ASKFOR(default, never) : TODO;
	/**
		Game Request action type "none" for "apprequests" dialog
	**/
	static var GAMEREQUEST_ACTIONTYPE_NONE(default, never) : TODO;
	/**
		Game Request action type "send" for "apprequests" dialog
	**/
	static var GAMEREQUEST_ACTIONTYPE_SEND(default, never) : TODO;
	/**
		Game Request action type "turn" for "apprequests" dialog
	**/
	static var GAMEREQUEST_ACTIONTYPE_TURN(default, never) : TODO;
	/**
		Gamerequest filter type "app_non_users" for "apprequests" dialog
	**/
	static var GAMEREQUEST_FILTER_APPNONUSERS(default, never) : TODO;
	/**
		Gamerequest filter type "app_users" for "apprequests" dialog
	**/
	static var GAMEREQUEST_FILTER_APPUSERS(default, never) : TODO;
	/**
		Gamerequest filter type "none" for "apprequests" dialog
	**/
	static var GAMEREQUEST_FILTER_NONE(default, never) : TODO;
	/**
		Parameter key used to specify an ID for the specific piece of content
		
		being logged about. Could be an EAN, article identifier, etc., depending
		 on the nature of the app.
	**/
	static var PARAM_CONTENT_ID(default, never) : TODO;
	/**
		Parameter key used to specify a generic content type/family for the logged
		
		event, e.g. "music", "photo", "video". Options to use will vary based upon
		 what the app is all about.
	**/
	static var PARAM_CONTENT_TYPE(default, never) : TODO;
	/**
		Parameter key used to specify currency used with logged event. E.g. "USD",
		
		"EUR", "GBP". See ISO-4217 for specific values.
	**/
	static var PARAM_CURRENCY(default, never) : TODO;
	/**
		Parameter key used to specify a description appropriate to the event being
		
		logged. E.g., the name of the achievement unlocked in the
		 facebook.EVENT_UNLOCKED_ACHIEVEMENT event.
	**/
	static var PARAM_DESCRIPTION(default, never) : TODO;
	/**
		Parameter key used to specify the level achieved.
	**/
	static var PARAM_LEVEL(default, never) : TODO;
	/**
		Parameter key used to specify the maximum rating available for the
		
		facebook.EVENT_RATED event. E.g., "5" or "10".
	**/
	static var PARAM_MAX_RATING_VALUE(default, never) : TODO;
	/**
		Parameter key used to specify how many items are being processed for an
		
		facebook.EVENT_INITIATED_CHECKOUT or facebook.EVENT_PURCHASED event.
	**/
	static var PARAM_NUM_ITEMS(default, never) : TODO;
	/**
		Parameter key used to specify whether payment info is available for the
		
		facebook.EVENT_INITIATED_CHECKOUT event.
	**/
	static var PARAM_PAYMENT_INFO_AVAILABLE(default, never) : TODO;
	/**
		Parameter key used to specify method user has used to register for the
		
		app, e.g., "Facebook", "email", "Twitter", etc.
	**/
	static var PARAM_REGISTRATION_METHOD(default, never) : TODO;
	/**
		Parameter key used to specify the string provided by the user for a search
		
		operation.
	**/
	static var PARAM_SEARCH_STRING(default, never) : TODO;
	/**
		Parameter key used to specify source application package.
	**/
	static var PARAM_SOURCE_APPLICATION(default, never) : TODO;
	/**
		Parameter key used to specify whether the activity being logged about was
		
		successful or not.
	**/
	static var PARAM_SUCCESS(default, never) : TODO;
	/**
		The Facebook login session has closed because login failed
	**/
	static var STATE_CLOSED_LOGIN_FAILED(default, never) : TODO;
	/**
		The Facebook login session is open
	**/
	static var STATE_OPEN(default, never) : TODO;
}
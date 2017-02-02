package defold;

/**
	Functions and for creating and controlling webviews to show html pages
	or evaluate javascript.
**/
@:native("_G.webview") extern class Webview {
	/**
		Creates a webview.
		
		Creates a webview instance. It that can show html pages as well as evaluate javascript. It remains hidden until the first call
		
		On iOS, the callback will never get a webview.CALLBACK_RESULT_EVAL_ERROR, due to the iOS SDK implementation
		
		@param callback (function) A callback which receives info about finished requests taking the following parameters
		
		<dl>
		    <dt>`self` (object)</dt> <dd>The calling script</dd>
		    <dt>`webview_id` (number)</dt> <dd>The webview id</dd>
		    <dt>`request_id` (number)</dt> <dd>The request id</dd>
		    <dt>`type` (number)</dt>
		     <dd>The type of the callback. Can be one of these:
		     
		
		          * webview.CALLBACK_RESULT_URL_OK
		          * webview.CALLBACK_RESULT_URL_ERROR
		          * webview.CALLBACK_RESULT_EVAL_OK
		          * webview.CALLBACK_RESULT_EVAL_ERROR
		     
		
		     </dd>
		    <dt>`data` (table)</dt>
		     <dd>The callback value ''data'' is a table which currently holds these values
		     
		
		         * url (string) The url used in the webview.open() call. nil otherwise.
		         * result (string) Holds the result of either: a failed url open, a successful eval request or a failed eval. nil otherwise
		     
		
		     </dd>
		</dl>
		@return (int) The id number of the webview
	**/
	static function create(callback:TODO):TODO;

	/**
		Destroys a webview.
		
		Destroys an instance of a webview
		
		@param webview_id (number) The webview id (returned by the webview.create() call)
	**/
	static function destroy(webview_id:TODO<"number) The webview id (returned by the webview.create() call">):Void;

	/**
		Evaluates javascript in a webview.
		
		Evaluates java script within the context of the currently loaded page (if any). Once the request is done, the callback (registered in webview.create() ) is invoked. The callback will get the result in the data["result"] field.
		
		@param webview_id    (number) The webview id
		@param code          (string) The java script code to evaluate
		@return (int) The id number of the request
	**/
	static function eval(webview_id:TODO, code:TODO):TODO;

	/**
		Gets the visibility state of the webview.
		
		Gets the visibility state of the webview
		
		@param webview_id    (number) The webview id (returned by the webview.create() call)
		@return (number) Returns 0 if not visible, 1 if it is visible
	**/
	static function is_visible(webview_id:TODO<"number) The webview id (returned by the webview.create() call">):TODO;

	/**
		Open a page uring an url.
		
		Opens a web page in the webview, using an url. Once the request is done, the callback (registered in webview.create() ) is invoked
		
		@param webview_id    (number) The webview id
		@param url           (string) The url to open
		@param options       (table) A table of options for the request. Currently it holds these options
		<dl>
		    <dt>hidden (boolean)</dt><dd>If true, the webview will stay hidden (default=false)</dd>
		</dl>
		@return (int) The id number of the request
	**/
	static function open(webview_id:TODO, url:TODO, options:TODO):TODO;

	/**
		Open a page using html.
		
		Opens a web page in the webview, using html data. Once the request is done, the callback (registered in webview.create() ) is invoked
		
		@param webview_id    (number) The webview id
		@param html          (string) The html data to display
		@param options       (table) A table of options for the request. See webview.open()
		@return (int) The id number of the request
	**/
	static function open_raw(webview_id:TODO, html:TODO, options:TODO<"table) A table of options for the request. See webview.open(">):TODO;

	/**
		Shows or hides a web view.
		
		Shows or hides a web view
		
		@param webview_id    (number) The webview id (returned by the webview.create() call)
		@param visible       (number) If 0, hides the webview. If non zero, shows the view
	**/
	static function set_visible(webview_id:TODO<"number) The webview id (returned by the webview.create() call">, visible:TODO):Void;
}
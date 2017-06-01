package defold;

/**
    <p>Functions and for creating and controlling webviews to show html pages
    or evaluate javascript.</p>
**/
@:native("_G.webview")
extern class Webview {
    /**
        Creates a webview.
        
        Creates a webview instance. It can show HTML pages as well as evaluate Javascript.
        The view remains hidden until the first call.
        
        <span class="icon-ios"></span> On iOS, the callback will never get a webview.CALLBACK_RESULT_EVAL_ERROR,
        due to the iOS SDK implementation.
        
        @param callback 
        <span class="type">function(self, webview_id, request_id, type, data)</span> A callback which receives info about finished requests taking the following parameters
        
        <dl>
        <dt>`self`</dt>
        <dd><span class="type">object</span> The calling script</dd>
        <dt>`webview_id`</dt>
        <dd><span class="type">number</span> The webview id</dd>
        <dt>`request_id`</dt>
        <dd><span class="type">number</span> The request id</dd>
        <dt>`type`</dt>
        <dd><span class="type">number</span> The type of the callback. Can be one of these:</dd>
        </dl>
        
         * `webview.CALLBACK_RESULT_URL_OK`
         * `webview.CALLBACK_RESULT_URL_ERROR`
         * `webview.CALLBACK_RESULT_EVAL_OK`
         * `webview.CALLBACK_RESULT_EVAL_ERROR`
        
        <dl>
        <dt>`data`</dt>
        <dd><span class="type">table</span> A table holding the data. The table has these fields:</dd>
        </dl>
        
         * <span class="type">string</span> `url`: The url used in the webview.open() call. `nil` otherwise.
         * <span class="type">string</span> `result`: Holds the result of either: a failed url open, a successful eval request or a failed eval. `nil` otherwise
        
        @return id 
        <span class="type">number</span> The id number of the webview
    **/
    static function create(callback:TODO<"function(self, webview_id, request_id, type, data)">):TODO;

    /**
        Destroys a webview.
        
        Destroys an instance of a webview.
        
        @param webview_id 
        <span class="type">number</span> The webview id (returned by the webview.create() call)
    **/
    static function destroy(webview_id:Float):Void;

    /**
        Evaluates javascript in a webview.
        
        Evaluates java script within the context of the currently loaded page (if any).
        Once the request is done, the callback (registered in `webview.create()`)
        is invoked. The callback will get the result in the `data["result"]` field.
        
        @param webview_id 
        <span class="type">number</span> The webview id
        
        @param code 
        <span class="type">string</span> The java script code to evaluate
        
        @return id 
        <span class="type">number</span> The id number of the request
    **/
    static function eval(webview_id:Float, code:String):TODO;

    /**
        Gets the visibility state of the webview.
        
        Returns the visibility state of the webview.
        
        @param webview_id 
        <span class="type">number</span> The webview id (returned by the webview.create() call)
        
        @return visibility 
        <span class="type">number</span> Returns 0 if not visible, 1 if it is visible
    **/
    static function is_visible(webview_id:Float):TODO;

    /**
        Open a page using an url.
        
        Opens a web page in the webview, using an url. Once the request is done, the
        callback (registered in `webview.create()`) is invoked.
        
        @param webview_id 
        <span class="type">number</span> The webview id
        
        @param url 
        <span class="type">string</span> The url to open
        
        @param options 
        <span class="type">table</span> A table of options for the request. Currently it holds these options
        
        <dl>
        <dt>`hidden`</dt>
        <dd><span class="type">boolean</span> If true, the webview will stay hidden (default=false)</dd>
        </dl>
        @return id 
        <span class="type">number</span> The id number of the request
    **/
    static function open(webview_id:Float, url:String, options:TODO<"table">):TODO;

    /**
        Open a page using html.
        
        Opens a web page in the webview, using html data. Once the request is done,
        the callback (registered in `webview.create()`) is invoked.
        
        @param webview_id 
        <span class="type">number</span> The webview id
        
        @param html 
        <span class="type">string</span> The html data to display
        
        @param options 
        <span class="type">table</span> A table of options for the request. See webview.open()
        
        @return id 
        <span class="type">number</span> The id number of the request
    **/
    static function open_raw(webview_id:Float, html:String, options:TODO<"table">):TODO;

    /**
        Shows or hides a web view.
        
        Shows or hides a web view
        
        @param webview_id 
        <span class="type">number</span> The webview id (returned by the `webview.create()` call)
        
        @param visible 
        <span class="type">number</span> If 0, hides the webview. If non zero, shows the view
    **/
    static function set_visible(webview_id:Float, visible:Float):Void;
}
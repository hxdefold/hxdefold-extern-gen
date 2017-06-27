package defold;

/**
    <p>HTML5 platform specific functions.</p>
    <p><span class="icon-html5"></span> The following functions are only available on HTML5 builds, the <code>html5.*</code> Lua namespace will not be available on other platforms.</p>
**/
@:native("_G.html5")
extern class Html5 {
    /**
        Run JavaScript code, in the browser, from Lua.
        
        Executes the supplied string as JavaScript inside the browser.
        A call to this function is blocking, the result is returned as-is, as a string.
        (Internally this will execute the string using the `eval()` JavaScript function.)
        
        @param code 
        <span class="type">string</span> Javascript code to run
        
        @return result 
        <span class="type">string</span> result as string
    **/
    static function run(code:String):TODO;
}
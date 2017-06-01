package defold;

/**
    <p>Functions for passing messages and constructing URL objects.</p>
**/
@:native("_G.msg")
extern class Msg {
    /**
        Posts a message to a receiving URL.
        
        Post a message to a receiving URL. The most common case is to send messages
        to a component. If the component part of the receiver is omitted, the message
        is broadcast to all components in the game object.
        
        The following receiver shorthands are available:
        
         * `"."` the current game object
         * `"#"` the current component
         * `nil` the current component
        
        <span class="icon-attention"></span> There is a 2 kilobyte limit to the message parameter table size.
        
        @param receiver 
        <span class="type">string | url | hash | nil</span> The receiver must be a string in URL-format, a URL object, a hashed string or `nil`.
        
        @param message_id 
        <span class="type">string | hash</span> The id must be a string or a hashed string.
        
        @param message 
        <span class="type">table</span> a lua table with message parameters to send.
    **/
    static function post(receiver:EitherType<TODO<"nil">, EitherType<Hash, EitherType<Url, String>>>, message_id:EitherType<Hash, String>, ?message:TODO<"table">):Void;

    /**
        Creates a new URL.
        
        This is equivalent to `msg.url(nil)` or `msg.url("#")`, which creates an url to the current
        script component.
        
        @return url 
        <span class="type">url</span> a new URL
    **/
    static function url():TODO;

    /**
        Creates a new URL from a string.
        
        The format of the string must be `[socket:][path][#fragment]`, which is similar to a HTTP URL.
        When addressing instances:
        
         * `socket` is the name of a valid world (a collection)
         * `path` is the id of the instance, which can either be relative the instance of the calling script or global
         * `fragment` would be the id of the desired component
        
        In addition, the following shorthands are available:
        
         * `"."` the current game object
         * `"#"` the current component
         * `nil` the current component
        
        @param urlstring 
        <span class="type">string</span> string to create the url from
        
        @return url 
        <span class="type">url</span> a new URL
    **/
    static function url(urlstring:String):TODO;

    /**
        Creates a new URL from separate arguments.
        
        @param socket 
        <span class="type">string | hash</span> socket of the URL
        
        @param path 
        <span class="type">string | hash</span> path of the URL
        
        @param fragment 
        <span class="type">string | hash</span> fragment of the URL
        
        @return url 
        <span class="type">url</span> a new URL
    **/
    static function url(?socket:EitherType<Hash, String>, ?path:EitherType<Hash, String>, ?fragment:EitherType<Hash, String>):TODO;
}
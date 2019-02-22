package defold;

/**
    <p>Functions for performing HTTP and HTTPS requests.</p>
**/
@:native("_G.http")
extern class Http {
    /**
        Perform a HTTP/HTTPS request.
        
        Perform a HTTP/HTTPS request.
        
        The following cipher suites are supported for HTTPS requests:
        
         * TLS_RSA_WITH_AES_128_CBC_SHA
         * TLS_RSA_WITH_AES_256_CBC_SHA
         * TLS_RSA_WITH_AES_128_CBC_SHA256
         * TLS_RSA_WITH_AES_256_CBC_SHA256
        
        <span class="icon-attention"></span> If no timeout value is passed, the configuration value "network.http_timeout" is used. If that is not set, the timeout value is `0` (which blocks indefinitely).
        
        @param url 
        <span class="type">string</span> target url
        
        @param method 
        <span class="type">string</span> HTTP/HTTPS method, e.g. "GET", "PUT", "POST" etc.
        
        @param callback 
        <span class="type">function(self, id, response)</span> response callback function
        
        <dl>
        <dt>`self`</dt>
        <dd><span class="type">object</span> The current object</dd>
        <dt>`id`</dt>
        <dd><span class="type">hash</span> Internal message identifier. Do not use!</dd>
        <dt>`response`</dt>
        <dd><span class="type">table</span> The response data. Contains the fields:</dd>
        </dl>
        
         * <span class="type">number</span> `status`: the status of the response
         * <span class="type">string</span> `response`: the response data
         * <span class="type">table</span> `headers`: all the returned headers
        
        @param headers 
        <span class="type">table</span> optional table with custom headers
        
        @param post_data 
        <span class="type">string</span> optional data to send
        
        @param options 
        <span class="type">table</span> optional table with request parameters. Supported entries:
        
         * <span class="type">number</span> `timeout`: timeout in seconds
    **/
    static function request(url:String, method:String, callback:TODO<"function(self, id, response)">, ?headers:TODO<"table">, ?post_data:String, ?options:TODO<"table">):Void;
}
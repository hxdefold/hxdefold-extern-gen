package defold;

/**
    <p>Manipulation of JSON data strings.</p>
**/
@:native("_G.json")
extern class Json {
    /**
        Decode JSON from a string to a lua-table.
        
        Decode a string of JSON data into a Lua table.
        A Lua error is raised for syntax errors.
        
        @param json 
        <span class="type">string</span> json data
        
        @return data 
        <span class="type">table</span> decoded json
    **/
    static function decode(json:String):TODO;
}
package defold;

/**
    <p>Built-in scripting functions.</p>
**/
@:native("_G")
extern class Builtins {
    /**
        Hashes a string.
        
        All ids in the engine are represented as hashes, so a string needs to be hashed
        before it can be compared with an id.
        
        @param s 
        <span class="type">string</span> string to hash
        
        @return hash 
        <span class="type">hash</span> a hashed string
    **/
    static function hash(s:String):TODO;

    /**
        Get hex representation of a hash value as a string.
        
        Returns a hexadecimal representation of a hash value.
        The returned string is always padded with leading zeros.
        
        @param h 
        <span class="type">hash</span> hash value to get hex string for
        
        @return hex 
        <span class="type">string</span> hex representation of the hash
    **/
    static function hash_to_hex(h:Hash):TODO;

    /**
        Pretty printing.
        
        Pretty printing of Lua values. This function prints Lua values
        in a manner similar to +print()+, but will also recurse into tables
        and pretty print them. There is a limit to how deep the function
        will recurse.
        
        @param v 
        <span class="type">any</span> value to print
    **/
    static function pprint(v:TODO<"any">):Void;
}
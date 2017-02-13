package defold;

/**
    <p>Functions for compression and decompression of string buffers.</p>
**/
@:native("_G.zlib")
extern class Zlib {
    /**
        Deflate (compress) a buffer.
        
        A lua error is raised is on error
        
        @param buf 
        <span class="type">string</span> buffer to deflate
        
        @return buf 
        <span class="type">string</span> deflated buffer
    **/
    static function deflate(buf:String):TODO;

    /**
        Inflate (decompress) a buffer.
        
        A lua error is raised is on error
        
        @param buf 
        <span class="type">string</span> buffer to inflate
        
        @return buf 
        <span class="type">string</span> inflated buffer
    **/
    static function inflate(buf:String):TODO;
}
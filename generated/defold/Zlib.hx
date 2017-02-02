package defold;

/**
	Functions for compression and decompression of string buffers.
**/
@:native("_G.zlib") extern class Zlib {
	/**
		Deflate (compress) a buffer.
		
		A lua error is raised is on error
		
		@param buf buffer to deflate (string)
		@return deflated buffer (string)
	**/
	static function deflate(buf:String):TODO;
	/**
		Inflate (decompress) a buffer.
		
		A lua error is raised is on error
		
		@param buf buffer to inflate (string)
		@return inflated buffer (string)
	**/
	static function inflate(buf:String):TODO;
}
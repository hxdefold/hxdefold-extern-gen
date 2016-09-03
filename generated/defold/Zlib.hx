package defold;

@:native("_G.zlib") extern class Zlib {
	/**
		Deflate (compress) a buffer
		
		A lua error is raised is on error
		
		@param buf buffer to deflate (string)
	**/
	static function deflate(buf:TODO):TODO;
	/**
		Inflate (decompress) a buffer
		
		A lua error is raised is on error
		
		@param buf buffer to inflate (string)
	**/
	static function inflate(buf:TODO):TODO;
}
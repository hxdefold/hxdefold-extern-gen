package defold;

/**
    <p>Functions for manipulating buffers and streams</p>

    See `BufferVariables` for related variables.
**/
@:native("_G.buffer")
extern class Buffer {
    /**
        Copies one buffer to another.
        
        Copy all data streams from one buffer to another, element wise.
        
        <span class="icon-attention"></span> Each of the source streams must have a matching stream in the
        destination buffer. The streams must match in both type and size.
        The source and destination buffer can be the same.
        
        @param dst 
        <span class="type">buffer</span> the destination buffer
        
        @param dstoffset 
        <span class="type">number</span> the offset to start copying data to
        
        @param src 
        <span class="type">buffer</span> the source data buffer
        
        @param srcoffset 
        <span class="type">number</span> the offset to start copying data from
        
        @param count 
        <span class="type">number</span> the number of elements to copy
    **/
    static function copy_buffer(dst:TODO<"buffer">, dstoffset:Float, src:TODO<"buffer">, srcoffset:Float, count:Float):Void;

    /**
        Copies data from one stream to another.
        
        Copy a specified amount of data from one stream to another.
        
        <span class="icon-attention"></span> The value type and size must match between source and destination streams.
        The source and destination streams can be the same.
        
        @param dst 
        <span class="type">bufferstream</span> the destination stream
        
        @param dstoffset 
        <span class="type">number</span> the offset to start copying data to (measured in value type)
        
        @param src 
        <span class="type">bufferstream</span> the source data stream
        
        @param srcoffset 
        <span class="type">number</span> the offset to start copying data from (measured in value type)
        
        @param count 
        <span class="type">number</span> the number of values to copy (measured in value type)
    **/
    static function copy_stream(dst:TODO<"bufferstream">, dstoffset:Float, src:TODO<"bufferstream">, srcoffset:Float, count:Float):Void;

    /**
        Creates a new buffer.
        
        Create a new data buffer containing a specified set of streams. A data buffer
        can contain one or more streams with typed data. This is useful for managing
        compound data, for instance a vertex buffer could contain separate streams for
        vertex position, color, normal etc.
        
        @param element_count 
        <span class="type">number</span> The number of elements the buffer should hold
        
        @param declaration 
        <span class="type">table</span> A table where each entry (table) describes a stream
        
         * <span class="type">hash | string</span> `name`: The name of the stream
         * <span class="type">constant</span> `type`: The data type of the stream
         * <span class="type">number</span> `count`: The number of values each element should hold
    **/
    static function create(element_count:Float, declaration:TODO<"table">):Void;

    /**
        Gets data from a stream.
        
        Get a copy of all the bytes from a specified stream as a Lua string.
        
        @param buffer 
        <span class="type">buffer</span> the source buffer
        
        @param stream_name 
        <span class="type">hash</span> the name of the stream
        
        @return data 
        <span class="type">string</span> the buffer data as a Lua string
    **/
    static function get_bytes(buffer:TODO<"buffer">, stream_name:Hash):TODO;

    /**
        Gets a stream from a buffer.
        
        Get a specified stream from a buffer.
        
        @param buffer 
        <span class="type">buffer</span> the buffer to get the stream from
        
        @param stream_name 
        <span class="type">hash | string</span> the stream name
        
        @return stream 
        <span class="type">bufferstream</span> the data stream
    **/
    static function get_stream(buffer:TODO<"buffer">, stream_name:EitherType<String, Hash>):TODO;
}

@:native("_G.buffer")
extern class BufferVariables {
    /**
        Float32.
        
        Float, single precision, 4 bytes
    **/
    static var VALUE_TYPE_FLOAT32(default, never):TODO;

    /**
        Int16.
        
        Signed integer, 2 bytes
    **/
    static var VALUE_TYPE_INT16(default, never):TODO;

    /**
        Int32.
        
        Signed integer, 4 bytes
    **/
    static var VALUE_TYPE_INT32(default, never):TODO;

    /**
        Int64.
        
        Signed integer, 8 bytes
    **/
    static var VALUE_TYPE_INT64(default, never):TODO;

    /**
        Int8.
        
        Signed integer, 1 byte
    **/
    static var VALUE_TYPE_INT8(default, never):TODO;

    /**
        Uint16.
        
        Unsigned integer, 2 bytes
    **/
    static var VALUE_TYPE_UINT16(default, never):TODO;

    /**
        Uint32.
        
        Unsigned integer, 4 bytes
    **/
    static var VALUE_TYPE_UINT32(default, never):TODO;

    /**
        Uint64.
        
        Unsigned integer, 8 bytes
    **/
    static var VALUE_TYPE_UINT64(default, never):TODO;

    /**
        Uint8.
        
        Unsigned integer, 1 byte
    **/
    static var VALUE_TYPE_UINT8(default, never):TODO;
}
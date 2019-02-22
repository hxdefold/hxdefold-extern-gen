package defold;

/**
    <p>Functions and messages used to manipulate tile map components.</p>
**/
@:native("_G.tilemap")
extern class Tilemap {
    /**
        Get the bounds of a tile map.
        
        Get the bounds for a tile map. This function returns multiple values:
        The lower left corner index x and y coordinates (1-indexed),
        the tile map width and the tile map height.
        
        The resulting values take all tile map layers into account, meaning that
        the bounds are calculated as if all layers were collapsed into one.
        
        @param url 
        <span class="type">string | hash | url</span> the tile map
        
        @return x 
        <span class="type">number</span> x coordinate of the bottom left corner
        
        @return y 
        <span class="type">number</span> y coordinate of the bottom left corner
        
        @return w 
        <span class="type">number</span> number of columns (width) in the tile map
        
        @return h 
        <span class="type">number</span> number of rows (height) in the tile map
    **/
    static function get_bounds(url:EitherType<Url, EitherType<Hash, String>>):TODO<"multiple">;

    /**
        Get a tile from a tile map.
        
        Get the tile set at the specified position in the tilemap.
        The position is identified by the tile index starting at origo
        with index 1, 1. (see `tilemap.set_tile()`)
        Which tile map and layer to query is identified by the URL and the
        layer name parameters.
        
        @param url 
        <span class="type">string | hash | url</span> the tile map
        
        @param layer 
        <span class="type">string | hash</span> name of the layer for the tile
        
        @param x 
        <span class="type">number</span> x-coordinate of the tile
        
        @param y 
        <span class="type">number</span> y-coordinate of the tile
        
        @return tile 
        <span class="type">number</span> index of the tile
    **/
    static function get_tile(url:EitherType<Url, EitherType<Hash, String>>, layer:EitherType<Hash, String>, x:Float, y:Float):TODO;

    /**
        Reset a shader constant for a tile map.
        
        Resets a shader constant for a tile map component.
        The constant must be defined in the material assigned to the tile map.
        Resetting a constant through this function implies that the value defined in the material will be used.
        Which tile map to reset a constant for is identified by the URL.
        
        @param url 
        <span class="type">string | hash | url</span> the tile map that should have a constant reset
        
        @param constant 
        <span class="type">string | hash</span> name of the constant
    **/
    static function reset_constant(url:EitherType<Url, EitherType<Hash, String>>, constant:EitherType<Hash, String>):Void;

    /**
        Set a shader constant for a tile map.
        
        Sets a shader constant for a tile map component.
        The constant must be defined in the material assigned to the tile map.
        Setting a constant through this function will override the value set for that constant in the material.
        The value will be overridden until tilemap.reset_constant is called.
        Which tile map to set a constant for is identified by the URL.
        
        @param url 
        <span class="type">string | hash | url</span> the tile map that should have a constant set
        
        @param constant 
        <span class="type">string | hash</span> name of the constant
        
        @param value 
        <span class="type">vector4</span> value of the constant
    **/
    static function set_constant(url:EitherType<Url, EitherType<Hash, String>>, constant:EitherType<Hash, String>, value:Vector4):Void;

    /**
        Set a tile in a tile map.
        
        Replace a tile in a tile map with a new tile.
        The coordinates of the tiles are indexed so that the "first" tile just
        above and to the right of origo has coordinates 1,1.
        Tiles to the left of and below origo are indexed 0, -1, -2 and so forth.
        
        <pre>
        +-------+-------+------+------+
        |  0,3  |  1,3  | 2,3  | 3,3  |
        +-------+-------+------+------+
        |  0,2  |  1,2  | 2,2  | 3,2  |
        +-------+-------+------+------+
        |  0,1  |  1,1  | 2,1  | 3,1  |
        +-------O-------+------+------+
        |  0,0  |  1,0  | 2,0  | 3,0  |
        +-------+-------+------+------+
        </pre>
        
        The coordinates must be within the bounds of the tile map as it were created.
        That is, it is not possible to extend the size of a tile map by setting tiles outside the edges.
        To clear a tile, set the tile to number 0. Which tile map and layer to manipulate is identified by the URL and the layer name parameters.
        
        @param url 
        <span class="type">string | hash | url</span> the tile map
        
        @param layer 
        <span class="type">string | hash</span> name of the layer for the tile
        
        @param x 
        <span class="type">number</span> x-coordinate of the tile
        
        @param y 
        <span class="type">number</span> y-coordinate of the tile
        
        @param tile 
        <span class="type">number</span> index of new tile to set
        
        @param h_flipped 
        <span class="type">boolean</span> optional if the tile should be horizontally flipped
        
        @param v_flipped 
        <span class="type">boolean</span> optional i the tile should be vertically flipped
    **/
    static function set_tile(url:EitherType<Url, EitherType<Hash, String>>, layer:EitherType<Hash, String>, x:Float, y:Float, tile:Float, ?h_flipped:TODO<"boolean">, ?v_flipped:TODO<"boolean">):Void;
}
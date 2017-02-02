package defold;

/**
    Functions and messages used to manipulate tile map components.

    See `TilemapMessages` for related messages.
**/
@:native("_G.tilemap") extern class Tilemap {
    /**
        Get the bounds of a tile map.
        
        Get the bounds for a tile map. This function returns multiple values:
        The lower left corner index x and y coordinates (1-indexed),
        the tile map width and the tile map height.
        
        The resulting values take all tile map layers into account, meaning that
        the bounds are calculated as if all layers were collapsed into one.
        
        @param url the tile map (url)
        @return x coordinate of the bottom left corner (number)
        @return y coordinate of the bottom left corner (number)
        @return number of columns in the tile map (number)
        @return number of rows in the tile map (number)
    **/
    static function get_bounds(url:Url):TODO<"multiple">;

    /**
        Get a tile from a tile map.
        
        Get the tile set at the specified position in the tilemap.
        The position is identified by the tile index starting at origo
        with index 1, 1. (see `tilemap.set_tile()`)
        Which tile map and layer to query is identified by the URL and the
        layer name parameters.
        
        @param url the tile map (url)
        @param name of the layer (string|hash)
        @param x_coordinate of the tile (number)
        @param y_coordinate of the tile (number)
        @return index of the tile (number)
    **/
    static function get_tile(url:Url, name:EitherType<Hash, String>, x_coordinate:Float, y_coordinate:Float):TODO;

    /**
        Reset a shader constant for a tile map.
        
        The constant must be defined in the material assigned to the tile map.
        Resetting a constant through this function implies that the value defined in the material will be used.
        Which tile map to reset a constant for is identified by the URL.
        
        @param url the tile map that should have a constant reset (url)
        @param name of the constant (string|hash)
    **/
    static function reset_constant(url:Url, name:EitherType<Hash, String>):Void;

    /**
        Set a shader constant for a tile map.
        
        The constant must be defined in the material assigned to the tile map.
        Setting a constant through this function will override the value set for that constant in the material.
        The value will be overridden until tilemap.reset_constant is called.
        Which tile map to set a constant for is identified by the URL.
        
        @param url the tile map that should have a constant set (url)
        @param name of the constant (string|hash)
        @param value of the constant (vec4)
    **/
    static function set_constant(url:Url, name:EitherType<Hash, String>, value:Vector4):Void;

    /**
        Set a tile in a tile map.
        
        Replace a tile in a tile map with a new tile.
        The coordinates of the tiles are indexed so that the "first" tile just
        above and to the right of origo has coordinates 1,1.
        Tiles to the left of and below origo are indexed 0, -1, -2 and so forth.
        
        <pre>
        +-------+-------+------+------+
        |  0,3  |  1,3  | 1,2  | 3,3  |
        +-------+-------+------+------+
        |  0,2  |  1,2  | 2,2  | 3,2  |
        +-------+-------+------+------+
        |  0,1  |  1,1  | 2,1  | 3,1  |
        +-------O-------+------+------+
        |  0,0  |  1,0  | 2,0  | 3,0  |
        +-------+-------+------+------+
        </pre>
        The coordinates must be within the bounds of the tile map as it were created. That is, it is not
        possible to extend the size of a tile map by setting tiles outside the edges.
        To clear a tile, set the tile to number 0. Which tile map and layer to manipulate is identified by
        the URL and the layer name parameters.
        
        @param url the tile map (url)
        @param name of the layer (string|hash)
        @param x_coordinate of the tile (number)
        @param y_coordinate of the tile (number)
        @param new tile to set (number)
        @param optional if the tile should be horizontally flipped (boolean)
        @param optional i the tile should be vertically flipped (boolean)
    **/
    static function set_tile(url:Url, name:EitherType<Hash, String>, x_coordinate:Float, y_coordinate:Float, new:Float, optional:TODO<"boolean">, optional:TODO<"boolean">):Void;
}

/**
    Data for the `TilemapMessages.set_tile` message.
**/
typedef TilemapMessageSetTile = {
    /**
        id of the layer for which to change a tile
    **/
    var layer_id:TODO;
    /**
        the position of the cell for which to change the tile (world space)
    **/
    var position:TODO;
    /**
        index of the tile to change to in the tile set, 1 for the first tile and 0 to clear the tile (0 by default)
    **/
    var tile:TODO;
    /**
        horizontal offset from the supplied position to the requested cell (grid space, 0 by default)
    **/
    var dx:TODO;
    /**
        vertical offset from the supplied position to the requested cell (grid space, 0 by default)
    **/
    var dy:TODO;
}

/**
    Messages related to the `Tilemap` module.
**/
@:publicFields class TilemapMessages {
    /**
        (DEPRECATED) changes a tile in a tile map.
        
        Send this message to a tile map component to change the tile in one of its cells.
    **/
    @:deprecated("Use <code>tilemap.set_tile()</code> instead.")
    static var set_tile(default, never):Message<TilemapMessageSetTile> = new Message("set_tile");
}
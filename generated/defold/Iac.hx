package defold;

/**
    Functions and constants for doing inter-app communication on iOS and
    Android.

    See `IacVariables` for related variables.
**/
@:native("_G.iac")
extern class Iac {
    /**
        Set iac listener.
        
        The listener callback has the following signature: function(self, payload, type) where payload is a table
        with the iac payload and type is an iac.TYPE_<TYPE> enumeration.
        
        @param listener listener callback function (function)
    **/
    static function set_listener(listener:TODO<"function">):Void;
}

@:native("_G.iac")
extern class IacVariables {
    /**
        Iac type.
    **/
    static var TYPE_INVOCATION(default, never):TODO;
}
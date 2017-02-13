package defold;

/**
    <p>Functions and constants for doing inter-app communication.</p>
    <p><span class="icon-ios"></span> <span class="icon-android"></span> These API:s only exist on mobile platforms.</p>

    See `IacVariables` for related variables.
**/
@:native("_G.iac")
extern class Iac {
    /**
        Set iac listener.
        
        Sets the listener function for inter-app communication events.
        
        @param listener 
        <span class="type">function(self, payload, type)</span> listener callback function.
        Pass an empty function if you no longer wish to receive callbacks.
        
        <dl>
        <dt>`self`</dt>
        <dd>
        
        <span class="type">object</span> The current object.
        
        </dd>
        <dt>`payload`</dt>
        <dd>
        
        <span class="type">table</span> The iac payload.
        
        </dd>
        <dt>`type`</dt>
        <dd>
        
        <span class="type">constant</span> The type of iac, an iac.TYPE_<TYPE> enumeration.
        
        </dd>
        </dl>
    **/
    static function set_listener(listener:TODO<"function(self, payload, type)">):Void;
}

@:native("_G.iac")
extern class IacVariables {
    /**
        Iac type.
    **/
    static var TYPE_INVOCATION(default, never):TODO;
}
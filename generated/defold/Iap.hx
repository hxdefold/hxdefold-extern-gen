package defold;

/**
    <p>Functions and constants for interacting with Apple's In-app purchases
    and Google's In-app billing.</p>

    See `IapVariables` for related variables.
**/
@:native("_G.iap")
extern class Iap {
    /**
        Buy product.
        
        Calling iap.finish is required on a successful transaction if auto_finish_transactions is disabled in project settings.
        
        @param id 
        <span class="type">string</span> product to buy
        
        @param options 
        <span class="type">table</span> optional parameters as properties.
        
        The options table has the following members:
        
         * request_id <span class="icon-facebook"></span>: optional custom unique request id to set for this transaction. The id becomes attached to the payment within the Graph API. Only available for Facebook IAP transactions.
    **/
    static function buy(id:String, ?options:TODO<"table">):Void;

    /**
        Finish buying product.
        
        Explicitly finish a product transaction.
        
        <span class="icon-attention"></span> Calling iap.finish is required on a successful transaction
        if auto_finish_transactions is disabled in project settings (otherwise ignored).
        The transaction.state field must equal iap.TRANS_STATE_PURCHASED.
        
        @param transaction 
        <span class="type">table</span> transaction table parameter as supplied in listener callback
    **/
    static function finish(transaction:TODO<"table">):Void;

    /**
        Get current provider id.
        
        @return id 
        <span class="type">constant</span> provider id.
        
         * `iap.PROVIDER_ID_GOOGLE`
         * `iap.PROVIDER_ID_AMAZON`
         * `iap.PROVIDER_ID_APPLE`
         * `iap.PROVIDER_ID_FACEBOOK`
    **/
    static function get_provider_id():TODO;

    /**
        List in-app products.
        
        Get a list of all avaliable iap products.
        
        <span class="icon-attention"></span> Nested calls, that is calling iap.list from within callback is not supported.
        Doing so will result in call being ignored with the engine reporting "Unexpected callback set".
        
        @param ids 
        <span class="type">table</span> table (array) of identifiers to get products from
        
        @param callback 
        <span class="type">function(self, products, error)</span> result callback
        
        <dl>
        <dt>self</dt>
        <dd>
        
        <span class="type">object</span> The current object.
        
        </dd>
        <dt>products</dt>
        <dd>
        
        <span class="type">table</span> The available iap products.
        
        </dd>
        <dt>error</dt>
        <dd>
        
        <span class="type">table</span> Any error message. <span class="type">nil</span> if there is no error.
        
        </dd>
        </dl>
    **/
    static function list(ids:TODO<"table">, callback:TODO<"function(self, products, error)">):Void;

    /**
        Restore products (non-consumable).
        
        @return success 
        <span class="type">boolean</span> false if current store doesn't support handling restored transactions, otherwise true
    **/
    static function restore():TODO;

    /**
        Set transaction listener.
        
        Set the callback function to receive transaction events.
        
        @param listener 
        <span class="type">function(self, transaction, error)</span> listener callback function.
        Pass an empty function if you no longer wish to receive callbacks.
        
        <dl>
        <dt>`self`</dt>
        <dd><span class="type">object</span> The current object.</dd>
        <dt>`transaction`</dt>
        <dd><span class="type">table</span> a table describing the transaction. The table contains the following fields:</dd>
        </dl>
        
         * `ident`: product identifier
         * `state`: transaction state
         * `date`: transaction date
         * `original_trans`: original transaction (only set when state == TRANS_STATE_RESTORED)
         * `trans_ident` : transaction identifier (only set when state == TRANS_STATE_RESTORED, TRANS_STATE_UNVERIFIED or TRANS_STATE_PURCHASED)
         * `request_id`: transaction request id. (only if receipt is set and for Facebook IAP transactions when used in the iap.buy call parameters)
         * `receipt`: receipt (only set when state == TRANS_STATE_PURCHASED or TRANS_STATE_UNVERIFIED)
        
        <dl>
        <dt>`error`</dt>
        <dd><span class="type">table</span> a table containing any error information. The error parameter is `nil` on success.</dd>
        </dl>
    **/
    static function set_listener(listener:TODO<"function(self, transaction, error)">):Void;
}

@:native("_G.iap")
extern class IapVariables {
    /**
        Unspecified error reason.
    **/
    static var REASON_UNSPECIFIED(default, never):TODO;

    /**
        User canceled reason.
    **/
    static var REASON_USER_CANCELED(default, never):TODO;

    /**
        Transaction failed state.
    **/
    static var TRANS_STATE_FAILED(default, never):TODO;

    /**
        Transaction purchased state.
    **/
    static var TRANS_STATE_PURCHASED(default, never):TODO;

    /**
        Transaction purchasing state.
        
        This is an intermediate mode followed by TRANS_STATE_PURCHASED.
        Store provider support dependent.
    **/
    static var TRANS_STATE_PURCHASING(default, never):TODO;

    /**
        Transaction restored state.
        
        This is only available on store providers supporting restoring purchases.
    **/
    static var TRANS_STATE_RESTORED(default, never):TODO;

    /**
        Transaction unverified state, requires verification of purchase.
    **/
    static var TRANS_STATE_UNVERIFIED(default, never):TODO;
}
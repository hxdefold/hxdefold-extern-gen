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
        
        Perform a product purchase.
        
        <span class="icon-attention"></span> Calling `iap.finish()` is required on a successful transaction if
        `auto_finish_transactions` is disabled in project settings.
        
        @param id 
        <span class="type">string</span> product to buy
        
        @param options 
        <span class="type">table</span> optional parameters as properties. The following parameters can be set:
        
         * `request_id` (<span class="icon-facebook"></span> Facebook only. Optional custom unique request id to
        set for this transaction. The id becomes attached to the payment within the Graph API.)
    **/
    static function buy(id:String, ?options:TODO<"table">):Void;

    /**
        Purchase a premium license.
        
        <span class="icon-gameroom"></span> Performs a purchase of a premium game license. The purchase transaction
        is handled like regular iap purchases; calling the currently set iap_listener with the
        transaction results.
        
        <span class="icon-attention"></span> This function does not work when testing the application
        locally in the Gameroom client.
    **/
    static function buy_premium():Void;

    /**
        Finish buying product.
        
        Explicitly finish a product transaction.
        
        <span class="icon-attention"></span> Calling iap.finish is required on a successful transaction
        if `auto_finish_transactions` is disabled in project settings. Calling this function
        with `auto_finish_transactions` set will be ignored and a warning is printed.
        The `transaction.state` field must equal `iap.TRANS_STATE_PURCHASED`.
        
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
         * `iap.PROVIDER_ID_GAMEROOM`
    **/
    static function get_provider_id():TODO;

    /**
        Check if user has already purchased premium license.
        
        <span class="icon-gameroom"></span> Checks if a license for the game has been purchased by the user.
        You should provide a callback function that will be called with the result of the check.
        
        <span class="icon-attention"></span> This function does not work when testing the application
        locally in the Gameroom client.
        
        @param callback 
        <span class="type">function(self, has_premium)</span> result callback
        
        <dl>
        <dt>`self`</dt>
        <dd><span class="type">object</span> The current object.</dd>
        <dt>`has_premium`</dt>
        <dd><span class="type">boolean</span> `true` if the user has premium license, `false` otherwise.</dd>
        </dl>
    **/
    static function has_premium(callback:TODO<"function(self, has_premium)">):Void;

    /**
        List in-app products.
        
        Get a list of all avaliable iap products. Products are described as a <span class="type">table</span>
        with the following fields:
        
        <dl>
        <dt>`ident`</dt>
        <dd>The product identifier.</dd>
        <dt>`title`</dt>
        <dd>The product title.</dd>
        <dt>`description`</dt>
        <dd>The product description.</dd>
        <dt>`price`</dt>
        <dd>The price of the product.</dd>
        <dt>`price_string`</dt>
        <dd>The price of the product, as a formatted string (amount and currency symbol).</dd>
        <dt>`currency_code` <span class="icon-ios"></span> <span class="icon-googleplay"></span> <span class="icon-facebook"></span></dt>
        <dd>The currency code. On Google Play, this reflects the merchant's locale, instead of the user's.</dd>
        </dl>
        
        <span class="icon-attention"></span> Nested calls, that is calling `iap.list()` from within the callback is
        not supported. Doing so will result in call being ignored with the engine reporting
        "Unexpected callback set".
        
        @param ids 
        <span class="type">table</span> table (array) of identifiers to get products from
        
        @param callback 
        <span class="type">function(self, products, error)</span> result callback
        
        <dl>
        <dt>`self`</dt>
        <dd><span class="type">object</span> The current object.</dd>
        <dt>`products`</dt>
        <dd><span class="type">table</span> Table describing the available iap products. See above for details.</dd>
        <dt>`error`</dt>
        <dd><span class="type">table</span> a table containing error information. `nil` if there is no error.
        - `error` (the error message)</dd>
        </dl>
    **/
    static function list(ids:TODO<"table">, callback:TODO<"function(self, products, error)">):Void;

    /**
        Restore products (non-consumable).
        
        Restore previously purchased products.
        
        @return success 
        <span class="type">boolean</span> `true` if current store supports handling
        restored transactions, otherwise `false`.
    **/
    static function restore():TODO;

    /**
        Set purchase transaction listener.
        
        Set the callback function to receive purchase transaction events. Transactions are
        described as a <span class="type">table</span> with the following fields:
        
        <dl>
        <dt>`ident`</dt>
        <dd>The product identifier.</dd>
        <dt>`state`</dt>
        <dd>The transaction state. See `iap.TRANS_STATE_*`.</dd>
        <dt>`date`</dt>
        <dd>The date and time for the transaction.</dd>
        <dt>`trans_ident`</dt>
        <dd>The transaction identifier. This field is only set when `state` is TRANS_STATE_RESTORED,
        TRANS_STATE_UNVERIFIED or TRANS_STATE_PURCHASED.</dd>
        <dt>`receipt`</dt>
        <dd>The transaction receipt. This field is only set when `state` is TRANS_STATE_PURCHASED
        or TRANS_STATE_UNVERIFIED.</dd>
        <dt>`original_trans` <span class="icon-apple"></span></dt>
        <dd>Apple only. The original transaction. This field is only set when `state` is
        TRANS_STATE_RESTORED.</dd>
        <dt>`signature` <span class="icon-googleplay"></span></dt>
        <dd>Google Play only. A string containing the signature of the purchase data that was signed
        with the private key of the developer.</dd>
        <dt>`request_id` <span class="icon-facebook"></span></dt>
        <dd>Facebook only. This field is set to the optional custom unique request id `request_id`
        if set in the `iap.buy()` call parameters.</dd>
        <dt>`purchase_token` <span class="icon-gameroom"></span></dt>
        <dd>Facebook Gameroom only. The purchase token.</dd>
        <dt>`currency` <span class="icon-gameroom"></span></dt>
        <dd>Facebook Gameroom only. The currency used for the purchase.</dd>
        <dt>`amount` <span class="icon-gameroom"></span></dt>
        <dd>Facebook Gameroom only. The amount the player will be charged for a single unit
        of this product.</dd>
        <dt>`quantity` <span class="icon-gameroom"></span></dt>
        <dd>Facebook Gameroom only. The quantity of this item the user is purchasing.</dd>
        <dt>`user_id` <span class="icon-amazon"></span></dt>
        <dd>Amazon Pay only. The user ID.</dd>
        <dt>`is_sandbox_mode` <span class="icon-amazon"></span></dt>
        <dd>Amazon Pay only. If `true`, the SDK is running in Sandbox mode. This only allows
        interactions with the Amazon AppTester. Use this mode only for testing locally.</dd>
        <dt>`cancel_date` <span class="icon-amazon"></span></dt>
        <dd>Amazon Pay only. The cancel date for the purchase. This field is only set if the
        purchase is canceled.</dd>
        <dt>`canceled` <span class="icon-amazon"></span></dt>
        <dd>Amazon Pay only. Is set to `true` if the receipt was canceled or has expired;
        otherwise `false`.</dd>
        </dl>
        
        @param listener 
        <span class="type">function(self, transaction, error)</span> listener callback function.
        Pass an empty function if you no longer wish to receive callbacks.
        
        <dl>
        <dt>`self`</dt>
        <dd><span class="type">object</span> The current object.</dd>
        <dt>`transaction`</dt>
        <dd><span class="type">table</span> a table describing the transaction. See above for details.</dd>
        <dt>`error`</dt>
        <dd><span class="type">table</span> a table containing error information. `nil` if there is no error.
        - `error` (the error message)
        - `reason` (the reason for the error, see `iap.REASON_*`)</dd>
        </dl>
    **/
    static function set_listener(listener:TODO<"function(self, transaction, error)">):Void;
}

@:native("_G.iap")
extern class IapVariables {
    /**
        Provider id for Amazon.
    **/
    static var PROVIDER_ID_AMAZON(default, never):TODO;

    /**
        Provider id for Apple.
    **/
    static var PROVIDER_ID_APPLE(default, never):TODO;

    /**
        Provider id for Facebook.
    **/
    static var PROVIDER_ID_FACEBOOK(default, never):TODO;

    /**
        Provider id for Facebook Gameroom.
    **/
    static var PROVIDER_ID_GAMEROOM(default, never):TODO;

    /**
        Iap provider id for Google.
    **/
    static var PROVIDER_ID_GOOGLE(default, never):TODO;

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
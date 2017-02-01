package defold;

@:native("_G.iap") extern class Iap {
	/**
		buy product
		
		Calling iap.finish is required on a successful transaction if auto_finish_transactions is disabled in project settings.
		
		@param id product to buy (identifier)
		@param options table of optional parameters as properties.
		
		The options table has the following members:
		
		 *  request_id: custom unique request id -- optional argument only available for Facebook IAP transactions
	**/
	static function buy(id:TODO, options:TODO):TODO;
	/**
		finish buying product
		
		Explicitly finish a product transaction.
		
		Calling iap.finish is required on a successful transaction if auto_finish_transactions is disabled in project settings (otherwise ignored).
		The transaction.state field must equal iap.TRANS_STATE_PURCHASED.
		
		@param transaction transaction table parameter as supplied in listener callback
	**/
	static function finish(transaction:TODO):TODO;
	/**
		get current provider id
	**/
	static function get_provider_id():TODO;
	/**
		list in-app products
		
		@param ids table (array) to get information about
		@param callback result callback
	**/
	static function list(ids:TODO, callback:TODO):TODO;
	/**
		restore products (non-consumable)
	**/
	static function restore():TODO;
	/**
		set transaction listener
		
		The listener callback has the following signature: function(self, transaction, error) where transaction is a table
		describing the transaction and error is a table. The error parameter is nil on success.
		The transaction table has the following members:
		
		 *  ident: product identifier
		 *  state: transaction state
		 *  date: transaction date
		 *  original_trans: original transaction (only set when state == TRANS_STATE_RESTORED)
		 *  trans_ident: transaction identifier (only set when state == TRANS_STATE_RESTORED, TRANS_STATE_UNVERIFIED or TRANS_STATE_PURCHASED)
		 *  request_id: transaction request id. (only if receipt is set and for Facebook IAP transactions when used in the iap.buy call parameters)
		 *  receipt: receipt (only set when state == TRANS_STATE_PURCHASED or TRANS_STATE_UNVERIFIED)
		
		@param listener listener function
	**/
	static function set_listener(listener:TODO):TODO;
}

@:native("_G.iap") extern class IapVariables {
	/**
		unspecified error reason
	**/
	static var REASON_UNSPECIFIED(default, never) : TODO;
	/**
		user canceled reason
	**/
	static var REASON_USER_CANCELED(default, never) : TODO;
	/**
		transaction failed state
	**/
	static var TRANS_STATE_FAILED(default, never) : TODO;
	/**
		transaction purchased state
	**/
	static var TRANS_STATE_PURCHASED(default, never) : TODO;
	/**
		transaction purchasing state, intermediate mode followed by TRANS_STATE_PURCHASED. Store provider support dependent.
	**/
	static var TRANS_STATE_PURCHASING(default, never) : TODO;
	/**
		transaction restored state. Only available on store providers supporting restoring purchases.
	**/
	static var TRANS_STATE_RESTORED(default, never) : TODO;
	/**
		transaction unverified state, requires verification of purchase
	**/
	static var TRANS_STATE_UNVERIFIED(default, never) : TODO;
}
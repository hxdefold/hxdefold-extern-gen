package types;


typedef Parameter =
{
    var name: String;
    var description: String;
    var type: String;
    var callbackParameters: Array<Parameter>;
}

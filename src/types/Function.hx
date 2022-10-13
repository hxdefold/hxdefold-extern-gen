package types;


typedef Function =
{
    var name: String;
    var description: String;
    var returnType: ReturnType;
    var parameters: Array<Parameter>;
    var generic: Bool;
}

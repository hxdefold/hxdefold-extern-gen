import haxe.macro.Expr;
using StringTools;

typedef Manifest = {
    var version:String;
    var sha1:String;
}

typedef Api = {
    var elements:Array<ApiElement>;
}

typedef ApiElement = {
    var name:String;
    var type:ApiElementType;
    var parameters:Array<{name:String, doc:String}>;
    var returnvalues:Array<{name:String, doc:String}>;
    var brief:String;
    var note:String;
    var description:String;
    var examples:String;
    var deprecated:String;
}

@:enum abstract ApiElementType(String) to String {
    var FUNCTION = "FUNCTION";
    var MESSAGE = "MESSAGE";
    var PROPERTY = "PROPERTY";
    var VARIABLE = "VARIABLE";
    var PACKAGE = "PACKAGE";

    inline function new(s) this = s;

    public static function fromString(s:String):ApiElementType {
        return switch (s) {
            case "FUNCTION" | "MESSAGE" | "PROPERTY" | "VARIABLE" | "PACKAGE": new ApiElementType(s);
            default: throw 'Invalid API element type: $s';
        }
    }
} 

class Main {
    static function loadManifest(cb:Manifest->Void) {
        var r = new haxe.Http("http://d.defold.com/stable/info.json");
        r.onData = function(data) cb(haxe.Json.parse(data));
        r.request();
    }

    static function loadDoc(sha1:String, cb:String->Void) {
        var r = new haxe.Http('http://d.defold.com/archive/$sha1/engine/share/ref-doc.zip');
        r.onData = cb;
        r.request();
    } 

    static var ctTODO = macro : TODO;
    static var reModuleName = ~/^(\w+)_doc$/;
    static var reElementName = ~/^((\w+)\.)?(\w+)$/;
    static var reParameterName = ~/^(\[)?(\w+)\]?$/;

    static function capitalize(s:String):String {
        return s.charAt(0).toUpperCase() + s.substring(1);
    }

    static function underscoreToCamelCase(s:String):String {
        return s.split("_").map(capitalize).join("");
    }

    static inline var GENERATED_DIR = "generated";

    static function main() {
        inline function print(s:String) Sys.println(s);

        function deleteRec(path:String) {
            if (sys.FileSystem.isDirectory(path)) {
                for (file in sys.FileSystem.readDirectory(path))
                    deleteRec('$path/$file');
                sys.FileSystem.deleteDirectory(path);
            } else {
                sys.FileSystem.deleteFile(path);
            }
        }
        if (sys.FileSystem.exists(GENERATED_DIR))
            deleteRec(GENERATED_DIR);

        loadManifest(function(manifest) {
            print('Loading API for version ${manifest.version}');
            loadDoc(manifest.sha1, function(data) {
                var entries = haxe.zip.Reader.readZip(new haxe.io.StringInput(data));

                sys.FileSystem.createDirectory(GENERATED_DIR);
                sys.FileSystem.createDirectory(GENERATED_DIR + "/defold");
                sys.io.File.saveContent(GENERATED_DIR + "/version.txt", 'API version ${manifest.version} (${manifest.sha1})');

                for (entry in entries) {
                    var path = new haxe.io.Path(entry.fileName);
                    if (path.ext != "json")
                        continue;
                    if (!reModuleName.match(path.file))
                        throw 'Non-conventional module json name: ${path.file}';
                    var moduleName = underscoreToCamelCase(reModuleName.matched(1));
                    var moduleNameFromFile = true;
                    var api:Api = haxe.Json.parse(entry.data.toString());
                    print('Processing module $moduleName (${entry.fileName})');

                    var nativePath = "_G";
                    var methods = [];
                    var messages = [];
                    var properties = [];
                    var vars = [];
                    var pos = {file: entry.fileName, min: 0, max: 0};

                    for (element in api.elements) {
                        print('=> "${element.name}" (${(cast element.type : String).toLowerCase()})');

                        element.type = ApiElementType.fromString(element.type); // validate
                        
                        inline function print(s:String) Sys.println("  > " + s);

                        if (element.type == PACKAGE) {
                            if (element.name != "") throw "Non-empty for PACKAGE element? What should we do with that";
                            print("Skipping package element");
                            continue;
                        }

                        if (!reElementName.match(element.name))
                            throw 'Non-conventional element name';

                        var elementName = reElementName.matched(3);
                        if (reElementName.matched(1) != null) {
                            if (element.type != FUNCTION && element.type != VARIABLE)
                                throw 'Dotted names are only supported for functions and variables';
                            var prefix = reElementName.matched(2);
                            nativePath = '_G.$prefix';
                            var newModuleName = underscoreToCamelCase(prefix);
                            if (newModuleName != moduleName) {
                                if (moduleNameFromFile) {
                                    print('Changing module name to $newModuleName');
                                    moduleName = newModuleName;
                                    moduleNameFromFile = true;
                                } else {
                                    throw 'Two different prefixes in a single module ($moduleName and $newModuleName)';
                                }
                            }
                        }

                        var fieldMeta = [];

                        if (element.deprecated != null && element.deprecated != "")
                            fieldMeta.push({
                                name: ":deprecated",
                                pos: pos,
                                params: [{expr: EConst(CString(element.deprecated)), pos: pos}]
                            });

                        var fieldDoc = [];
                        inline function addDoc(s) {
                            if (s != null && s != "") fieldDoc.push(s);
                        }

                        addDoc(element.brief);
                        addDoc(element.description);
                        addDoc(element.note);

                        var signatureDoc = [];

                        var fieldKind, fields;
                        switch (element.type) {
                            case FUNCTION:
                                fields = methods;
                                var args = [];
                                for (p in element.parameters) {
                                    var pName = p.name.replace("-", "_");
                                    if (!reParameterName.match(pName))
                                        throw 'Non-conventional parameter name: ${p.name}';
                                    var opt = (reParameterName.matched(1) != null);
                                    pName = reParameterName.matched(2);
                                    args.push({name: pName, type: ctTODO, opt: opt});
                                    signatureDoc.push('@param $pName ${p.doc}');
                                }
                                fieldKind = FFun({
                                    expr: null,
                                    args: args,
                                    ret: ctTODO
                                });

                            case MESSAGE:
                                fields = messages;
                                elementName = underscoreToCamelCase(elementName);
                                if (element.returnvalues.length != 0)
                                    throw "Found MESSAGE with returnvalues!";
                                var messageFields:Array<Field> = [];
                                for (param in element.parameters) {
                                    if (!reParameterName.match(param.name))
                                        throw 'Non-conventional parameter name: ${param.name}';
                                    var name = reParameterName.matched(2);
                                    messageFields.push({
                                        name: name,
                                        pos: pos,
                                        kind: FVar(ctTODO),
                                        meta: if (reParameterName.matched(1) != null) [{name: ":optional", pos: pos}] else null
                                    });
                                    signatureDoc.push('@param $name ${param.doc}');
                                }
                                var ct = TAnonymous(messageFields);
                                var nameExpr = {expr: EConst(CString(element.name)), pos: pos};

                                fieldKind = FProp("default", "never", macro : Message<$ct>, macro new Message($nameExpr));

                            case PROPERTY:
                                if (element.parameters.length != 0)
                                    throw "Found PROPERTY with parameters!";
                                if (element.returnvalues.length != 0)
                                    throw "Found PROPERTY with returnvalues!";
                                fields = properties;
                                elementName = underscoreToCamelCase(elementName);
                                var nameExpr = {expr: EConst(CString(element.name)), pos: pos};
                                fieldKind = FProp("default", "never", macro : Property<$ctTODO>, macro new Property($nameExpr));

                            case VARIABLE:
                                if (element.parameters.length != 0)
                                    throw "Found VARIABLE with parameters!";
                                if (element.returnvalues.length != 0)
                                    throw "Found VARIABLE with returnvalues!";
                                fields = vars;
                                fieldKind = FProp("default", "never", ctTODO);

                            case PACKAGE:
                                throw false;
                        }

                        addDoc(signatureDoc.join("\n"));

                        fields.push({
                            pos: pos,
                            name: elementName,
                            kind: fieldKind,
                            doc: fieldDoc.join("\n\n"),
                            meta: fieldMeta,
                            access: [AStatic],
                        });
                    }

                    var types:Array<TypeDefinition> = [];

                    if (methods.length > 0) 
                        types.push({
                            pos: pos,
                            pack: ["defold"],
                            name: moduleName,
                            kind: TDClass(),
                            isExtern: true,
                            fields: methods,
                            meta: [
                                {name: ":native", pos: pos, params: [{expr: EConst(CString(nativePath)), pos: pos}]}
                            ]
                        });

                    if (messages.length > 0) 
                        types.push({
                            pos: pos,
                            pack: ["defold"],
                            name: moduleName + "Messages",
                            kind: TDClass(),
                            fields: messages,
                            meta: [
                                {name: ":publicFields", pos: pos}
                            ]
                        });

                    if (properties.length > 0) 
                        types.push({
                            pos: pos,
                            pack: ["defold"],
                            name: moduleName + "Properties",
                            kind: TDClass(),
                            fields: properties,
                            meta: [
                                {name: ":publicFields", pos: pos}
                            ]
                        });

                    if (vars.length > 0) 
                        types.push({
                            pos: pos,
                            pack: ["defold"],
                            name: moduleName + "Variables",
                            kind: TDClass(),
                            isExtern: true,
                            fields: vars,
                            meta: [
                                {name: ":native", pos: pos, params: [{expr: EConst(CString(nativePath)), pos: pos}]}
                            ]
                        });

                    if (types.length > 0) {
                        outputModule(moduleName, types);
                    } else {
                        // throw "No types generated";
                        print("No types generated");
                    }

                    print(" ");
                }
            });
        });
    }

    static function outputModule(name:String, types:Array<TypeDefinition>) {
        var printer = new haxe.macro.Printer();
        var out = ['package defold;'];
        for (type in types) {
            out.push(printer.printTypeDefinition(type, false));
        }
        sys.io.File.saveContent('$GENERATED_DIR/defold/$name.hx', out.join("\n\n"));
    }
}

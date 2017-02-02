import haxe.macro.Expr;
using StringTools;

typedef Manifest = {
    var version:String;
    var sha1:String;
}

typedef Api = {
    var elements:Array<ApiElement>;
    var info:ApiInfo;
}

typedef ApiInfo = {
    var name:String;
    var description:String;
    var namespace:String;
    var brief:String;
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
    static var reArgumentDoc = ~/\((.*)\)\s*$/;
    static var reEitherType = ~/\|| or /gi;
    static var pos = {file: "", min: 0, max: 0};

    static function capitalize(s:String):String {
        return s.charAt(0).toUpperCase() + s.substring(1);
    }

    static function underscoreToCamelCase(s:String):String {
        return s.split("_").map(capitalize).join("");
    }

    static inline function mkType(s:String):ComplexType
        return TPath({pack: [], name: s});

    static inline function mkTODOType(s:String):ComplexType
        return TPath({pack: [], name: "TODO", params: [TPExpr({pos: pos, expr: EConst(CString(s))})]});


    static var ctString = macro : String;
    static var ctFloat = macro : Float;
    static var ctHash = macro : Hash;
    static var ctUrl = macro : Url;

    static function parseArgType(doc:String):ComplexType {
        if (!reArgumentDoc.match(doc))
            return ctTODO;

        var types = reEitherType.split(reArgumentDoc.matched(1)).map(function(s) return s.trim());
        var types = types.map(function(t) return switch t {
            case "string": ctString;
            case "number": ctFloat;
            case "hash": ctHash;
            case "url": ctUrl;
            case _ if (t.startsWith("vector")): mkType("V" + t.substring(1));
            case _ if (t.startsWith("vec")): mkType("Vector" + t.substring(3));
            default: mkTODOType(t);
        });

        var type = Lambda.fold(types, function(t, t2) {
            return macro : EitherType<$t,$t2>;
        }, types.shift());

        return type;
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
                    print('Processing module $moduleName (${entry.fileName})');
                    var api:Api = haxe.Json.parse(haxe.zip.Reader.unzip(entry).toString());

                    var nativePath = "_G";
                    var methods = [];
                    var messages = [];
                    var messageData = [];
                    var properties = [];
                    var vars = [];

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


                        function prepareDoc(s:String):String {
                            s = s
                                .replace("<code>", "`")
                                .replace("</code>", "`")
                                .replace("<p>", "\n")
                                .replace("</p>", "\n")
                                .replace("<P>", "\n")
                                .replace("</P>", "\n")
                                .replace("<b>", "*")
                                .replace("</b>", "*")
                                .replace("<ul>", "\n")
                                .replace("</ul>", "\n")
                                .replace("<li>", " * ")
                                .replace("</li>", "")
                                ;
                            return s;
                        }

                        var fieldDoc = [];
                        inline function addDoc(s) {
                            if (s != null && s != "") fieldDoc.push(s);
                        }

                        addDoc(prepareDoc(capitalize(element.brief) + "."));
                        addDoc(prepareDoc(element.description));
                        addDoc(prepareDoc(element.note));

                        var signatureDoc = [];

                        var field:Field = {
                            pos: pos,
                            access: [AStatic],
                            name: null,
                            kind: null,
                        };

                        var fieldKind, fields;
                        switch (element.type) {
                            case FUNCTION:
                                fields = methods;
                                var args = [];
                                for (p in element.parameters) {
                                    var pName = p.name.replace("-", "_");
                                    var doc = p.doc;
                                    var opt = false;
                                    if (!reParameterName.match(pName)) {
                                        if (p.name == "gui.PIEBOUNDS_RECTANGLE") {
                                            pName = "bounds";
                                            doc = p.name + " " + doc;
                                        } else
                                            throw 'Non-conventional parameter name: ${p.name}';
                                    } else {
                                        opt = (reParameterName.matched(1) != null);
                                        pName = reParameterName.matched(2);
                                    }
                                    var argType = parseArgType(doc);
                                    args.push({name: pName, type: argType, opt: opt});
                                    signatureDoc.push('@param $pName ${prepareDoc(doc)}');
                                }

                                var ret = switch (element.returnvalues) {
                                    case []:
                                        macro : Void;
                                    case [r]:
                                        signatureDoc.push('@return ${prepareDoc(r.name + " " + r.doc)}');
                                        ctTODO;
                                    case multiple:
                                        for (r in multiple)
                                            signatureDoc.push('@return ${prepareDoc(r.name + " " + r.doc)}');
                                        mkTODOType("multiple");
                                }

                                fieldKind = FFun({
                                    expr: null,
                                    args: args,
                                    ret: ret
                                });

                            case MESSAGE:
                                fields = messages;
                                // elementName = underscoreToCamelCase(elementName);
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
                                        doc: prepareDoc(param.doc),
                                        meta: if (reParameterName.matched(1) != null) [{name: ":optional", pos: pos}] else null
                                    });
                                }

                                var nameExpr = {expr: EConst(CString(element.name)), pos: pos};

                                if (messageFields.length == 0) {
                                    fieldKind = FProp("default", "never", null, macro new Message<Void>($nameExpr));
                                } else {
                                    fieldKind = null;
                                    messageData.push({
                                        msg: element.name,
                                        name: underscoreToCamelCase(element.name),
                                        fields: messageFields,
                                        apply: function() {
                                            var ct = TPath({pack: [], name: moduleName + "Message" + underscoreToCamelCase(element.name)});
                                            field.kind = FProp("default", "never", null, macro new Message<$ct>($nameExpr));
                                        }
                                    });
                                }

                            case PROPERTY:
                                if (element.parameters.length != 0)
                                    throw "Found PROPERTY with parameters!";
                                if (element.returnvalues.length != 0)
                                    throw "Found PROPERTY with returnvalues!";
                                fields = properties;
                                // elementName = underscoreToCamelCase(elementName);
                                var nameExpr = {expr: EConst(CString(element.name)), pos: pos};
                                fieldKind = FProp("default", "never", null, macro new Property<$ctTODO>($nameExpr));

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

                        var doc = fieldDoc.join("\n\n");
                        doc = ~/\n\n+/g.replace(doc, "\n\n");
                        doc = ~/(.*)\s*$/g.replace(doc, "$1");

                        field.name = elementName;
                        field.kind = fieldKind;
                        field.doc = doc;
                        field.meta = fieldMeta;
                        fields.push(field);
                    }

                    var mainTypeDoc = [];
                    if (api.info.description != "")
                        mainTypeDoc.push(api.info.description.split("\n").join("\n    "));

                    if (methods.length == 0) {
                        mainTypeDoc.push((if (api.info.description != "") "    " else "") + "This module currently has no functions.\n");
                    }

                    var types:Array<{t:TypeDefinition, ?d:String}> = [];

                    if (properties.length > 0) {
                        var className = moduleName + "Properties";
                        mainTypeDoc.push('    See `$className` for related properties.');
                        types.push({
                            t:{
                                pos: pos,
                                pack: ["defold"],
                                name: className,
                                kind: TDClass(),
                                fields: properties,
                                meta: [
                                    {name: ":publicFields", pos: pos}
                                ]
                            },
                            d: 'Properties related to the `${moduleName}` module.'
                        });
                    }

                    if (messages.length > 0) {
                        var className = moduleName + "Messages";
                        mainTypeDoc.push('    See `$className` for related messages.');
                        types.push({
                            t:{
                                pos: pos,
                                pack: ["defold"],
                                name: className,
                                kind: TDClass(),
                                fields: messages,
                                meta: [
                                    {name: ":publicFields", pos: pos}
                                ]
                            },
                            d: 'Messages related to the `${moduleName}` module.'
                        });
                    }

                    for (data in messageData) {
                        data.apply();
                        types.push({
                            t: {
                                pos: pos,
                                pack: ["defold"],
                                name: '${moduleName}Message${data.name}',
                                kind: TDStructure,
                                fields: data.fields,
                            },
                            d: 'Data for the `${moduleName}Messages.${data.msg}` message.'
                        });
                    }

                    if (vars.length > 0) {
                        var className = moduleName + "Variables";
                        mainTypeDoc.push('    See `$className` for related variables.');
                        types.push({t:{
                            pos: pos,
                            pack: ["defold"],
                            name: className,
                            kind: TDClass(),
                            isExtern: true,
                            fields: vars,
                            meta: [
                                {name: ":native", pos: pos, params: [{expr: EConst(CString(nativePath)), pos: pos}]}
                            ]
                        }});
                    }

                    if (mainTypeDoc.length > 1)
                        mainTypeDoc.insert(1, "");

                    types.unshift({
                        t:{
                            pos: pos,
                            pack: ["defold"],
                            name: moduleName,
                            kind: TDClass(),
                            isExtern: true,
                            fields: methods,
                            meta: [
                                {name: ":native", pos: pos, params: [{expr: EConst(CString(nativePath)), pos: pos}]}
                            ]
                        },
                        d: mainTypeDoc.join("\n"),
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

    static function outputModule(name:String, types:Array<{t:TypeDefinition,?d:String}>) {
        var printer = new Printer("    ");
        var out = ['package defold;'];
        for (type in types) {
            var doc = "";
            if (type.d != null) {
                doc = '/**\n    ${type.d}\n**/\n';
            }
            out.push(doc+printer.printTypeDefinition(type.t, false));
        }
        sys.io.File.saveContent('$GENERATED_DIR/defold/$name.hx', out.join("\n\n"));
    }
}

package;

import types.ExternEnumValue;
import types.ExternEnum;
import types.ExternClass;
import types.ReturnType;
import Sys.println;
import types.Parameter;
import types.Function;
import htmlparser.HtmlNodeElement;
import htmlparser.HtmlDocument;
using StringTools;
using util.Util;


class DocParser
{
    public function new()
    {

    }


    /**
     * Parses the given HTML string of a Defold API reference page.
     *
     * @param html
     */
    public function parse(html: String): ExternClass
    {
        var doc: HtmlDocument = new HtmlDocument(html, true);

        var apiContent: Array<HtmlNodeElement> = doc.find('.apicontent')[0].children;
        var i: Int = 0;

        // get native name
        while (apiContent[i].name != "h1") i++;
        var native: String = apiContent[i].innerText;

        // skip to functions
        while (apiContent[i].innerText != "Functions") i++;
        i++;

        // parse functions
        var functions: Array<Function> = [];
        do
        {
            i++; // skip link
            var name: String = apiContent[i++].getAttribute('name');
            i++; // skip header
            i++; // skip quote
            var description: String = apiContent[i++].innerText;

            var parameters: Array<Parameter> = [];
            var returnType: ReturnType = { type: "Void", description: null };
            var generic: Bool = false;

            while (apiContent[i].name != "hr")
            {
                switch apiContent[i].innerText
                {
                    case "PARAMETERS":
                        parameters = parseParametersTable(apiContent[++i]);
                        i++;

                    case "EXAMPLES":
                        while (apiContent[i].name != "hr") i++;

                    case "RETURNS":
                        returnType = parseReturnsTable(apiContent[++i]);
                        i++;
                }
            }
            i++; // skip <hr>

            // check if the function should be generic
            for (parameter in parameters)
            {
                if (parameter.type == "T" || parameter.type.contains(": T"))
                {
                    generic = true;
                }
            }
            if (returnType.type == "T")
            {
                generic = true;
            }

            functions.push({
                name: name,
                description: description,
                parameters: parameters,
                returnType: returnType,
                generic: generic
            });
        }
        while (i < apiContent.length && apiContent[i].innerText != "Constants");
        i++;

        // parse enum constants
        var enums: Array<ExternEnum> = [];
        while (i < apiContent.length)
        {
            var name: String = apiContent[i++].getAttribute("name");
            i++; // skip h4
            var description: String = apiContent[i++].innerText;
            i++;

            var enumValue: ExternEnumValue = {
                value: name,
                description: description
            };

            var enumName: String = name.split('_')[0].capitalize();
            if (enums.length == 0 || enums[enums.length - 1].name != enumName)
            {
                enums.push({
                    name: enumName,
                    values: [enumValue]
                });
            }
            else
            {
                enums[enums.length - 1].values.push(enumValue);
            }
        }


        // parse existing function parameters and return types, to replace types with enums
        for (func in functions)
        {
            for (param in func.parameters)
            {
                var matchingEnum: ExternEnum = Util.getEnumMatchingDescription(param.description, enums);
                if (matchingEnum != null)
                {
                    param.type = matchingEnum.name;
                }
            }

            var matchingEnum: ExternEnum = Util.getEnumMatchingDescription(func.returnType.type, enums);
            if (matchingEnum != null)
            {
                func.returnType.type = matchingEnum.name;
            }
        }

        return
        {
            native: native,
            functions: functions,
            enums: enums
        };
    }


    function parseParametersTable(table: HtmlNodeElement): Array<Parameter>
    {
        if (table.innerText == "None")
        {
            return [];
        }

        var parameters: Array<Parameter> = [];

        for (row in table.children)
        {
            var name: String = row.children[0].innerText;
            var luaType: String = row.children[1].innerText;
            var description: String = row.children[2].innerHTML.split('<table>')[0].trim();
            var callbackParameters: Array<Parameter> = [];

            var type: String;
            if (luaType == "function")
            {
                var funcTable: HtmlNodeElement = row.children[2].children[0];
                var funcArgs: Array<String> = [];

                if (funcTable != null)
                {
                    for (funcRow in funcTable.find('tr'))
                    {
                        var argName: String = funcRow.find('td')[0].innerText;
                        var argLuaType: String = funcRow.find('td')[1].innerText;
                        var argDescription: String = funcRow.find('td')[2].innerText;

                        var argType: String = parseLuaType(argLuaType, argName);

                        funcArgs.push('$argName: $argType');
                        callbackParameters.push({
                            name: argName,
                            type: argType,
                            description: argDescription,
                            callbackParameters: null
                        });
                    }
                }

                type = '(${funcArgs.join(', ')})->Void';
            }
            else
            {
                type = parseLuaType(luaType, name);
            }

            parameters.push({
                name: name,
                type: type,
                description: description,
                callbackParameters: callbackParameters
            });
        }

        return parameters;
    }


    function parseReturnsTable(table: HtmlNodeElement): ReturnType
    {
        var luaType: String = table.innerText;
        var description: String = null;
        if (table.name == "table" || table.children[0].name == "table")
        {
            luaType = table.children[0].find('td')[0].innerText;
            description = table.children[0].find('td')[2].innerText;
        }

        return {
            type: parseLuaType(luaType),
            description: description
        };
    }


    function parseLuaType(luaType: String, ?ctx: String)
    {
        return switch luaType.trim()
        {
            case "string": "String";
            case "number": "Int";
            case "int": "Int";
            case "float": "Float";
            case "vector3": "Vector3";
            case "boolean": "Bool";
            case "table": "AnyTable";
            case "buffer": "defold.types.Buffer";
            case "constant": "Int";
            case "url": "Url";
            case "hash": "Hash";
            case "string, hash": "HashOrString";
            case "string, hash, url": "HashOrStringOrUrl";

            case "object" if (ctx == "self"): "T";

            case "" | "object":
            {
                println('WARNING: type "${luaType.trim()}" has been filled with placeholder and should be corrected');
                return "UNKNOWN";
            }

            default: throw 'unknown type $luaType';
        };
    }
}

package;

import Sys.println;
import types.Parameter;
import types.Function;
import htmlparser.HtmlNodeElement;
import htmlparser.HtmlDocument;


class DocParser
{
    public function new()
    {

    }


    public function parse(html: String)
    {
        var doc: HtmlDocument = new HtmlDocument(html, true);

        var apiContent: Array<HtmlNodeElement> = doc.find('.apicontent')[0].children;
        var i: Int = 0;

        // skip to functions
        while (apiContent[i].innerText != "Functions")
        {
            i++;
        }
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
            trace(name);

            var parameters: Array<Parameter> = [];
            var returnType: String = "Void";
            var generic: Bool = false;

            while (apiContent[i].name != "hr")
            {
                switch apiContent[i].innerText
                {
                    case "PARAMETERS":
                        parameters = parseParametersTable(apiContent[++i]);
                        i++;

                    case "EXAMPLES":
                        i += 2;

                    case "RETURNS":
                        i += 2;
                }
            }
            i++; // skip <hr>

            // check if the function should be generic
            for (parameter in parameters)
            {
                if (parameter.type == "T")
                {
                    generic = true;
                }
            }

            functions.push({
                name: name,
                description: description,
                parameters: parameters,
                returnType: returnType,
                generic: generic
            });
        }
        while (apiContent[i].innerText != "Constants");
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
            var description: String = row.children[2].innerText.split('\n')[0];

            var type: String;
            if (luaType == "function")
            {
                var funcTable: HtmlNodeElement = row.children[2].children[0];
                var funcArgs: Array<String> = [];

                for (funcRow in funcTable.find('tr'))
                {
                    var argName: String = funcRow.find('td')[0].innerText;
                    var argType: String = funcRow.find('td')[1].innerText;

                    funcArgs.push('$argName: ${parseLuaType(argType)}');
                }

                type = '(${funcArgs.join(', ')})->Void';
            }
            else
            {
                type = parseLuaType(luaType);
            }

            parameters.push({
                name: name,
                type: type,
                description: description
            });
        }

        return parameters;
    }


    function parseLuaType(luaType: String)
    {
        return switch luaType
        {
            case "string": "String";
            case "number": "Int";
            case "boolean": "Bool";
            case "object": "T";
            case "table": "lua.AnyTable";

            default: throw 'unknown type $luaType';
        };
    }
}

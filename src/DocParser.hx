package;

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

            trace(parameters);

            functions.push({
                name: name,
                description: description,
                parameters: parameters,
                returnType: returnType
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

        for (row in table.find('tr'))
        {
            var name: String = row.find('td')[0].innerText;
            var type: String = row.find('td')[1].innerText;
            var description: String = row.find('td')[2].innerText;

            parameters.push({
                name: name,
                type: type,
                description: description
            });
        }

        return parameters;
    }
}

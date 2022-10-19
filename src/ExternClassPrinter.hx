package;

import types.ExternEnum;
import types.Parameter;
import types.Function;
import haxe.Resource;
import types.GeneratedFile;
import types.ExternClass;

using StringTools;
using util.Util;


enum abstract TemplateName(Int)
{
    var Class;
    var Function;
    var Enum;
    var EnumValue;
}


class ExternClassPrinter
{
    final pkg: String;
    final className: String;
    final templates: Map<TemplateName, String>;


    public inline function new(pkg: String, className: String)
    {
        this.pkg = pkg;
        this.className = className;
        templates = [
            Class       => Resource.getString('ClassTemplate'),
            Function    => Resource.getString('FunctionTemplate'),
            Enum        => Resource.getString('EnumTemplate'),
            EnumValue   => Resource.getString('EnumValueTemplate')
        ];
    }


    public function print(cls: ExternClass): Array<GeneratedFile>
    {
        var files: Array<GeneratedFile> = [];

        // add main class file
        files.push({
            name: '$className.hx',
            content: printClass(cls)
        });

        // add enums
        for (enm in cls.enums)
        {
            files.push({
                name: '${enm.name}.hx',
                content: printEnum(enm, pkg, cls.native)
            });
        }

        return files;
    }


    function printClass(cls: ExternClass): String
    {
        var gen: String = templates[Class];

        var functionsStr: Array<String> = cls.functions.map(printFunction);

        gen = gen.replace('{{package}}', pkg)
                 .replace('{{native}}', cls.native)
                 .replace('{{class_name}}', className)
                 .replace('{{functions}}', functionsStr.join('\n\n'));

        return gen;
    }


    function printFunction(func: Function): String
    {
        var gen: String = templates[Function];

        var paramsDescr: String = '';
        for (parameter in func.parameters)
        {
            if (paramsDescr == '')
            {
                paramsDescr += '\n     * ';
            }
            paramsDescr += '\n     * ';
            paramsDescr += '@param ${parameter.name} ${parameter.description}';
        }

        var returnDescr: String = '';
        if (!func.returnType.description.isNullOrEmpty())
        {
            if (paramsDescr == '')
            {
                returnDescr += '\n     * ';
            }
            returnDescr += '\n     * ';
            returnDescr += '@return ${func.returnType.description}';
        }

        gen = gen.replace('{{description}}', func.description.replace('\n', '\n     * '))
                 .replace('{{params_descriptions}}', paramsDescr)
                 .replace('{{return_description}}', returnDescr)
                 .replace('{{name}}', func.name + (func.generic ? '<T>' : ''))
                 .replace('{{params}}', func.parameters.map(printFunctionParam).join(', '))
                 .replace('{{return}}', func.returnType.type);

        return gen;
    }


    function printFunctionParam(param: Parameter): String
    {
        return '${param.name}: ${param.type}';
    }


    function printEnum(enm: ExternEnum, pkg: String, native: String): String
    {
        var gen: String = templates[Enum];

        var enumValues: Array<String> = [];
        for (value in enm.values)
        {
            enumValues.push(
                templates[EnumValue].replace('{{description}}', value.description.replace('\n', '\n     * '))
                                    .replace('{{value}}', value.value)
            );
        }

        gen = gen.replace('{{package}}', pkg)
                 .replace('{{native}}', native)
                 .replace('{{enum_name}}', enm.name)
                 .replace('{{enum_values}}', enumValues.join('\n\n'));

        return gen;
    }
}

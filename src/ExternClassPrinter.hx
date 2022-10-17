package;

import haxe.Resource;
import types.GeneratedFile;
import types.ExternClass;

using StringTools;


enum abstract TemplateName(Int)
{
    var Class;
}


class ExternClassPrinter
{
    final className: String;
    final templates: Map<TemplateName, String>;


    public inline function new(className: String)
    {
        this.className = className;
        templates = [
            Class => Resource.getString('Class.hx.template')
        ];
    }


    public function print(cls: ExternClass): Array<GeneratedFile>
    {
        var files: Array<GeneratedFile> = [];

        // add main class file
        files.push({
            name: '$className.hx',
            content: printExternClass(cls)
        });

        return files;
    }


    function printExternClass(cls: ExternClass): String
    {
        var gen: String = templates[Class];

        gen = gen.replace('{{package}}', cls.native);

        return gen;
    }
}

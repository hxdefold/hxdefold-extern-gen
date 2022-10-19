
package;

import types.ExternClass;
import types.GeneratedFile;
import haxe.Http;
import sys.FileSystem;
import sys.io.File;
import haxe.io.Path;
import Sys.println;
using StringTools;


class Main
{



    function new()
    {
        // parse command line arguments
        var args: Array<String> = Sys.args();
        if (args.length < 3)
        {
            println('Usage: hxdefold-extern-gen [doc url] [class name] [output dir]');
            println('');
            println('Example: hxdefold-extern-gen https://defold.com/ref/stable/buffer/ gen/Buffer.hx');
            Sys.exit(1);
        }

        var docUrl: String = args[0];
        var className: String = args[1];
        var outDir: String = args[2];

        println('generating $className');

        // ensure that output directory exists
        FileSystem.createDirectory(outDir);

        // fetch the documentation html
        var docHtml: String = Http.requestUrl(docUrl);

        // parse
        var parser: DocParser = new DocParser();
        var cls: ExternClass = parser.parse(docHtml);

        // generate files
        var printer: ExternClassPrinter = new ExternClassPrinter(className);
        var genFiles: Array<GeneratedFile> = printer.print(cls);

        // store files in the output directory
        for (file in genFiles)
        {
            var filePath: String = Path.join([outDir, file.name]);
            File.saveContent(filePath, file.content);
        }
    }


    static function main()
    {
        new Main();
    }
}

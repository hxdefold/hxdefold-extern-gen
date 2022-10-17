
package;

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
        if (args.length < 2)
        {
            println('Usage: hxdefold-extern-gen [doc url] [output haxe file]');
            println('');
            println('Example: hxdefold-extern-gen https://defold.com/ref/stable/buffer/ gen/Buffer.hx');
            Sys.exit(1);
        }

        var docUrl: String = args[0];
        var outFile: String = args[1];
        var className: String = Path.withoutExtension(Path.withoutDirectory(outFile));

        // ensure that output directory exists
        FileSystem.createDirectory(Path.directory(outFile));

        // fetch the documentation html
        var docHtml: String = Http.requestUrl(docUrl);

        // parse
        var parser: DocParser = new DocParser();
        parser.parse(docHtml);
    }


    static function main()
    {
        new Main();
    }
}

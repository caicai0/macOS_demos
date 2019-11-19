import Foundation
import Antlr4

class Loader: JSONBaseListener {
    var root : Any? = nil
    var path  = [Any]()
    var currentObject = [String:Any]()
    var currentArray = [Any]()
    
    override func enterJson(_ ctx: JSONParser.JsonContext) {
        print(ctx)
    }
    
    override func enterObj(_ ctx: JSONParser.ObjContext) {
        print(ctx)
    }
    
    override func enterArray(_ ctx: JSONParser.ArrayContext) {
        print(ctx)
    }
    
    override func enterPair(_ ctx: JSONParser.PairContext) {
        print(ctx)
    }
    
    override func enterValue(_ ctx: JSONParser.ValueContext) {
        print(ctx)
    }
    
    override func exitJson(_ ctx: JSONParser.JsonContext) {
        print(ctx)
    }
}

class visitor: JSONBaseVisitor<Any> {
    
}

if let fileContent = FileManager.default.contents(atPath: "/Users/liyufeng/git/caihub/macOS_demos/book/8.2/g4/examples/example1.json") {
    if let str = String(data: fileContent, encoding: .utf8) {
        let input = ANTLRInputStream(str)
        let lexer = JSONLexer(input)
        let tokens = CommonTokenStream(lexer)
        let parser = try JSONParser(tokens)
        let tree = try parser.json()

        let walker = ParseTreeWalker()
        let loader = Loader()
        try walker.walk(loader, tree)

        print(loader.root as Any)
    }
}

print("Hello, world!")

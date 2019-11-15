import Foundation
import Antlr4

class Loader: CsvBaseListener {
    var rows = [[[String:String]]]()
    var header = [String]()
    var currentRow = [String]()
    
    override func exitString(_ ctx: CsvParser.StringContext) {
        if let s = ctx.STRING()?.getText() {
            currentRow.append(s)
        }else{
            currentRow.append("")
        }
    }
    
    override func exitText(_ ctx: CsvParser.TextContext) {
        if let s = ctx.TEXT()?.getText() {
            currentRow.append(s)
        }else{
            currentRow.append("")
        }
    }
    
    override func exitEmpty(_ ctx: CsvParser.EmptyContext) {
        currentRow.append("")
    }
    
    override func exitHdr(_ ctx: CsvParser.HdrContext) {
        header = [String]()
        header.append(contentsOf: currentRow)
    }
    
    override func enterRow(_ ctx: CsvParser.RowContext) {
        currentRow = [String]()
    }
    
    override func exitRow(_ ctx: CsvParser.RowContext) {
        if ctx.parent?.getRuleIndex() == CsvParser.RULE_hdr {
            return;
        }
        var m = [[String:String]]()
        for i in 0 ..< currentRow.count {
            m.append([header[i]:currentRow[i]])
        }
        rows.append(m)
    }
}

if let fileContent = FileManager.default.contents(atPath: "/Users/liyufeng/git/caihub/macOS_demos/book/8.1/text.csv") {
    if let str = String(data: fileContent, encoding: .utf8) {
        let input = ANTLRInputStream(str)
        let lexer = CsvLexer(input)
        let tokens = CommonTokenStream(lexer)
        let parser = try CsvParser(tokens)
        let tree = try parser.file()

        let walker = ParseTreeWalker()
        let loader = Loader()
        try walker.walk(loader, tree)

        print(loader.rows)
    }
}

print("Hello, world!")

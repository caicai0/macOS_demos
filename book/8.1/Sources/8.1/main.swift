import Foundation
import Antlr4

class Loader: CSVBaseListener {
    var rows = [[[String:String]]]()
    var header = [String]()
    var currentRow = [String]()
    
    override func exitString(_ ctx: CSVParser.StringContext) {
        if let s = ctx.STRING()?.getText() {
            currentRow.append(s)
        }else{
            currentRow.append("")
        }
    }
    
    override func exitText(_ ctx: CSVParser.TextContext) {
        if let s = ctx.TEXT()?.getText() {
            currentRow.append(s)
        }else{
            currentRow.append("")
        }
    }
    
    override func exitEmpty(_ ctx: CSVParser.EmptyContext) {
        currentRow.append("")
    }
    
    override func exitHdr(_ ctx: CSVParser.HdrContext) {
        header = [String]()
        header.append(contentsOf: currentRow)
    }
    
    override func enterRow(_ ctx: CSVParser.RowContext) {
        currentRow = [String]()
    }
    
    override func exitRow(_ ctx: CSVParser.RowContext) {
        if ctx.parent?.getRuleIndex() == CSVParser.RULE_hdr {
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
        let lexer = CSVLexer(input)
        let tokens = CommonTokenStream(lexer)
        let parser = try CSVParser(tokens)
        let tree = try parser.csvFile()

        let walker = ParseTreeWalker()
        let loader = Loader()
        try walker.walk(loader, tree)

        print(loader.rows)
    }
}

print("Hello, world!")

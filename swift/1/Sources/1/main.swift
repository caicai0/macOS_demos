
import AST
import Parser
import Source

do {
    let filePath = "/Users/liyufeng/git/caihub/macOS_demos/swift/1/Sources/1/main.swift"
    let sourceFile = try SourceReader.read(at: filePath)
    let parser = Parser(source: sourceFile)
    let topLevelDecl = try parser.parse()
    
    for stmt in topLevelDecl.statements {
        print(stmt)
    }
    
    class MyVisitor : ASTVisitor {
        func visit(ifStmt: IfStatement) throws -> Bool {
            print(ifStmt)
            return true
        }
    }
    let myVisitor = MyVisitor()
    let _  = try myVisitor.visit(topLevelDecl)
} catch {
    // handle errors
}

print("Hello, world!")

// Generated from Csv.g4 by ANTLR 4.7.2
import Antlr4

open class CsvParser: Parser {

	internal static var _decisionToDFA: [DFA] = {
          var decisionToDFA = [DFA]()
          let length = CsvParser._ATN.getNumberOfDecisions()
          for i in 0..<length {
            decisionToDFA.append(DFA(CsvParser._ATN.getDecisionState(i)!, i))
           }
           return decisionToDFA
     }()

	internal static let _sharedContextCache = PredictionContextCache()

	public
	enum Tokens: Int {
		case EOF = -1, T__0 = 1, T__1 = 2, T__2 = 3, TEXT = 4, STRING = 5
	}

	public
	static let RULE_file = 0, RULE_hdr = 1, RULE_row = 2, RULE_field = 3

	public
	static let ruleNames: [String] = [
		"file", "hdr", "row", "field"
	]

	private static let _LITERAL_NAMES: [String?] = [
		nil, "','", "'\r'", "'\n'"
	]
	private static let _SYMBOLIC_NAMES: [String?] = [
		nil, nil, nil, nil, "TEXT", "STRING"
	]
	public
	static let VOCABULARY = Vocabulary(_LITERAL_NAMES, _SYMBOLIC_NAMES)

	override open
	func getGrammarFileName() -> String { return "Csv.g4" }

	override open
	func getRuleNames() -> [String] { return CsvParser.ruleNames }

	override open
	func getSerializedATN() -> String { return CsvParser._serializedATN }

	override open
	func getATN() -> ATN { return CsvParser._ATN }


	override open
	func getVocabulary() -> Vocabulary {
	    return CsvParser.VOCABULARY
	}

	override public
	init(_ input:TokenStream) throws {
	    RuntimeMetaData.checkVersion("4.7.2", RuntimeMetaData.VERSION)
		try super.init(input)
		_interp = ParserATNSimulator(self,CsvParser._ATN,CsvParser._decisionToDFA, CsvParser._sharedContextCache)
	}


	public class FileContext: ParserRuleContext {
			open
			func hdr() -> HdrContext? {
				return getRuleContext(HdrContext.self, 0)
			}
			open
			func row() -> [RowContext] {
				return getRuleContexts(RowContext.self)
			}
			open
			func row(_ i: Int) -> RowContext? {
				return getRuleContext(RowContext.self, i)
			}
		override open
		func getRuleIndex() -> Int {
			return CsvParser.RULE_file
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CsvListener {
				listener.enterFile(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CsvListener {
				listener.exitFile(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? CsvVisitor {
			    return visitor.visitFile(self)
			}
			else if let visitor = visitor as? CsvBaseVisitor {
			    return visitor.visitFile(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func file() throws -> FileContext {
		var _localctx: FileContext = FileContext(_ctx, getState())
		try enterRule(_localctx, 0, CsvParser.RULE_file)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(8)
		 	try hdr()
		 	setState(10) 
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	repeat {
		 		setState(9)
		 		try row()


		 		setState(12); 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	} while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, CsvParser.Tokens.T__0.rawValue,CsvParser.Tokens.T__1.rawValue,CsvParser.Tokens.T__2.rawValue,CsvParser.Tokens.TEXT.rawValue,CsvParser.Tokens.STRING.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }())

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class HdrContext: ParserRuleContext {
			open
			func row() -> RowContext? {
				return getRuleContext(RowContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CsvParser.RULE_hdr
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CsvListener {
				listener.enterHdr(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CsvListener {
				listener.exitHdr(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? CsvVisitor {
			    return visitor.visitHdr(self)
			}
			else if let visitor = visitor as? CsvBaseVisitor {
			    return visitor.visitHdr(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func hdr() throws -> HdrContext {
		var _localctx: HdrContext = HdrContext(_ctx, getState())
		try enterRule(_localctx, 2, CsvParser.RULE_hdr)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(14)
		 	try row()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class RowContext: ParserRuleContext {
			open
			func field() -> [FieldContext] {
				return getRuleContexts(FieldContext.self)
			}
			open
			func field(_ i: Int) -> FieldContext? {
				return getRuleContext(FieldContext.self, i)
			}
		override open
		func getRuleIndex() -> Int {
			return CsvParser.RULE_row
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CsvListener {
				listener.enterRow(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CsvListener {
				listener.exitRow(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? CsvVisitor {
			    return visitor.visitRow(self)
			}
			else if let visitor = visitor as? CsvBaseVisitor {
			    return visitor.visitRow(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func row() throws -> RowContext {
		var _localctx: RowContext = RowContext(_ctx, getState())
		try enterRule(_localctx, 4, CsvParser.RULE_row)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(16)
		 	try field()
		 	setState(21)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == CsvParser.Tokens.T__0.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(17)
		 		try match(CsvParser.Tokens.T__0.rawValue)
		 		setState(18)
		 		try field()


		 		setState(23)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(25)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == CsvParser.Tokens.T__1.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(24)
		 		try match(CsvParser.Tokens.T__1.rawValue)

		 	}

		 	setState(27)
		 	try match(CsvParser.Tokens.T__2.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class FieldContext: ParserRuleContext {
		override open
		func getRuleIndex() -> Int {
			return CsvParser.RULE_field
		}
	 
		open
		func copyFrom(_ ctx: FieldContext) {
			super.copyFrom(ctx)
		}
	}
	public class StringContext: FieldContext {
			open
			func STRING() -> TerminalNode? {
				return getToken(CsvParser.Tokens.STRING.rawValue, 0)
			}

		public
		init(_ ctx: FieldContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CsvListener {
				listener.enterString(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CsvListener {
				listener.exitString(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? CsvVisitor {
			    return visitor.visitString(self)
			}
			else if let visitor = visitor as? CsvBaseVisitor {
			    return visitor.visitString(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class TextContext: FieldContext {
			open
			func TEXT() -> TerminalNode? {
				return getToken(CsvParser.Tokens.TEXT.rawValue, 0)
			}

		public
		init(_ ctx: FieldContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CsvListener {
				listener.enterText(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CsvListener {
				listener.exitText(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? CsvVisitor {
			    return visitor.visitText(self)
			}
			else if let visitor = visitor as? CsvBaseVisitor {
			    return visitor.visitText(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class EmptyContext: FieldContext {

		public
		init(_ ctx: FieldContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CsvListener {
				listener.enterEmpty(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CsvListener {
				listener.exitEmpty(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? CsvVisitor {
			    return visitor.visitEmpty(self)
			}
			else if let visitor = visitor as? CsvBaseVisitor {
			    return visitor.visitEmpty(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func field() throws -> FieldContext {
		var _localctx: FieldContext = FieldContext(_ctx, getState())
		try enterRule(_localctx, 6, CsvParser.RULE_field)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(32)
		 	try _errHandler.sync(self)
		 	switch (CsvParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .TEXT:
		 		_localctx =  TextContext(_localctx);
		 		try enterOuterAlt(_localctx, 1)
		 		setState(29)
		 		try match(CsvParser.Tokens.TEXT.rawValue)

		 		break

		 	case .STRING:
		 		_localctx =  StringContext(_localctx);
		 		try enterOuterAlt(_localctx, 2)
		 		setState(30)
		 		try match(CsvParser.Tokens.STRING.rawValue)

		 		break
		 	case .T__0:fallthrough
		 	case .T__1:fallthrough
		 	case .T__2:
		 		_localctx =  EmptyContext(_localctx);
		 		try enterOuterAlt(_localctx, 3)

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}


	public
	static let _serializedATN = CsvParserATN().jsonString

	public
	static let _ATN = ATNDeserializer().deserializeFromJson(_serializedATN)
}
// Generated from JSON.g4 by ANTLR 4.7.2
import Antlr4

open class JSONLexer: Lexer {

	internal static var _decisionToDFA: [DFA] = {
          var decisionToDFA = [DFA]()
          let length = JSONLexer._ATN.getNumberOfDecisions()
          for i in 0..<length {
          	    decisionToDFA.append(DFA(JSONLexer._ATN.getDecisionState(i)!, i))
          }
           return decisionToDFA
     }()

	internal static let _sharedContextCache = PredictionContextCache()

	public
	static let T__0=1, T__1=2, T__2=3, T__3=4, T__4=5, T__5=6, T__6=7, T__7=8, 
            T__8=9, STRING=10, NUMBER=11, WS=12

	public
	static let channelNames: [String] = [
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	]

	public
	static let modeNames: [String] = [
		"DEFAULT_MODE"
	]

	public
	static let ruleNames: [String] = [
		"T__0", "T__1", "T__2", "T__3", "T__4", "T__5", "T__6", "T__7", "T__8", 
		"STRING", "ESC", "UNICODE", "HEX", "SAFECODEPOINT", "NUMBER", "INT", "EXP", 
		"WS"
	]

	private static let _LITERAL_NAMES: [String?] = [
		nil, "'{'", "','", "'}'", "':'", "'['", "']'", "'true'", "'false'", "'null'"
	]
	private static let _SYMBOLIC_NAMES: [String?] = [
		nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, "STRING", "NUMBER", 
		"WS"
	]
	public
	static let VOCABULARY = Vocabulary(_LITERAL_NAMES, _SYMBOLIC_NAMES)


	override open
	func getVocabulary() -> Vocabulary {
		return JSONLexer.VOCABULARY
	}

	public
	required init(_ input: CharStream) {
	    RuntimeMetaData.checkVersion("4.7.2", RuntimeMetaData.VERSION)
		super.init(input)
		_interp = LexerATNSimulator(self, JSONLexer._ATN, JSONLexer._decisionToDFA, JSONLexer._sharedContextCache)
	}

	override open
	func getGrammarFileName() -> String { return "JSON.g4" }

	override open
	func getRuleNames() -> [String] { return JSONLexer.ruleNames }

	override open
	func getSerializedATN() -> String { return JSONLexer._serializedATN }

	override open
	func getChannelNames() -> [String] { return JSONLexer.channelNames }

	override open
	func getModeNames() -> [String] { return JSONLexer.modeNames }

	override open
	func getATN() -> ATN { return JSONLexer._ATN }


	public
	static let _serializedATN: String = JSONLexerATN().jsonString

	public
	static let _ATN: ATN = ATNDeserializer().deserializeFromJson(_serializedATN)
}
// Generated from Csv.g4 by ANTLR 4.7.2
import Antlr4

open class CsvLexer: Lexer {

	internal static var _decisionToDFA: [DFA] = {
          var decisionToDFA = [DFA]()
          let length = CsvLexer._ATN.getNumberOfDecisions()
          for i in 0..<length {
          	    decisionToDFA.append(DFA(CsvLexer._ATN.getDecisionState(i)!, i))
          }
           return decisionToDFA
     }()

	internal static let _sharedContextCache = PredictionContextCache()

	public
	static let T__0=1, T__1=2, T__2=3, TEXT=4, STRING=5

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
		"T__0", "T__1", "T__2", "TEXT", "STRING"
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
	func getVocabulary() -> Vocabulary {
		return CsvLexer.VOCABULARY
	}

	public
	required init(_ input: CharStream) {
	    RuntimeMetaData.checkVersion("4.7.2", RuntimeMetaData.VERSION)
		super.init(input)
		_interp = LexerATNSimulator(self, CsvLexer._ATN, CsvLexer._decisionToDFA, CsvLexer._sharedContextCache)
	}

	override open
	func getGrammarFileName() -> String { return "Csv.g4" }

	override open
	func getRuleNames() -> [String] { return CsvLexer.ruleNames }

	override open
	func getSerializedATN() -> String { return CsvLexer._serializedATN }

	override open
	func getChannelNames() -> [String] { return CsvLexer.channelNames }

	override open
	func getModeNames() -> [String] { return CsvLexer.modeNames }

	override open
	func getATN() -> ATN { return CsvLexer._ATN }


	public
	static let _serializedATN: String = CsvLexerATN().jsonString

	public
	static let _ATN: ATN = ATNDeserializer().deserializeFromJson(_serializedATN)
}
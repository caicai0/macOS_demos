// Generated from Csv.g4 by ANTLR 4.7.2
import Antlr4

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link CsvParser}.
 */
public protocol CsvListener: ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link CsvParser#file}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterFile(_ ctx: CsvParser.FileContext)
	/**
	 * Exit a parse tree produced by {@link CsvParser#file}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitFile(_ ctx: CsvParser.FileContext)
	/**
	 * Enter a parse tree produced by {@link CsvParser#hdr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterHdr(_ ctx: CsvParser.HdrContext)
	/**
	 * Exit a parse tree produced by {@link CsvParser#hdr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitHdr(_ ctx: CsvParser.HdrContext)
	/**
	 * Enter a parse tree produced by {@link CsvParser#row}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterRow(_ ctx: CsvParser.RowContext)
	/**
	 * Exit a parse tree produced by {@link CsvParser#row}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitRow(_ ctx: CsvParser.RowContext)
	/**
	 * Enter a parse tree produced by the {@code text}
	 * labeled alternative in {@link CsvParser#field}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterText(_ ctx: CsvParser.TextContext)
	/**
	 * Exit a parse tree produced by the {@code text}
	 * labeled alternative in {@link CsvParser#field}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitText(_ ctx: CsvParser.TextContext)
	/**
	 * Enter a parse tree produced by the {@code string}
	 * labeled alternative in {@link CsvParser#field}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterString(_ ctx: CsvParser.StringContext)
	/**
	 * Exit a parse tree produced by the {@code string}
	 * labeled alternative in {@link CsvParser#field}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitString(_ ctx: CsvParser.StringContext)
	/**
	 * Enter a parse tree produced by the {@code empty}
	 * labeled alternative in {@link CsvParser#field}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterEmpty(_ ctx: CsvParser.EmptyContext)
	/**
	 * Exit a parse tree produced by the {@code empty}
	 * labeled alternative in {@link CsvParser#field}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitEmpty(_ ctx: CsvParser.EmptyContext)
}
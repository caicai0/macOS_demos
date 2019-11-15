// Generated from CSV.g4 by ANTLR 4.7.2
import Antlr4

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link CSVParser}.
 */
public protocol CSVListener: ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link CSVParser#csvFile}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterCsvFile(_ ctx: CSVParser.CsvFileContext)
	/**
	 * Exit a parse tree produced by {@link CSVParser#csvFile}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitCsvFile(_ ctx: CSVParser.CsvFileContext)
	/**
	 * Enter a parse tree produced by {@link CSVParser#hdr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterHdr(_ ctx: CSVParser.HdrContext)
	/**
	 * Exit a parse tree produced by {@link CSVParser#hdr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitHdr(_ ctx: CSVParser.HdrContext)
	/**
	 * Enter a parse tree produced by {@link CSVParser#row}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterRow(_ ctx: CSVParser.RowContext)
	/**
	 * Exit a parse tree produced by {@link CSVParser#row}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitRow(_ ctx: CSVParser.RowContext)
	/**
	 * Enter a parse tree produced by the {@code text}
	 * labeled alternative in {@link CSVParser#field}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterText(_ ctx: CSVParser.TextContext)
	/**
	 * Exit a parse tree produced by the {@code text}
	 * labeled alternative in {@link CSVParser#field}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitText(_ ctx: CSVParser.TextContext)
	/**
	 * Enter a parse tree produced by the {@code string}
	 * labeled alternative in {@link CSVParser#field}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterString(_ ctx: CSVParser.StringContext)
	/**
	 * Exit a parse tree produced by the {@code string}
	 * labeled alternative in {@link CSVParser#field}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitString(_ ctx: CSVParser.StringContext)
	/**
	 * Enter a parse tree produced by the {@code empty}
	 * labeled alternative in {@link CSVParser#field}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterEmpty(_ ctx: CSVParser.EmptyContext)
	/**
	 * Exit a parse tree produced by the {@code empty}
	 * labeled alternative in {@link CSVParser#field}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitEmpty(_ ctx: CSVParser.EmptyContext)
}
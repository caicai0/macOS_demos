// Generated from Csv.g4 by ANTLR 4.7.2
import Antlr4

/**
 * This interface defines a complete generic visitor for a parse tree produced
 * by {@link CsvParser}.
 *
 * @param <T> The return type of the visit operation. Use {@link Void} for
 * operations with no return type.
 */
open class CsvVisitor<T>: ParseTreeVisitor<T> {
	/**
	 * Visit a parse tree produced by {@link CsvParser#file}.
	- Parameters:
	  - ctx: the parse tree
	- returns: the visitor result
	 */
	open func visitFile(_ ctx: CsvParser.FileContext) -> T {
	 	fatalError(#function + " must be overridden")
	}

	/**
	 * Visit a parse tree produced by {@link CsvParser#hdr}.
	- Parameters:
	  - ctx: the parse tree
	- returns: the visitor result
	 */
	open func visitHdr(_ ctx: CsvParser.HdrContext) -> T {
	 	fatalError(#function + " must be overridden")
	}

	/**
	 * Visit a parse tree produced by {@link CsvParser#row}.
	- Parameters:
	  - ctx: the parse tree
	- returns: the visitor result
	 */
	open func visitRow(_ ctx: CsvParser.RowContext) -> T {
	 	fatalError(#function + " must be overridden")
	}

	/**
	 * Visit a parse tree produced by the {@code text}
	 * labeled alternative in {@link CsvParser#field}.
	- Parameters:
	  - ctx: the parse tree
	- returns: the visitor result
	 */
	open func visitText(_ ctx: CsvParser.TextContext) -> T {
	 	fatalError(#function + " must be overridden")
	}

	/**
	 * Visit a parse tree produced by the {@code string}
	 * labeled alternative in {@link CsvParser#field}.
	- Parameters:
	  - ctx: the parse tree
	- returns: the visitor result
	 */
	open func visitString(_ ctx: CsvParser.StringContext) -> T {
	 	fatalError(#function + " must be overridden")
	}

	/**
	 * Visit a parse tree produced by the {@code empty}
	 * labeled alternative in {@link CsvParser#field}.
	- Parameters:
	  - ctx: the parse tree
	- returns: the visitor result
	 */
	open func visitEmpty(_ ctx: CsvParser.EmptyContext) -> T {
	 	fatalError(#function + " must be overridden")
	}

}
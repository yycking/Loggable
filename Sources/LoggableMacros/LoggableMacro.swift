import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

/// Logs a string interpolation at the `debug` level.
///
/// Values that can be interpolated include signed and unsigned Swift integers, Floats,
/// Doubles, Bools, Strings, NSObjects, UnsafeRaw(Buffer)Pointers, values conforming to
/// `CustomStringConvertible` like Arrays and Dictionaries, and metatypes like
/// `type(of: c)`, `Int.self`.
///
/// Examples
/// ========
///
///     let logger = OSLog()
///     let logCategory = "☆"
///     #logDebug("A string interpolation \(x)")
///
/// Formatting Interpolated Expressions and Specifying Privacy
/// ==========================================================
///
/// Formatting and privacy options for the interpolated values can be passed as arguments
/// to the interpolations. These are optional arguments. When not specified, they will be set to their
/// default values.
///
///     #logDebug("An unsigned integer \(x)")
///     #logDebug("An unsigned integer \(public: x)")
///
/// - Warning: Do not explicity create LoggableMessage. Instead pass a string interpolation.
///
/// - Parameter message: A string interpolation.
public struct DebugMacro: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) -> ExprSyntax {
        convert(of: node, in: context, type: "debug")
    }
}

/// Logs a string interpolation at the `info` level.
///
/// Values that can be interpolated include signed and unsigned Swift integers, Floats,
/// Doubles, Bools, Strings, NSObjects, UnsafeRaw(Buffer)Pointers, values conforming to
/// `CustomStringConvertible` like Arrays and Dictionaries, and metatypes like
/// `type(of: c)`, `Int.self`.
///
/// Examples
/// ========
///
///     let logger = OSLog()
///     let logCategory = "☆"
///     #logInfo("A string interpolation \(x)")
///
/// Formatting Interpolated Expressions and Specifying Privacy
/// ==========================================================
///
/// Formatting and privacy options for the interpolated values can be passed as arguments
/// to the interpolations. These are optional arguments. When not specified, they will be set to their
/// default values.
///
///     #logInfo("An unsigned integer \(x)")
///     #logInfo("An unsigned integer \(public: x)")
///
/// - Warning: Do not explicity create LoggableMessage. Instead pass a string interpolation.
///
/// - Parameter message: A string interpolation.
public struct InfoMacro: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) -> ExprSyntax {
        convert(of: node, in: context, type: "info")
    }
}

/// Logs a string interpolation at the `default` level.
///
/// Values that can be interpolated include signed and unsigned Swift integers, Floats,
/// Doubles, Bools, Strings, NSObjects, UnsafeRaw(Buffer)Pointers, values conforming to
/// `CustomStringConvertible` like Arrays and Dictionaries, and metatypes like
/// `type(of: c)`, `Int.self`.
///
/// Examples
/// ========
///
///     let logger = OSLog()
///     let logCategory = "☆"
///     #logNotice("A string interpolation \(x)")
///
/// Formatting Interpolated Expressions and Specifying Privacy
/// ==========================================================
///
/// Formatting and privacy options for the interpolated values can be passed as arguments
/// to the interpolations. These are optional arguments. When not specified, they will be set to their
/// default values.
///
///     #logNotice("An unsigned integer \(x)")
///     #logNotice("An unsigned integer \(public: x)")
///
/// - Warning: Do not explicity create LoggableMessage. Instead pass a string interpolation.
///
/// - Parameter message: A string interpolation.
public struct NoticeMacro: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) -> ExprSyntax {
        convert(of: node, in: context, type: "default")
    }
}

/// Logs a string interpolation at the `error` level.
///
/// Values that can be interpolated include signed and unsigned Swift integers, Floats,
/// Doubles, Bools, Strings, NSObjects, UnsafeRaw(Buffer)Pointers, values conforming to
/// `CustomStringConvertible` like Arrays and Dictionaries, and metatypes like
/// `type(of: c)`, `Int.self`.
///
/// Examples
/// ========
///
///     let logger = OSLog()
///     let logCategory = "☆"
///     #logError("A string interpolation \(x)")
///
/// Formatting Interpolated Expressions and Specifying Privacy
/// ==========================================================
///
/// Formatting and privacy options for the interpolated values can be passed as arguments
/// to the interpolations. These are optional arguments. When not specified, they will be set to their
/// default values.
///
///     #logError("An unsigned integer \(x)")
///     #logError("An unsigned integer \(public: x)")
///
/// - Warning: Do not explicity create LoggableMessage. Instead pass a string interpolation.
///
/// - Parameter message: A string interpolation.
public struct ErrorMacro: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) -> ExprSyntax {
        convert(of: node, in: context, type: "error")
    }
}

/// Logs a string interpolation at the `fault` level.
///
/// Values that can be interpolated include signed and unsigned Swift integers, Floats,
/// Doubles, Bools, Strings, NSObjects, UnsafeRaw(Buffer)Pointers, values conforming to
/// `CustomStringConvertible` like Arrays and Dictionaries, and metatypes like
/// `type(of: c)`, `Int.self`.
///
/// Examples
/// ========
///
///     let logger = OSLog()
///     #logFault("A string interpolation \(x)")
///
/// Formatting Interpolated Expressions and Specifying Privacy
/// ==========================================================
///
/// Formatting and privacy options for the interpolated values can be passed as arguments
/// to the interpolations. These are optional arguments. When not specified, they will be set to their
/// default values.
///
///     #logFault("An unsigned integer \(x)")
///     #logFault("An unsigned integer \(public: x)")
///
/// - Warning: Do not explicity create LoggableMessage. Instead pass a string interpolation.
///
/// - Parameter message: A string interpolation.
public struct FaultMacro: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) -> ExprSyntax {
        convert(of: node, in: context, type: "fault")
    }
}


func convert(
    of node: some FreestandingMacroExpansionSyntax,
    in context: some MacroExpansionContext,
    type: String
) -> ExprSyntax  {
    guard let argument = node.arguments.first?.expression,
          let segments = argument.as(StringLiteralExprSyntax.self)?.segments else  {
        fatalError("compiler bug: the macro does not have any arguments")
    }
    
    var message = ""
    var values: [String] = []
    segments.forEach { segment in
        switch segment {
        case let .stringSegment(string):
            message += string.description
        case let .expressionSegment(expression):
            message += "%"
            expression.expressions.forEach { labelExpression in
                let value = labelExpression.expression.description
                
                switch labelExpression.label?.text {
                case .some("public"):
                    message += "{public}"
                default:
                    break
                }
                
                values += [value]
            }
            message += "s"
        }
    }
    
    let arg = values.map{"""
        , "\\(\($0))"
        """}.joined()
    return """
        os_log(.\(raw: type), log: logger, "\(raw: message)"\(raw: arg))
        """
}




@main
struct LoggablePlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        DebugMacro.self,
        InfoMacro.self,
        NoticeMacro.self,
        ErrorMacro.self,
        FaultMacro.self,
    ]
}

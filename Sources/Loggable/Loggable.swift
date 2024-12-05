// The Swift Programming Language
// https://docs.swift.org/swift-book

import OSLog

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
@freestanding(expression)
public macro logDebug(_ value: LoggableMessage) -> Void =
    #externalMacro(module: "LoggableMacros", type: "DebugMacro")

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
@freestanding(expression)
public macro logInfo(_ value: LoggableMessage) -> Void =
    #externalMacro(module: "LoggableMacros", type: "InfoMacro")

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
@freestanding(expression)
public macro logNotice(_ value: LoggableMessage) -> Void =
    #externalMacro(module: "LoggableMacros", type: "NoticeMacro")

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
@freestanding(expression)
public macro logError(_ value: LoggableMessage) -> Void =
    #externalMacro(module: "LoggableMacros", type: "ErrorMacro")

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
@freestanding(expression)
public macro logFault(_ value: LoggableMessage) -> Void =
    #externalMacro(module: "LoggableMacros", type: "FaultMacro")

public struct LoggableMessage {
}

extension LoggableMessage: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
    }
}

extension LoggableMessage: ExpressibleByStringInterpolation {
    public struct StringInterpolation {
    }

    public init(stringInterpolation: StringInterpolation) {
    }
}

extension LoggableMessage.StringInterpolation: StringInterpolationProtocol {

    public init(literalCapacity: Int, interpolationCount: Int) {
    }

    public mutating func appendLiteral(_ literal: String) {
    }

    public mutating func appendInterpolation(
        public value: CustomStringConvertible
    ) {
    }

    public mutating func appendInterpolation(
        _ value: CustomStringConvertible
    ) {
    }
}

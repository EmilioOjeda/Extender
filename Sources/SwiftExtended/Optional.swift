public extension Optional {
    /// Performs a `nil-coalescing` operation, returning the wrapped value of an `Optional` instance or a fallback value.
    ///
    /// A `nil-coalescing` operation unwraps the wrapped value if it has a value, or it returns the the value set as a fallback.
    /// The result of this operation will have the non-optional type of the `Wrapped` type.
    ///
    /// This operator uses short-circuit evaluation: optional is checked first, and `fallback` is evaluated only if optional is `nil`.
    ///
    /// - Parameter fallback: A value to use as a fallback. `fallback` is the same type as the `Wrapped` type of optional.
    /// - Returns: An instance of the `Wrapped` type.
    func or(
        _ fallback: @autoclosure () throws -> Wrapped
    ) rethrows -> Wrapped {
        guard let self else {
            return try fallback()
        }
        return self
    }

    /// Performs a `nil-coalescing` operation, returning the wrapped value of an `Optional` instance or a fallback `Optional` value.
    ///
    /// A `nil-coalescing` operation unwraps the wrapped value if it has a value, or returns the value set as a fallback.
    /// The result of this operation will be the same type as its arguments.
    ///
    /// This operator uses short-circuit evaluation: optional is checked first, and `fallback` is evaluated only if optional is `nil`.
    ///
    /// - Parameter fallback: A value to use as a fallback. `fallback` and optional have the same type.
    /// - Returns: An optional instance of the `Wrapped` type.
    func or(
        _ fallback: @autoclosure () throws -> Wrapped?
    ) rethrows -> Wrapped? {
        guard let self else {
            return try fallback()
        }
        return self
    }
}

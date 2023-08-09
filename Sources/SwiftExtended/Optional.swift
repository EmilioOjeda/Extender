/// Set of extensions for the `Optional` type that allows using `nil-coalescing` operations in the form of functions.
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

public extension Optional {
    /// A boolean value indicating whether its content is `nil`.
    var isNil: Bool {
        self == nil
    }

    /// A boolean value indicating whether its content is not `nil`.
    var isNotNil: Bool {
        self != nil
    }
}

public extension Optional {
    /// Filters the value out when the `condition` is not met.
    ///
    /// It has a side effect dependent on the meeting of the `condition` executed.
    /// When the `condition` resolves to `false`, it discards the value and returns `nil` instead.
    ///
    /// ```swift
    /// let searchText: String? = "Coffee"
    ///
    /// searchText
    ///     .filter(\.count >= 3)
    ///     .map(search)
    /// ```
    ///
    /// - Parameter condition: The condition to fulfill.
    /// - Returns: The wrapped value when fulfilling the `condition`; otherwise, `nil`.
    func filter(
        _ condition: (Wrapped) throws -> Bool
    ) rethrows -> Wrapped? {
        try flatMap { wrapped in
            try condition(wrapped) ? wrapped : nil
        }
    }

    /// Filters the value out when the `condition` is not met and runs the `transform` function when met.
    ///
    /// This is equivalent to doing `filter(_:)` + `flatMap(_:)` in a single shot.
    ///
    /// ```swift
    /// let searchText: String? = "Coffee"
    ///
    /// searchText
    ///     .filter(where: \.count >= 3) { text in
    ///         search(text)
    ///     }
    /// ```
    ///
    /// - Parameters:
    ///   - condition: The condition to fulfill.
    ///   - transform: The transformation to execution when the `condition` is met.
    /// - Returns: An optional value that resolves to either the result of the transformation or `nil`, depending on the meeting of the `condition`.
    func filter<Value>(
        where condition: (Wrapped) -> Bool,
        then transform: (Wrapped) throws -> Value?
    ) rethrows -> Value? {
        try filter(condition)
            .flatMap(transform)
    }
}

public extension Optional where Wrapped: Equatable {
    /// Checks if the value is wrapped within the `Optional` type.
    /// - Parameter value: The value to search for.
    /// - Returns: Whether the given value is wrapped in the `Optional` type.
    func contains(_ value: Wrapped) -> Bool {
        self == value
    }
}

public extension Optional where Wrapped: Collection, Wrapped.Element: Equatable {
    /// Checks if the value is present in the `Collection` wrapped within the `Optional` type.
    /// - Parameter element: The value to search for.
    /// - Returns: Whether the given value is present in the `Collection` wrapped in the `Optiona` type.
    func contains(_ element: Wrapped.Element) -> Bool {
        guard let collection = self else {
            return false
        }
        return collection
            .contains(where: \.self == element)
    }
}

public extension Dictionary {
    /// Creates a new dictionary by merging the elements of the two dictionaries.
    ///
    /// The dictionary on the right-hand side takes priority over the one on the left-hand side;
    /// this means if both dictionaries share keys, the values on the right-hand side dictionary will replace the values on the left-hand side dictionary.
    ///
    /// - Parameters:
    ///   - lhs: A dictionary value.
    ///   - rhs: Another dictionary value.
    /// - Returns: The resulting dictionary after doing the merging operation.
    static func + (lhs: [Key: Value], rhs: [Key: Value]) -> [Key: Value] {
        lhs.merging(rhs) { _, rhsValues in rhsValues }
    }

    /// Merges the elements of the given dictionary (on the right-hand side) to the existing one (on the left-hand side).
    ///
    /// The dictionary on the right-hand side takes priority over the one on the left-hand side;
    /// this means if both dictionaries share keys, the values on the right-hand side dictionary will replace the values on the left-hand side dictionary.
    ///
    /// - Parameters:
    ///   - lhs: A dictionary value.
    ///   - rhs: Another dictionary value.
    static func += (lhs: inout [Key: Value], rhs: [Key: Value]) {
        lhs.merge(rhs) { _, rhsValues in rhsValues }
    }
}

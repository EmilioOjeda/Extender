public extension Collection {
    /// A boolean value indicating whether the collection is not empty.
    ///
    /// When you need to check whether your collection is not empty, use the `isNotEmpty` property instead of checking that the count property is equal to zero.
    /// For collections that don’t conform to `RandomAccessCollection`, accessing the count property iterates through the elements of the collection.
    ///
    /// ```swift
    /// let firstName = "John"
    /// if firstName.isNotEmpty {
    ///     print("The first name is set as expected")
    /// }
    /// // Print "The first name is set as expected""
    /// ```
    var isNotEmpty: Bool {
        !isEmpty
    }
}

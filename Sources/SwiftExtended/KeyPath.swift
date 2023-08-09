/// It returns a function that receives a value and allows applying a negation to the value held in the resulting boolean value of the key path.
///
/// Assuming you have a list of posts with either published or unpublished status, you want to filter the unpublished ones. Then, you could do the following:
///
/// ```swift
/// // unpublished posts
/// let unpublished = posts
///     .filter(!\.isPublished)
/// ```
///
/// - Parameters:
///   - keyPath: The key path to the resulting boolean value where the negation is applied.
/// - Returns: A function from a value to a bool.
public prefix func ! <Element>(
    keyPath: KeyPath<Element, Bool>
) -> (Element) -> Bool {
    { element in
        !element[keyPath: keyPath]
    }
}

/// It allows for comparing equality among the resulting value of the key path on the left-hand side against the concrete value on the right-hand side.
///
/// Assuming you have to find a post with a given `id`. Then, you could do the following:
///
/// ```swift
/// // find post by id
/// let post = posts
///     .first(where: \.id == id)
/// ```
///
/// - Parameters:
///   - keyPath: A key path from a specific root type to a specific resulting value type.
///   - value: The value to compare against the resulting value of the key path.
/// - Returns: A function returning the resulting boolean of the comparison.
public func == <Element, Value: Equatable>(
    keyPath: KeyPath<Element, Value>,
    value: Value
) -> (Element) -> Bool {
    { element in
        element[keyPath: keyPath] == value
    }
}

/// It allows for comparing non-equality among the resulting value of the key path on the left-hand side against the concrete value on the right-hand side.
///
/// Assuming you have to get a list of posts by removing those with the given `id`. Then, you could do the following:
///
/// ```swift
/// // removing post with id
/// let filtered = posts
///     .filter(\.id != id)
/// ```
///
/// - Parameters:
///   - keyPath: A key path from a specific root type to a specific resulting value type.
///   - value: The value to compare against the resulting value of the key path.
/// - Returns: A function returning the resulting boolean of the comparison.
public func != <Element, Value: Equatable>(
    keyPath: KeyPath<Element, Value>,
    value: Value
) -> (Element) -> Bool {
    { element in
        element[keyPath: keyPath] != value
    }
}

/// It allows for comparing whether the value in the key path is greater than the given value.
/// - Parameters:
///   - keyPath: A key path from a specific root type to a specific resulting value type.
///   - value: The value to compare against the resulting value of the key path.
/// - Returns: A function returning the resulting boolean of the comparison.
public func > <Element, Value: Comparable>(
    keyPath: KeyPath<Element, Value>,
    value: Value
) -> (Element) -> Bool {
    { element in
        element[keyPath: keyPath] > value
    }
}

/// It allows for comparing whether the value in the key path is greater than or equal to the given value.
/// - Parameters:
///   - keyPath: A key path from a specific root type to a specific resulting value type.
///   - value: The value to compare against the resulting value of the key path.
/// - Returns: A function returning the resulting boolean of the comparison.
public func >= <Element, Value: Comparable>(
    keyPath: KeyPath<Element, Value>,
    value: Value
) -> (Element) -> Bool {
    { element in
        element[keyPath: keyPath] >= value
    }
}

/// It allows for comparing whether the value in the key path is less than the given value.
/// - Parameters:
///   - keyPath: A key path from a specific root type to a specific resulting value type.
///   - value: The value to compare against the resulting value of the key path.
/// - Returns: A function returning the resulting boolean of the comparison.
public func < <Element, Value: Comparable>(
    keyPath: KeyPath<Element, Value>,
    value: Value
) -> (Element) -> Bool {
    { element in
        element[keyPath: keyPath] < value
    }
}

/// It allows for comparing whether the value in the key path is less than or equal to the given value.
/// - Parameters:
///   - keyPath: A key path from a specific root type to a specific resulting value type.
///   - value: The value to compare against the resulting value of the key path.
/// - Returns: A function returning the resulting boolean of the comparison.
public func <= <Element, Value: Comparable>(
    keyPath: KeyPath<Element, Value>,
    value: Value
) -> (Element) -> Bool {
    { element in
        element[keyPath: keyPath] <= value
    }
}

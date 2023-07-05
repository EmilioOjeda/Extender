import Foundation

/// An object that allows encoding values as dictionaries.
open class DictionaryEncoder {
    let encoder: JSONEncoder

    /// Initializes the dictionary encoder with a JSON encoder instance.
    /// - Parameter encoder: The JSON encoder instance to use for encoding values into dictionaries.
    public init(_ encoder: @autoclosure () -> JSONEncoder = JSONEncoder()) {
        self.encoder = encoder()
    }

    /// Returns a Dictionary-encoded representation of the supplied value.
    /// - Parameters:
    ///   - value: The value to encode as `Dictionary`.
    /// - Returns: The encoded `Dictionary` value.
    open func encode<Item, Key, Value>(
        _ value: Item
    ) throws -> [Key: Value]
    where Item: Encodable, Key: Hashable {
        let data = try encoder.encode(value)
        let json = try JSONSerialization.jsonObject(with: data)

        guard let dictionary = json as? [Key: Value] else {
            throw NSError(
                domain: "\(type(of: self))",
                code: NSCoderInvalidValueError,
                userInfo: [
                    NSLocalizedDescriptionKey: "Failed encoding from '\(type(of: value))' to 'Dictionary<\(Key.self), \(Value.self)>'"
                ]
            )
        }
        return dictionary
    }
}

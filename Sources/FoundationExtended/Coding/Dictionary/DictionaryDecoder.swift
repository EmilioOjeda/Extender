import Foundation

/// An object that allows decoding values from dictionaries.
open class DictionaryDecoder {
    let decoder: JSONDecoder

    /// Initializes the dictionary decoder with a JSON decoder instance.
    /// - Parameter decoder: The JSON decoder instance to use for decoding dictionary values.
    public init(_ decoder: @autoclosure () -> JSONDecoder = JSONDecoder()) {
        self.decoder = decoder()
    }

    /// Returns a value of the type specified, decoded from a `Dictionary` value.
    /// - Parameters:
    ///   - type: The type of the value to decode from the supplied `Dictionary` value.
    ///   - dictionary: The `Dictionary` value to decode.
    /// - Returns: A value of the specified type, if the decoder can parse the data.
    open func decode<Item, Key, Value>(
        _ type: Item.Type,
        from dictionary: [Key: Value]
    ) throws -> Item
    where Item: Decodable, Key: Hashable {
        let data = try JSONSerialization.data(withJSONObject: dictionary)
        return try decoder.decode(type, from: data)
    }
}

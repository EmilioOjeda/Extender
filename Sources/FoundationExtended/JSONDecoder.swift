import Foundation
import SwiftExtended

public extension JSONDecoder.KeyDecodingStrategy {
    /// A key decoding strategy that converts `kebab-case` keys to `camelCase` keys.
    static var convertFromKebabCase: JSONDecoder.KeyDecodingStrategy {
        .custom { codingPath in
            let codingKey = codingPath[codingPath.endIndex.advanced(by: -1)]

            guard codingKey.intValue == nil else {
                return codingKey
            }

            let components = codingKey
                .stringValue
                .components(separatedBy: "-")

            let head = components
                .prefix(1)
                .map(\.localizedLowercase)
            let tail = components
                .dropFirst()
                .map(\.capitalized)

            return type(of: codingKey)
                .init(
                    stringValue: (head + tail)
                        .joined()
                ).or(codingKey)
        }
    }
}

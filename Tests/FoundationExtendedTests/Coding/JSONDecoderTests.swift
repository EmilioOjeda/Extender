import FoundationExtended
import XCTest

final class JSONDecoderTests: XCTestCase {
    func testKeyDecodingStrategyConvertFromKebabCase() throws {
        // given
        let kebabCaseJSON = """
        {
            "string-key": "string value",
            "integer-key": 0,
            "array-of-strings-key": [
                "first",
                "second",
                "third"
            ]
        }
        """

        struct ConvertedFromKebabCase: Decodable {
            let stringKey: String
            let integerKey: Int
            let arrayOfStringsKey: [String]
        }

        let kebabCaseDecoder: JSONDecoder = { decoder in
            decoder.keyDecodingStrategy = .convertFromKebabCase
            return decoder
        }(JSONDecoder())

        // when
        let data = try XCTUnwrap(kebabCaseJSON.data(using: .utf8))

        // then
        _ = try kebabCaseDecoder.decode(ConvertedFromKebabCase.self, from: data)
    }

    func testKeyDecodingStrategyConvertFromPascalCase() throws {
        // given
        let pascalCaseJSON = """
        {
            "StringKey": "string value",
            "IntegerKey": 0,
            "ArrayOfStringsKey": [
                "first",
                "second",
                "third"
            ]
        }
        """

        struct ConvertedFromPascalCase: Decodable {
            let stringKey: String
            let integerKey: Int
            let arrayOfStringsKey: [String]
        }

        let pascalCaseDecoder: JSONDecoder = { decoder in
            decoder.keyDecodingStrategy = .convertFromPascalCase
            return decoder
        }(JSONDecoder())

        // when
        let data = try XCTUnwrap(pascalCaseJSON.data(using: .utf8))

        // then
        _ = try pascalCaseDecoder.decode(ConvertedFromPascalCase.self, from: data)
    }
}

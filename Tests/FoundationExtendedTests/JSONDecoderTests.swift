//
//  JSONDecoderTests.swift
//  
//
//  Created by Emilio Ojeda on 04/01/23.
//

import XCTest
import FoundationExtended

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
}

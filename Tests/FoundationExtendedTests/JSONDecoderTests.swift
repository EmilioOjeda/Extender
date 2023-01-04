//
//  JSONDecoderTests.swift
//  
//
//  Created by Emilio Ojeda on 04/01/23.
//

import XCTest
import FoundationExtended

final class JSONDecoderTests: XCTestCase {
    func testKeyDecodingStrategyConvertFromPascalCase() throws {
        // given
        let pascalCaseJSON = """
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

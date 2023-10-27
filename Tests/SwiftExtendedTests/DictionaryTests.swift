@testable import SwiftExtended
import XCTest

final class DictionaryTests: XCTestCase {
    func testMergeOperator() throws {
        // given
        var dictionaryOne: [String: Any] = [
            "stringValue": name,
            "integerValue": 0
        ]
        let dictionaryTwo: [String: Any] = [
            "stringValue": name,
            "integerValue": 2
        ]
        // when
        dictionaryOne += dictionaryTwo
        // then
        XCTAssertEqual(name, try XCTUnwrap(dictionaryOne["stringValue"] as? String))
        XCTAssertEqual(2, try XCTUnwrap(dictionaryOne["integerValue"] as? Int))
    }

    func testMergingOperator() {
        // given
        let dictionaryOne: [String: Any] = [
            "stringValue": name,
            "integerValue": 0
        ]
        let dictionaryTwo: [String: Any] = [
            "stringValue": name,
            "integerValue": 2
        ]
        // when
        let dictionaryThree = dictionaryOne + dictionaryTwo
        // then
        XCTAssertEqual(name, try XCTUnwrap(dictionaryThree["stringValue"] as? String))
        XCTAssertEqual(2, try XCTUnwrap(dictionaryThree["integerValue"] as? Int))
    }
}

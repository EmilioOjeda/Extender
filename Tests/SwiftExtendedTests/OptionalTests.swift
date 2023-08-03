import XCTest
import SwiftExtended

final class OptionalTests: XCTestCase {
    func testNonOptionalValue() {
        // given
        let wrapped = 0
        let fallback = 1
        // when
        let value = Optional<Int>
            .some(wrapped)
            .or(fallback)
        // then
        XCTAssertEqual(0, value)
        XCTAssertNotEqual(wrapped, fallback)
    }

    func testNonOptionalFallback() {
        // given
        let fallback = Int.random(in: 0...9)
        // when
        let value = Optional<Int>
            .none
            .or(fallback)
        // then
        XCTAssertEqual(fallback, value)
    }

    func testOptionalValue() {
        // given
        let wrapped = 0
        let fallback = Optional.some(1)
        // when
        let value = Optional<Int>
            .some(wrapped)
            .or(fallback)
        // then
        XCTAssertEqual(0, value)
        XCTAssertNotEqual(wrapped, fallback)
    }

    func testOptionalFallback() {
        // given
        let fallback: Int? = Int.random(in: 0...9)
        // when
        let value = Optional<Int>
            .none
            .or(fallback)
        // then
        XCTAssertEqual(fallback, value)
    }

    func testIsNil() {
        // given
        let nilValue = Optional<String>.none
        // then
        XCTAssertNil(nilValue)
        XCTAssertTrue(nilValue.isNil)
    }

    func testIsNotNil() {
        // given
        let someValue = Optional<String>.some(name)
        // then
        XCTAssertNotNil(someValue)
        XCTAssertTrue(someValue.isNotNil)
    }
}

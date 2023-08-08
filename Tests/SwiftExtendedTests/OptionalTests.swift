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

    func testFilter() {
        // given
        let numberOne = 1
        let numberTwo = 2
        let optionalNumberOne = Optional.some(numberOne)
        // then
        XCTAssertLessThan(numberOne, numberTwo)
        XCTAssertNil(
            optionalNumberOne
                .filter { $0 > numberTwo }
        )
        XCTAssertEqual(
            numberOne,
            optionalNumberOne
                .filter { $0 < numberTwo }
        )
    }

    func testFilterWhereThen() {
        // given
        let numberOne = 1
        let numberTwo = 2
        let optionalNumberOne = Optional.some(numberOne)
        // then
        XCTAssertLessThan(numberOne, numberTwo)
        XCTAssertNil(
            optionalNumberOne
                .filter(where: { $0 > numberTwo }, then: String.init)
        )
        XCTAssertEqual(
           "\(numberOne)",
            optionalNumberOne
                .filter(where: { $0 < numberTwo }, then: String.init)
        )
    }
}

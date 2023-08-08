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
                .filter(\.self > numberTwo)
        )
        XCTAssertEqual(
            numberOne,
            optionalNumberOne
                .filter(\.self < numberTwo)
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
                .filter(where: \.self > numberTwo, then: String.init)
        )
        XCTAssertEqual(
           "\(numberOne)",
            optionalNumberOne
                .filter(where: \.self < numberTwo, then: String.init)
        )
    }

    func testContains() {
        // given
        let letterA = "a"
        let letterD = "d"
        let lettersABC: [String] = ["a", "b", "c"]

        // then
        XCTAssertTrue(
            Optional<String>
                .some(letterA)
                .contains(letterA)
        )
        XCTAssertFalse(
            Optional<String>
                .some(letterA)
                .contains(letterD)
        )
        XCTAssertFalse(
            Optional<String>
                .none
                .contains(letterA)
        )

        // also
        XCTAssertTrue(
            Optional<[String]>
                .some(lettersABC)
                .contains(letterA)
        )
        XCTAssertFalse(
            Optional<[String]>
                .some(lettersABC)
                .contains(letterD)
        )
        XCTAssertFalse(
            Optional<[String]>
                .none
                .contains(letterA)
        )
    }
}

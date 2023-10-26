import SwiftExtended
import XCTest

final class OptionalTests: XCTestCase {
    func testNonOptionalValue() {
        // given
        let wrapped = 0
        let fallback = 1
        // when
        let value = Int?
            .some(wrapped)
            .or(fallback)
        // then
        XCTAssertEqual(0, value)
        XCTAssertNotEqual(wrapped, fallback)
    }

    func testNonOptionalFallback() {
        // given
        let fallback = Int.random(in: 0 ... 9)
        // when
        let value = Int?
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
        let value = Int?
            .some(wrapped)
            .or(fallback)
        // then
        XCTAssertEqual(0, value)
        XCTAssertNotEqual(wrapped, fallback)
    }

    func testOptionalFallback() {
        // given
        let fallback: Int? = Int.random(in: 0 ... 9)
        // when
        let value = Int?
            .none
            .or(fallback)
        // then
        XCTAssertEqual(fallback, value)
    }

    func testNoThrowsWhenGettingWrappedValue() throws {
        struct DummyError: Swift.Error {}
        // given
        let value = name
        let wrappedValue = Optional.some(value)
        // when
        let unwrappedValue = try wrappedValue.or(throw: DummyError())
        // then
        XCTAssertEqual(unwrappedValue, value)
    }

    func testThrowsErrorWhenGettingWrappedValue() throws {
        struct FakeError: Swift.Error {}
        // given
        let nilWrappedValue = String?.none
        // then
        XCTAssertThrowsError(try nilWrappedValue.or(throw: FakeError()))
    }

    func testIsNil() {
        // given
        let nilValue = String?.none
        // then
        XCTAssertNil(nilValue)
        XCTAssertTrue(nilValue.isNil)
    }

    func testIsNotNil() {
        // given
        let someValue = Optional.some(name)
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
            String?
                .some(letterA)
                .contains(letterA)
        )
        XCTAssertFalse(
            String?
                .some(letterA)
                .contains(letterD)
        )
        XCTAssertFalse(
            String?
                .none
                .contains(letterA)
        )

        // also
        XCTAssertTrue(
            [String]?
                .some(lettersABC)
                .contains(letterA)
        )
        XCTAssertFalse(
            [String]?
                .some(lettersABC)
                .contains(letterD)
        )
        XCTAssertFalse(
            [String]?
                .none
                .contains(letterA)
        )
    }

    func testZip() throws {
        // given
        let leftHandSideValue = 1
        let rightHandSideValue = "A"

        // when
        let unzippedPair = try XCTUnwrap(
            Optional
                .some(leftHandSideValue)
                .zip(with: Optional.some(rightHandSideValue))
        )

        // then
        XCTAssertEqual(leftHandSideValue, unzippedPair.0)
        XCTAssertEqual(rightHandSideValue, unzippedPair.1)

        // and when
        let nilDueToLeftHandSide = Int?
            .none
            .zip(with: Optional.some(rightHandSideValue))
        let nilDueToRightHandSide = Optional
            .some(leftHandSideValue)
            .zip(with: String?.none)

        // then
        XCTAssertNil(nilDueToLeftHandSide)
        XCTAssertNil(nilDueToRightHandSide)
    }

    func testFirstWhere() {
        // given
        let optionalABC: [String]? = ["A", "B", "C"]

        // then
        XCTAssertNil(optionalABC.first(where: \.self == "D"))
        XCTAssertNotNil(optionalABC.first(where: \.self == "A"))
        XCTAssertNil(
            [String]?
                .none
                .first(where: \.self == "A")
        )
    }
}

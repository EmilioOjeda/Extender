import XCTest
@testable import SwiftExtended

private protocol Boolean: Hashable {
    var boolean: Bool { get }
}

private struct True: Boolean {
    let boolean: Bool = true
}

private struct False: Boolean {
    let boolean: Bool = false
}

final class KeyPathTests: XCTestCase {
    private let booleans: [any Boolean] = [True(), False()]
    private let numberOneOptional: Int? = 1

    func testNegationOnKeyPathsAsPredicates() throws {
        XCTAssertEqual(
            False(),
            try XCTUnwrap(
                booleans
                    .filter(!\.boolean)
                    .first as? False
            )
        )
    }

    func testEqualsToAndDifferentThan() throws {
        XCTAssertEqual(
            True(),
            try XCTUnwrap(
                booleans
                    .filter(\.boolean == true)
                    .first as? True
            )
        )

        XCTAssertEqual(
            False(),
            try XCTUnwrap(
                booleans
                    .filter(\.boolean != true)
                    .first as? False
            )
        )
    }

    func testGreaterThanAndGreaterThanOrEqual() {
        XCTAssertNotNil(
            numberOneOptional
                .filter(\.self > 0)
        )

        XCTAssertNotNil(
            numberOneOptional
                .filter(\.self >= 1)
        )
    }

    func testLessThanAndLessThanOrEqual() {
        XCTAssertNotNil(
            numberOneOptional
                .filter(\.self < 2)
        )

        XCTAssertNotNil(
            numberOneOptional
                .filter(\.self <= 1)
        )
    }
}

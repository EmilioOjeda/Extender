@testable import SwiftExtended
import XCTest

final class CollectionTests: XCTestCase {
    func testIsNotEmpty() {
        // given
        let emptyCollection = [String]()
        let nonEmptyCollection = [name]
        // then
        XCTAssertFalse(emptyCollection.isNotEmpty)
        XCTAssertTrue(nonEmptyCollection.isNotEmpty)
    }
}

//
//  CollectionTests.swift
//  
//
//  Created by Emilio Ojeda on 02/08/23.
//

import XCTest
@testable import SwiftExtended

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

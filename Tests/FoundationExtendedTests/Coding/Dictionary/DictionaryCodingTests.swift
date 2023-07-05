import XCTest
@testable import FoundationExtended

final class DictionaryCodingTests: XCTestCase {
    private struct Product: Codable, Equatable {
        let id: UUID
        let name: String
        let price: Double
    }

    func testEncodingAndDecoding() throws {
        // given
        let encoder = DictionaryEncoder()
        let decoder = DictionaryDecoder()
        let product = Product(id: UUID(), name: "Product Name", price: 69.50)

        // when
        let dictionary: [String: Any] = try encoder.encode(product)
        // and
        let decodedProduct = try decoder.decode(Product.self, from: dictionary)

        // then
        XCTAssertEqual(product, decodedProduct)
    }
}

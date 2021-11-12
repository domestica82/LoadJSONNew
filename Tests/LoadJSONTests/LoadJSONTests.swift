import XCTest
@testable import LoadJSON

final class LoadJSONTests: XCTestCase {
    func testExample() throws {
        let item = GeneralContentsModel(id: 2, name: "name", tag: "tag", fontStyle: .body, fontDesign: .default, markDown: false, isNeedBold: false, isNeedPadding: false, padding: [0, 20], scale: 2)
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(item.name, "name")
    }
}

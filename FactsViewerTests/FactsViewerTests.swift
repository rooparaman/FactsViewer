// Created by Roopa Raman on 6/2/21
// 
// Using Swift 5.0

import XCTest
@testable import FactsViewer

class FactsViewerTests: XCTestCase {
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  //Test the Model
  func testFactMapping() throws {
    let fact = FactsModel(country: "Sample",
                          facts: [FactItem(title: "sample title",
                                           desc: "sample description",
                                           imageUrl: "sample url")])
    XCTAssertEqual(fact.country, "Sample")
    XCTAssertEqual(fact.facts.first?.title, "sample title")
  }
  
 
  
}

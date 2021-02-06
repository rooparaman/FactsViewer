// Created by Roopa Raman on 6/2/21
// 
// Using Swift 5.0

import XCTest
@testable import FactsViewer

class FactsViewerTests: XCTestCase {
  
  private var fact : FactsModel?
  private var dataMapper = FactsDataMapper()
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testDataMapper() throws {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    let bundle = Bundle(for: type(of: self))
    guard let bundlePath = bundle.url(forResource: "mockData", withExtension: "json") else {
      XCTFail("Missing file: mockData.json")
      return
    }
    do{
      let jsonData = try Data(contentsOf: bundlePath)
      if let fact = dataMapper.parseJson(factsData: jsonData){
        XCTAssertEqual(fact.country, "About Canada")
        XCTAssertEqual(fact.facts.first?.title, "Beavers")
        XCTAssertEqual(fact.facts.count, 13)
      }
    }catch {
      XCTFail("Could not parse")
    }
  }
  
}

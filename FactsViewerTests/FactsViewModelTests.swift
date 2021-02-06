// Created by Roopa Raman on 6/2/21
// 
// Using Swift 5.0

import XCTest
@testable import FactsViewer

class FactsViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    //Test View model mapping
    func testFactViewModel() throws {
      var boundTitle = ""
      let viewModel = FactsViewModel()
      viewModel.title.bind { (title) in
        boundTitle = title
      }
      viewModel.title.value = "Sample Title"
      XCTAssertEqual(boundTitle, "Sample Title")
    }

}

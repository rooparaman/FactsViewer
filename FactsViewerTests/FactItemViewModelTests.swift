// Created by Roopa Raman on 6/2/21
// 
// Using Swift 5.0

import XCTest
@testable import FactsViewer

class FactItemViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

  func testFactItemViewModel() throws {
    let expectation = self.expectation(
        description: "Setting Image")
    let viewModel = FactItemViewModel(title: "sample", description: "sample", imageRef: "placeholder")
    viewModel.image.bind { (image) in
      if image == UIImage(named: "placeholder") {
        expectation.fulfill()
      }
    }

    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
      viewModel.image.value = UIImage(named: viewModel.factImageUrl)!
    }
    waitForExpectations(timeout: 8, handler: nil)
  }

}

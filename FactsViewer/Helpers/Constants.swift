// Created by Roopa Raman on 6/2/21
// 
// Using Swift 5.0

import Foundation
struct Constants {
  static let getFactsUrl = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
  static let placeHolderImage = "placeholder"
  static let factCellIdentifier = "factCell"
  enum accessibilityIdentifiers : String {
    case factItemTitleLabel = "factTitleLabel"
    case factItemDescLabel = "factDescLabel"
    case factItemImage = "factItemImage"
  }
}

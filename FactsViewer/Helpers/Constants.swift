// Created by Roopa Raman on 6/2/21
// 
// Using Swift 5.0

import Foundation
struct Constants {
  static let getFactsUrl = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
  static let placeHolderImage = "placeholder"
  static let factCellIdentifier = "factCell"
  static let dataMappingError = "Data is corrupt. Please contact admin"
  static let networkError = "Network error has occured. Please check your connection  and try again"
  static let unknownError = "Unknown Error has occured. Please try after sometime"
  static let unauthorizedError = "Unauthorized"
  static let accessError = "You do not have the access rights. Contact admin"
  static let serverError = "An unexpected server error occurred."
  enum accessibilityIdentifiers : String {
    case factItemTitleLabel = "factTitleLabel"
    case factItemDescLabel = "factDescLabel"
    case factItemImage = "factItemImage"
  }
}

// Created by Roopa Raman on 6/2/21
// Data model conforming to codable to map the api json data
// Using Swift 5.0

import Foundation

struct FactsDataModel: Codable {
    let title: String
    let rows: [Info]
}
struct Info: Codable {
  let title: String?
  let description: String?
  let imageHref: String?
}

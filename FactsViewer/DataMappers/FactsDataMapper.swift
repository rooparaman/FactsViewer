// Created by Roopa Raman on 6/2/21
// 
// Using Swift 5.0

import Foundation
struct FactsDataMapper {
  func parseJson(factsData:Data) -> FactsModel? {
    let decoder = JSONDecoder.init()
    do {
      let decodedData = try decoder.decode(FactsDataModel.self, from: factsData)
      var facts: [FactItem] = []
      for data in decodedData.rows {
        let title = data.title
        let description = data.description
        let image = data.imageHref
        if(!(title == nil && description == nil && image == nil)){
          facts.append(FactItem(title: title ?? "", desc: description ?? "", imageUrl: image ?? ""))
        }
      }
      return FactsModel(country: decodedData.title, facts: facts)
    } catch {
      print(error)
      return nil
    }
  }
}
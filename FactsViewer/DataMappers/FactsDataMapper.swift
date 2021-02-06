// Created by Roopa Raman on 6/2/21
// 
// Using Swift 5.0

import Foundation
struct FactsDataMapper {
  func parseJson(factsData:Data) -> FactsModel? {
    let decoder = JSONDecoder.init()
    do {
      //This is done this way as the json data provided seems to have diacritic in it. And it is not encoded to UTF-8 from server. So, converted it to an ascii string and then parsed using utf-8
      let strData = String(data: factsData, encoding: .ascii)?.data(using: .utf8)
      let decodedData = try decoder.decode(FactsDataModel.self, from: strData!)
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
      return nil
    }
  }
}

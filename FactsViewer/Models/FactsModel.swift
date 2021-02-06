// Created by Roopa Raman on 6/2/21
// 
// Using Swift 5.0

import Foundation

struct Facts {
  let country: String
  let facts : [FactItem]
}

struct FactItem {
  let title: String
  let description: String
  let imageUrl: String
  
  init(title:String,desc:String,imageUrl:String) {
    self.title = title
    self.description = desc
    self.imageUrl = imageUrl
  }
}

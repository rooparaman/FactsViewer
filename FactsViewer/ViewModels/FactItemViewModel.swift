// Created by Roopa Raman on 6/2/21
// 
// Using Swift 5.0

import UIKit

class FactItemViewModel {
  let factImageUrl: String
  let factTitle: String
  let factDescription: String
  let image: Box<UIImage> = Box(UIImage(named: Constants.placeHolderImage)!)
  
  init(title:String,description:String,imageRef:String) {
    self.factTitle = title
    self.factDescription = description
    self.factImageUrl = imageRef
  }
  
}

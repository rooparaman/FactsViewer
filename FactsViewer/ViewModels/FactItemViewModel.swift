// Created by Roopa Raman on 6/2/21
// 
// Using Swift 5.0

import UIKit
let imageCache = NSCache<AnyObject, AnyObject>()

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
  
  //To load the fact image from the cache or to get from network
  func loadThumbnail(urlSting: String){
    let service = FactsService()
    if let _ = URL(string: urlSting) {
      if let imageFromCache = imageCache.object(forKey: urlSting as AnyObject) {
        self.image.value = imageFromCache as! UIImage
      }
      
      service.downloadImage(url: urlSting) {(data) in
        guard let imageFromUrl = UIImage(data: data) else { return }
        imageCache.setObject(imageFromUrl, forKey: urlSting as AnyObject)
        self.image.value = imageFromUrl
      } failureCompletion: {(_) in
        self.image.value = UIImage(named: Constants.placeHolderImage)!
      }
    }
    
  }
  
}

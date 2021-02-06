// Created by Roopa Raman on 6/2/21
// 
// Using Swift 5.0

import Foundation

class FactsViewModel {
  let title = Box("")
  let facts : Box<[FactItem]> = Box([])
  let factsService = FactsService()
  let fetchFailure = Box(false)
  let errorReason = Box("")
  
  //To fetch all the facts from server
  func fetchAllFacts(){
    self.factsService.getFacts {[weak self] (countryFacts) in
      guard let self = self else { return }
      self.facts.value = countryFacts.facts
      self.title.value = countryFacts.country
    } failureCompletion: {[weak self] (error) in
      guard let self = self else { return }
      self.fetchFailure.value = true
      self.errorReason.value = error.description
    }
  }
}

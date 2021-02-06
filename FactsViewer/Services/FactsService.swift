// Created by Roopa Raman on 6/2/21
// Service for the Facts Module
// Using Swift 5.0

import Foundation

struct FactsService {
  
  private let apiService = APIService()
  private let dataMapper = FactsDataMapper()
  
  func getFacts(successCompletion: @escaping(FactsModel)-> (), failureCompletion: @escaping(CustomError)-> ()){
    apiService.getData(with: Constants.getFactsUrl) { (result) in
      switch result {
      case .failure(let error):
        failureCompletion(error)
      case .success(let data):
        if let info = dataMapper.parseJson(factsData: data) {
          successCompletion(info)
        }else {
          failureCompletion(CustomError.mappingError)
        }
      }
    }
  }
}

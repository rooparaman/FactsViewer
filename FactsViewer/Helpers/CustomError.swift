// Created by Roopa Raman on 6/2/21
// Custom Error to Handle the Network Errors
// Using Swift 5.0

import Foundation

enum CustomError: Error {
  //Throw in service transport error
  case transportError(error: Error)
  
  // Throw in all other server errors
  case serverSideError(code: Int)
  
  //Throw in json mapping error
  case mappingError
  
  //All other cases
  case unknowError
}

//MARK: - CustomStringConvertible
extension CustomError : CustomStringConvertible {
  public var description: String {
    switch self {
    case .serverSideError(let code):
      return descriptionForCode(code: code)
    case .mappingError:
      return Constants.dataMappingError
    case .transportError(_):
      return Constants.networkError
    case .unknowError:
      return Constants.unknownError
    }
  }
  
  //To get the description based on the status code
  private func descriptionForCode(code: Int) -> String{
    switch code {
    case 401:
      return Constants.unauthorizedError
    case 403:
      return Constants.accessError
    case 500...599:
      return Constants.serverError
    default:
      return Constants.serverError
    }
  }
}

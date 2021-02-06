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
}

//MARK: - CustomStringConvertible
extension CustomError : CustomStringConvertible {
  public var description: String {
    switch self {
    case .serverSideError(let code):
      return descriptionForCode(code: code)
    case .mappingError:
      return "Data is corrupt"
    case .transportError(_):
      return "Network error"
    }
  }
  
  //To get the description based on the status code
  private func descriptionForCode(code: Int) -> String{
    switch code {
    case 401:
      return "You need to login"
    case 403:
      return "You do not have the access rights. Contact admin"
    case 500...599:
      return "An unexpected server error occurred."
    default:
      return "An unexpected error occurred."
    }
  }
}

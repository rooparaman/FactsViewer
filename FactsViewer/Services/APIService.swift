// Created by Roopa Raman on 6/2/21
// Main Service for HTTP requests
// Using Swift 5.0

import Foundation

struct APIService {
  //To fetch data from Url
  func getData(with url:String, completionHandler : @escaping(Result<Data,CustomError>)->Void){
    if let url = URL(string: url) {
      let session = URLSession.shared
      let request = URLRequest(url: url)
      let task = session.dataTask(with: request) { (data, response, error) in
        if let error = error {
          completionHandler(.failure(CustomError.transportError(error: error)))
        }else {
          if let response = response as? HTTPURLResponse {
            let status = response.statusCode
            guard (200...299).contains(status) else {
              completionHandler(.failure(CustomError.serverSideError(code: status)))
              return
            }
            if let validData = data {
              completionHandler(.success(validData))
            }
          }else{
            completionHandler(.failure(CustomError.unknowError))
          }
        }
      }
      task.resume()
    }
  }
}

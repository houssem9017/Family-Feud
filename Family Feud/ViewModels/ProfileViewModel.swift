import Foundation
import Alamofire

class ProfileViewModel: ObservableObject {
    var profileRequest: ProfileResponse?
    
    func getonce(username: String, completion: @escaping (Result<ProfileResponse, Error>) -> ()) -> DataRequest {

        guard !username.isEmpty else {
            let error = NSError(domain: "Empty username", code: -1, userInfo: nil)
            completion(.failure(error))
            return AF.request(URL(string: "")!)
        }

        let urlString = "http://172.17.1.226:9001/user/\(username)"

        guard let url = URL(string: urlString) else {
            let error = NSError(domain: "Invalid URL", code: -1, userInfo: nil)
            completion(.failure(error))
            return AF.request(URL(string: "aa")!)	
        }

        return AF.request(url)
            .validate(statusCode: 200..<500)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success(let data):
                    do {
                        let getOnceResponse = try JSONDecoder().decode(ProfileResponse.self, from: data)
                        completion(.success(getOnceResponse))
                        print(getOnceResponse)
                    } catch {
                        print(error)
                        completion(.failure(error))
                    }
                case .failure(let error):
                    print(error)
                    completion(.failure(error))
                }
            }
    }



    
    func update(username: String, password: String, email: String, completion: @escaping (Result<Void, Error>) -> ()) -> DataRequest {
      let url = "172.17.1.226:9001/user/update/\(username)"
      let parameters = ["password": password, "email": email]
      let headers: HTTPHeaders = ["Content-Type": "application/json"]
      return AF.request(url, method: .put, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
        .validate(statusCode: 200..<500)
        .response { response in
          switch response.result {
          case .success:
            completion(.success(()))
          case .failure(let error):
            completion(.failure(error))
          }
      }
    }

}







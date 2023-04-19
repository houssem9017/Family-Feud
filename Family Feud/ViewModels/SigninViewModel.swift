//
//  SigninViewModel.swift
//  Family Feud
//
//  Created by Rayen ben slimen on 16/4/2023.
//

import Foundation
import Alamofire

class SigninViewModel : ObservableObject{
    var signinRequest : SigninRequest?
    
    @Published var username = ""
    @Published var password = ""
    
    @Published var usernameError : String? = nil
    @Published var passwordError : String? = nil
    
    var isFormValid: Bool{
        return usernameError == nil && passwordError == nil
    }
    
    func validateusername(){
        if username.isEmpty{
            usernameError = "Email is required"
        }
        else {
            usernameError = nil
        }
    }
    
    func validatePassword(){
        if password.isEmpty{
            passwordError = "Password is required"
        }
        else if password.count < 8 {
            passwordError = "Password must be at least 8 characters"
        } else{
            passwordError = nil
        }
    }
    
    func signin(request: SigninRequest, completion: @escaping (Result<MessageResponse, Error>) -> ()) -> DataRequest {
        let url = "http://172.17.1.226:9001/user/login"
        do {
            let encodedRequest = try JSONEncoder().encode(request)
            var urlRequest = try URLRequest(url: url, method: .post)
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = encodedRequest
            return AF.request(urlRequest)
                .validate(statusCode: 200..<500)
                .validate(contentType: ["application/json"])
                .responseData { response in
                    switch response.result {
                        case .success(let data):
                            do {
                                let SigninResponse = try JSONDecoder().decode(MessageResponse.self, from: data)
                                completion(.success(SigninResponse))
                             
                            } catch {
                                print(error)
                                completion(.failure(error))
                            }
                        case .failure(let error):
                            print(error)
                            completion(.failure(error))
                    }
                }
        } catch {
            print(error)
            completion(.failure(error))
        }
        return AF.request(url)
    }
}

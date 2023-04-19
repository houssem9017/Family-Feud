//
//  SignupViewModel.swift
//  Family Feud
//
//  Created by Rayen ben slimen on 16/4/2023.
//

import Foundation
import Alamofire

class ForgetPasswordViewModel: ObservableObject{
    var ForgetPassword: ForgetPasswordRequest?
    
    @Published var email = ""
    
    @Published var emailError : String? = nil
    
    var isFormValid: Bool {
        return emailError == nil
    }
    
   
    
    func validateEmail() {
        //let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        //let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        if email.isEmpty {
            emailError = "Email is required"
        }
        //else if !emailPredicate.evaluate(with: email) {
           // emailError = "Email is invalid"
        //}
        else {
            emailError = nil
        }
    }
    
    func forgetpassword(request: ForgetPasswordRequest, completion: @escaping (Result<MessageResponse, Error>) -> ()) -> DataRequest {
        let url = "http://172.17.1.226:9001/user/forgetpassword"
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
                                
                                let forgetpassword = try JSONDecoder().decode(MessageResponse.self, from: data)
                                completion(.success(forgetpassword))
                                print(forgetpassword)
                            } catch {
                                print(data)
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

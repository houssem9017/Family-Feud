//
//  PartyViewModel.swift
//  Family Feud
//
//  Created by Rayen ben slimen on 18/4/2023.
//

import Foundation
import Alamofire

class PartyViewModel : ObservableObject{

    func addUserToParty(user: String, party: String, completion: @escaping (Result<Data?, Error>) -> Void) {
        let parameters: [String: Any] = ["user": user, "party": party]
        let url = "http://172.17.1.226:9001/party/adduserparty"
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseData { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
        func createparty(completion: @escaping (Result<PartyCreateResponse, Error>) -> ()) -> DataRequest {
            let url = "http://172.17.1.226:9001/party/create"
            do {
                var urlRequest = try URLRequest(url: url, method: .post)
                  return AF.request(urlRequest)
                    .validate(statusCode: 200..<500)
                    .validate(contentType: ["application/json"])
                    .responseData { response in
                        switch response.result {
                            case .success(let data):
                                do {
                                   
                                    let PartyCreateResponse = try JSONDecoder().decode(PartyCreateResponse.self, from: data)
                                    completion(.success(PartyCreateResponse))
                                 
                                    
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
    
    func getPartyMembers(id: String, completion: @escaping (Result<[String], Error>) -> ()) -> DataRequest {
        let urlString = "http://172.17.1.226:9001/party/getpartymembers/\(id)" // Append the id parameter to the URL
        
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
                        let partyMembersList = try JSONDecoder().decode([String].self, from: data)
                        completion(.success(partyMembersList))
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
    
    func leaveAllParties(forUser userId: String, completion: @escaping (Result<Void, Error>) -> Void) {
        guard let url = URL(string: "http://172.17.1.226:9001/party/leaveallparties/\(userId)") else {
            let error = NSError(domain: "Invalid URL", code: -1, userInfo: nil)
            completion(.failure(error))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"

        AF.request(request)
            .validate(statusCode: 200..<500)
            .responseData { response in
                switch response.result {
                case .success:
                    completion(.success(()))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func startParty(completion: @escaping (Result<Void, Error>) -> Void) {
        let defaults = UserDefaults.standard
        if let myId = defaults.string(forKey: "myId") {
            guard let url = URL(string: "http://172.17.1.226:9001/party/start_party/\(myId)") else {
                let error = NSError(domain: "Invalid URL", code: -1, userInfo: nil)
                completion(.failure(error))
                return
            }

            var request = URLRequest(url: url)
            request.httpMethod = "POST"

            AF.request(request)
                .validate(statusCode: 200..<500)
                .responseData { response in
                    switch response.result {
                    case .success:
                        completion(.success(()))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
        } else {
            let error = NSError(domain: "Party ID not found in UserDefaults", code: -1, userInfo: nil)
            completion(.failure(error))
        }
    }
    
        func getPartyStarted(completion: @escaping (Result<Int, Error>) -> Void) {
            let defaults = UserDefaults.standard
            if let myId = defaults.string(forKey: "myId"){
                guard let url = URL(string: "http://172.17.1.226:9001/party/getparty_started/\(myId)") else {
                    let error = NSError(domain: "Invalid URL", code: -1, userInfo: nil)
                    completion(.failure(error))
                    return
                }
                
                AF.request(url)
                    .validate(statusCode: 200..<500)
                    .responseString { response in
                        switch response.result {
                        case .success(let stringValue):
                            if let intValue = Int(stringValue) {
                                completion(.success(intValue))
                            } else {
                                let error = NSError(domain: "Response value is not an integer", code: -1, userInfo: nil)
                                completion(.failure(error))
                            }
                        case .failure(let error):
                            completion(.failure(error))
                        }
                    }
            }
        }


	

    
    }



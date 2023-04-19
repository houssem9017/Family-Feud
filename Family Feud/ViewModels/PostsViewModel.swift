//
//  PostsViewModel.swift
//  Family Feud
//
//  Created by darragi on 19/4/2023.
//

import Foundation
import Alamofire
class PostsViewModel: ObservableObject {
    @Published var posts: [user] = []
    func fetchPosts(completion: @escaping ([user]?) -> Void) {
        
        
        AF.request("http://172.17.1.226:9001/party/").responseDecodable(of: [user].self) { response in
            switch response.result {
            case .success(let posts):
                completion(posts)
                self.posts=posts
                print(posts)
            case .failure(let error):
                print(error.localizedDescription)
                completion(nil)
            }
        }
    }
    
}

//
//  User.swift
//  Family Feud
//
//  Created by Rayen ben slimen on 16/4/2023.
//

import Foundation


struct MessageResponse: Decodable {
    let message: String
}
struct ErrorResponse: Decodable {
    let error: String
}

struct SignupRequest: Encodable {
    let username: String
    let email: String
    let password: String
}

struct SigninRequest: Encodable {
    let username: String
    let password: String
}

struct ForgetPasswordRequest: Encodable {
    let email: String
}

struct ProfileResponse: Decodable {
    let email: String
    let rank : String
    let points : Int
    let password : String
    let username : String
}


struct ProfileRequest: Encodable {
    let email: String
    let password : String
    let username : String
}

struct PartyCreateResponse : Decodable{
    let myId : String
}

struct JointPartyRequest : Encodable{
    let user : String
    let party : String
}
struct user: Decodable {
    let username: String
}

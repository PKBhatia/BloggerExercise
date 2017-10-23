//
//  UsersModels.swift
//  BloggerExercise
//
//  Created by Bhatia, Parveen on 10/11/17.
//  Copyright (c) 2017 Bhatia, Parveen. All rights reserved.


import UIKit

enum Service
{
    struct Request
    {
        var requestURL: URL
        var httpMethod: String
    }
}


struct UserDetails: Codable {
    let id: Int
    let fullName: String
    let username: String
    let email: String
    let phone: String
    let website: String
    let userAddress: Address
    let company: Company
    
    enum CodingKeys: String, CodingKey {
        case fullName = "name"
        case id
        case username
        case email
        case phone
        case website
        case userAddress = "address"
        case company
    }
}

struct Company: Codable {
    let name: String
    let catchPhrase: String
    let bs: String
}

struct Address: Codable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: Coordinates
}


struct Coordinates: Codable {
    let lat: String
    let lng: String
}






//
//  PostModels.swift
//  BloggerExercise
//
//  Created by Bhatia, Parveen on 10/22/17.
//  Copyright (c) 2017 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

struct Post: Codable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}

//
//  UsersWorker.swift
//  BloggerExercise
//
//  Created by Bhatia, Parveen on 10/11/17.
//  Copyright (c) 2017 Bhatia, Parveen. All rights reserved.


import UIKit

class UsersWorker
{
    func loadUsers(with request: Service.Request, closure: @escaping ([UserDetails]?, Bool) -> Void)
    {
        var httpRequest = URLRequest(url: request.requestURL)
        httpRequest.httpMethod = request.httpMethod
        
        let task = URLSession.shared.dataTask(with: httpRequest) { data, response, error in
            
            guard let data = data, error == nil else
            {
                closure(nil, false)
                return
            }
            
            let usersList = try? JSONDecoder().decode(Array<UserDetails>.self, from: data)
            closure(usersList, true)
        }
        
        task.resume()
    }

}

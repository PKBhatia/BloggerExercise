//
//  PostWorker.swift
//  BloggerExercise
//
//  Created by Bhatia, Parveen on 10/22/17.
//  Copyright (c) 2017 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

class PostWorker
{
    func loadPosts(with request: Service.Request, closure: @escaping ([Post]?, Bool) -> Void)
    {
        var httpRequest = URLRequest(url: request.requestURL)
        httpRequest.httpMethod = request.httpMethod
        
        let task = URLSession.shared.dataTask(with: httpRequest) { data, response, error in
            
            guard let data = data, error == nil else
            {
                closure(nil, false)
                return
            }
            
            let postList = try? JSONDecoder().decode(Array<Post>.self, from: data)
            closure(postList, true)
        }
        
        task.resume()
    }
}

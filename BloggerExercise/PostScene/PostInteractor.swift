//
//  PostInteractor.swift
//  BloggerExercise
//
//  Created by Bhatia, Parveen on 10/22/17.
//  Copyright (c) 2017 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol PostBusinessLogic
{
    func loadPosts(request: Service.Request)
}

class PostInteractor: PostBusinessLogic
{
    var presenter: PostPresentationLogic?
    var worker: PostWorker?
    
    // MARK: Business Logic
    
    func loadPosts(request: Service.Request)
    {
        worker = PostWorker()
        worker?.loadPosts(with: request, closure:{ (postList, isSuccess) in
            
            DispatchQueue.main.async {
                if isSuccess
                {
                    self.presenter?.presentPostList(with: postList)
                }
                else
                {
                    
                }
            }
            
        })
        
    }
}

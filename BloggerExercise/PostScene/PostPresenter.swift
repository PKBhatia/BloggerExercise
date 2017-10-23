//
//  PostPresenter.swift
//  BloggerExercise
//
//  Created by Bhatia, Parveen on 10/22/17.
//  Copyright (c) 2017 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol PostPresentationLogic
{
    func presentPostList(with postList: [Post]?)
}

class PostPresenter: PostPresentationLogic
{
    weak var viewController: PostDisplayLogic?
    
    // MARK: Presentation Logic
    
    func presentPostList(with postList: [Post]?)
    {
        viewController?.displayPosts(with: postList)
    }
    
}

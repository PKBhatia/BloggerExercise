//
//  UsersPresenter.swift
//  BloggerExercise
//
//  Created by Bhatia, Parveen on 10/11/17.
//  Copyright (c) 2017 Bhatia, Parveen. All rights reserved.


import UIKit

protocol UsersPresentationLogic
{
    func presentUserList(with userList: [UserDetails])
}

class UsersPresenter: UsersPresentationLogic
{
    weak var viewController: UsersDisplayLogic?
    
    // MARK: Presentation Logic
    
    func presentUserList(with userList: [UserDetails])
    {
        viewController?.displayUserList(with: userList)
    }
}

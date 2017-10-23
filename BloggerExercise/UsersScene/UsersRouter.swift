//
//  UsersRouter.swift
//  BloggerExercise
//
//  Created by Bhatia, Parveen on 10/11/17.
//  Copyright (c) 2017 Bhatia, Parveen. All rights reserved.


import UIKit

protocol UsersRoutingLogic: class
{
    func navigateUserPost(with userDetails: UserDetails)
}

class UsersRouter: NSObject, UsersRoutingLogic
{
    weak var viewController: UsersViewController?
    
    // MARK: Routing
    
    func navigateUserPost(with userDetails: UserDetails)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let userPostVC = storyboard.instantiateViewController(withIdentifier: postStoryBoardId) as! PostViewController
        
        userPostVC.userDetails = userDetails
        viewController?.navigationController?.pushViewController(userPostVC, animated: true)
    }
}

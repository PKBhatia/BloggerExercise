//
//  PostRouter.swift
//  BloggerExercise
//
//  Created by Bhatia, Parveen on 10/22/17.
//  Copyright (c) 2017 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

@objc protocol PostRoutingLogic
{
}


class PostRouter: NSObject, PostRoutingLogic
{
    weak var viewController: PostViewController?
    
    // MARK: Routing
}

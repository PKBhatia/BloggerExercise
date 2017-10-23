//
//  UsersInteractor.swift
//  BloggerExercise
//
//  Created by Bhatia, Parveen on 10/11/17.
//  Copyright (c) 2017 Bhatia, Parveen. All rights reserved.


import UIKit

protocol UsersBusinessLogic
{
    func loadUsers(request: Service.Request)
}

class UsersInteractor: UsersBusinessLogic
{
    var presenter: UsersPresentationLogic?
    var worker: UsersWorker?
    
    // MARK: Business Logic
    
    func loadUsers(request: Service.Request)
    {
        worker = UsersWorker()
        worker?.loadUsers(with: request, closure:{ (userList, isSuccess) in
            
            DispatchQueue.main.async {
                if isSuccess
                {
                    self.presenter?.presentUserList(with: userList ?? [])
                }
                else
                {
                    
                }
            }
            
        })
        
    }
}

//
//  UsersViewController.swift
//  BloggerExercise
//
//  Created by Bhatia, Parveen on 10/11/17.
//  Copyright (c) 2017 Bhatia, Parveen. All rights reserved.


import UIKit

protocol UsersDisplayLogic: class
{
    func displayUserList(with userList: [UserDetails])
}

class UsersViewController: UIViewController, UsersDisplayLogic, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var usersTableView: UITableView!
    var interactor: UsersBusinessLogic?
    var router: (NSObjectProtocol & UsersRoutingLogic)?
    var usersList = [UserDetails]()
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup()
    {
        let viewController = self
        let interactor = UsersInteractor()
        let presenter = UsersPresenter()
        let router = UsersRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        usersTableView.register(UINib.init(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "UserTableViewCellId")
        self.title = "Users"
        loadUsers()
    }
    
    // MARK: loadUsers
    
    func loadUsers()
    {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100))
        {
            let request = Service.Request(requestURL: URL(string: baseURL + "/users")!, httpMethod: "GET")
            self.interactor?.loadUsers(request: request)
        }
    }
    
    func displayUserList(with userList: [UserDetails])
    {
        usersList.append(contentsOf: userList)
        usersTableView.reloadData()
    }
    
    // MARK: TableView delegate methods
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if let userCell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCellId") as? UserTableViewCell
        {
            let userDetail = usersList[indexPath.row]
            userCell.userNameLabel.text = userDetail.fullName
            userCell.streetAndSuiteLabel.text = userDetail.userAddress.street + ", " + userDetail.userAddress.suite
            userCell.cityDetailsLabel.text = userDetail.userAddress.city + ", " + userDetail.userAddress.zipcode
            return userCell
        }
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return usersList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UITableViewAutomaticDimension
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath)
    {
        router?.navigateUserPost(with: usersList[indexPath.row])
    }
    
}

//
//  PostViewController.swift
//  BloggerExercise
//
//  Created by Bhatia, Parveen on 10/22/17.
//  Copyright (c) 2017 ___ORGANIZATIONNAME___. All rights reserved.


import UIKit

protocol PostDisplayLogic: class
{
    func displayPosts(with posts: [Post]?)
}

class PostViewController: UIViewController, PostDisplayLogic, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var postTableView: UITableView!
    var userDetails: UserDetails?
    var interactor: PostBusinessLogic?
    var router: (NSObjectProtocol & PostRoutingLogic)?
    var postList: [Post]?
    
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
        let interactor = PostInteractor()
        let presenter = PostPresenter()
        let router = PostRouter()
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
        postTableView.register(UINib.init(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "PostCellId")
        self.title = "Posts"
        loadPosts()
    }
    
    func loadPosts()
    {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100))
        {
            let request = Service.Request(requestURL: URL(string: baseURL + "/posts?userId=\((self.userDetails?.id)!)")!, httpMethod: "GET")
            self.interactor?.loadPosts(request: request)
        }
    }

    // MARK: PostDisplayLogic

    func displayPosts(with posts: [Post]?)
    {
        self.postList = posts
        self.postTableView.reloadData()
    }
    
    // MARK: TableView delegate methods
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if let postCell = tableView.dequeueReusableCell(withIdentifier: "PostCellId") as? PostTableViewCell
        {
            if let post = postList?[indexPath.row]
            {
                postCell.postTitle.text = post.title
                postCell.postMessage.text = post.body
            }
            return postCell
        }
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return postList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath)
    {
        //router?.navigateUserPost(with: usersList[indexPath.row])
    }
    
}

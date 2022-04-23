//
//  FollowersListVC.swift
//  GitHubFollowers
//
//  Created by admin on 22/04/22.
//

import UIKit

class FollowersListVC: UIViewController {
   
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        NetworkManager.shared.getFollowers(for: userName, page: 1) { followers, errorMessage in
            guard let followers = followers else {
                self.presentGFAlertOnMainThread(title: "Bad Stuff Happend", message: errorMessage!.rawValue, buttonTitle: "Ok")
                return
            }
            print("Followers count is = \(followers.count)")
            print(followers)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

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
        title = userName
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
}

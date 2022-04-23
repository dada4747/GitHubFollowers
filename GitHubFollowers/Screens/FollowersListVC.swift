//
//  FollowersListVC.swift
//  GitHubFollowers
//
//  Created by admin on 22/04/22.
//

import UIKit

class FollowersListVC: UIViewController {
    
    var userName: String!
    
    // MARK: Declare variable for collection view
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureCollectionView()
        getFollowers()
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    // MARK: - Configure view controller
    func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: - Configure collection view
    func configureCollectionView() {
        //initialize collection view
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createThreeColumnFlowLayout())
        
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
    }
    
    // MARK: - Create three column
    func createThreeColumnFlowLayout () -> UICollectionViewFlowLayout {
        let width                       = view.bounds.width
        let padding: CGFloat            = 12
        let minItemSpacing : CGFloat    = 10
        let availableWidth              = width - (padding * 2 ) - (minItemSpacing * 2)
        let itemWidth                   = availableWidth / 3
        
        let flowLayout                  = UICollectionViewFlowLayout()
        flowLayout.sectionInset         = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize             = CGSize(width: itemWidth, height: itemWidth)
        return flowLayout
    }
    
    // MARK: - get followers network call
    func getFollowers() {
        NetworkManager.shared.getFollowers(for: userName, page: 1) { result in
            
            switch result {
            case .success(let followers):
                print("Followers count is = \(followers.count)")
                print(followers)
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Bad Stuff Happend", message: error.rawValue, buttonTitle: "Ok")
            }
            
        }
    }
    
}

//
//  FollowersListVC.swift
//  GitHubFollowers
//
//  Created by admin on 22/04/22.
//

import UIKit

class FollowersListVC: UIViewController {
    
    enum Section {
    case main
    }
    
    var userName: String!
    var followers: [Follower] = []
    
    // MARK: Declare variable for collection view
    var collectionView: UICollectionView!
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureCollectionView()
        getFollowers()
        configureDataSource()
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
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
//
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
    }
    
   
    // MARK: - get followers network call
    func getFollowers() {
        NetworkManager.shared.getFollowers(for: userName, page: 1) { [weak self] result in
            guard let self = self  else{ return}
            switch result {
            case .success(let followers):
                self.followers = followers
                self.updateData()
                print(followers)
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Bad Stuff Happend", message: error.rawValue, buttonTitle: "Ok")
            }
            
        }
    }
    
    // MARK: - Configure Data Source
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Follower>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, follower) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.reuseID, for: indexPath) as! FollowerCell
            cell.set(follower: follower)
            return cell
        })
    }
    
    func updateData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapshot.appendSections([.main])
        snapshot.appendItems(followers)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)

        }
    }
}

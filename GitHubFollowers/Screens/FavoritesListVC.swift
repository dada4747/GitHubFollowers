//
//  FavoritesListVC.swift
//  GitHubFollowers
//
//  Created by admin on 22/04/22.
//

import UIKit

class FavoritesListVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        
        PersistanceManager.retriveFavorites { result in
            switch result {
            case .success(let favorites):
                print(favorites)
                
            case .failure(let error):
                print(error)
            }
        }
    }
    


}

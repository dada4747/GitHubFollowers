//
//  SceneDelegate.swift
//  GitHubFollowers
//
//  Created by admin on 21/04/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene       = (scene as? UIWindowScene) else { return }
      
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene         = windowScene
        window?.rootViewController  = createTabBarController()
        window?.makeKeyAndVisible()
    }

    
    func createSearchNC() -> UINavigationController{
        let searchVc                = SearchVC()
        searchVc.title              = "Search"
        searchVc.tabBarItem         = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        return UINavigationController(rootViewController: searchVc)
    }
    
    
    func createFavoritesNC() -> UINavigationController{
        let favoritesVc             = FavoritesListVC()
        favoritesVc.title           = "Favorites"
        favoritesVc.tabBarItem      = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        return UINavigationController(rootViewController: favoritesVc)
    }
    
    
    func createTabBarController() -> UITabBarController{
        let tabbar                  = UITabBarController()
        UITabBar.appearance().tintColor = .systemGreen
        tabbar.viewControllers      = [createSearchNC(), createFavoritesNC()]
        
        return tabbar
    }
    
    
    func sceneDidDisconnect(_ scene: UIScene) {
     }

    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }


}


//
//  SceneDelegate.swift
//  GitHub
//
//  Created by Bruno Silva on 15/05/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    //MARK: - Variables
    var window: UIWindow?
    
    //MARK: - Functions
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = createTabBar()
        window?.makeKeyAndVisible()
    }
    
    private func createSeachNC() -> UINavigationController {
        let searchVC        = SearchVC()
        searchVC.title      = "Search"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        return UINavigationController(rootViewController: searchVC)
    }
    
    private func createFavoriteListNC() -> UINavigationController {
        let favoriteVC          = FavoriteListVC()
        favoriteVC.title        = "Favorite"
        favoriteVC.tabBarItem   = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        return UINavigationController(rootViewController: favoriteVC)
    }
    
    private func createTabBar() -> UITabBarController {
        let tabbar                      = UITabBarController()
        UITabBar.appearance().tintColor = .systemGreen
        tabbar.viewControllers          = [createSeachNC(), createFavoriteListNC()]
        
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


//
//  GFTabBarController.swift
//  GHFollowers
//
//  Created by Sean Allen on 1/30/20.
//  Copyright © 2020 Sean Allen. All rights reserved.
//

import UIKit

class GFTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = .systemGreen
        viewControllers                 = [createSearchNC(), createFavoritesNC()]
    }
    
    
    func createSearchNC() -> UINavigationController {
        creatNC(viewController: SearchVC(), title: "Search", systemTitle: .search)
    }
    
    
    func createFavoritesNC() -> UINavigationController {
        creatNC(viewController: FavoritesListVC(), title: "Favorite", systemTitle: .favorites)
    }
    
    
    func creatNC(viewController: UIViewController, title: String, systemTitle: UITabBarItem.SystemItem) -> UINavigationController {
        let viewController = viewController
        viewController.title = title
        viewController.tabBarItem = UITabBarItem(tabBarSystemItem: systemTitle, tag: 0)
        
        return UINavigationController(rootViewController: viewController)
    }
}

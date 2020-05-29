//
//  GFTabBarControllerViewController.swift
//  GitHubFollowers
//
//  Created by Shyngys Saktagan on 5/13/20.
//  Copyright © 2020 ShyngysSaktagan. All rights reserved.
//

import UIKit

class GFTabBarControllerViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [creatSearchNC(), creatFavoritesNC()]
        UITabBar.appearance().tintColor = .systemGreen
    }
    
    
    func creatSearchNC() -> UINavigationController {
        creatNC(viewController: SearchVC(), title: "Search", systemTitle: .search)
    }
    
    
    func creatFavoritesNC() -> UINavigationController {
        creatNC(viewController: FavoritesListVC(), title: "Favorite", systemTitle: .favorites)
    }
    
    
    func creatNC(viewController: UIViewController, title: String, systemTitle: UITabBarItem.SystemItem) -> UINavigationController {
        let viewController = viewController
        viewController.title = title
        viewController.tabBarItem = UITabBarItem(tabBarSystemItem: systemTitle, tag: 0)
        
        return UINavigationController(rootViewController: viewController)
    }
}

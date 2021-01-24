//
//  CustomTabBarController.swift
//  IOSINT6_HomeWork1_1
//
//  Created by Михаил Ильченко on 23.01.2021.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        
        let firstVC = FeedViewController()
        firstVC.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        let firstNavigator = UINavigationController(rootViewController: firstVC)
        
        let secondVC = ProfileViewController()
        secondVC.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
        let secondNavigator = UINavigationController(rootViewController: secondVC)
        
        viewControllers = [firstNavigator,secondNavigator]
    }
}


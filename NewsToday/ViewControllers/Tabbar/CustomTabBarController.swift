//
//  CustomTabBarController.swift
//  NewToday
//
//  Created by Vika on 25.10.24.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    private let customTabBar = CustomTabBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customTabBar.tintColor = UIColor(red: 71/255, green: 90/255, blue: 215/255, alpha: 1)
        customTabBar.unselectedItemTintColor = UIColor(red: 172/255, green: 175/255, blue: 195/255, alpha: 1)
        customTabBar.isTranslucent = false
    
        setValue(customTabBar, forKey: "tabBar")
        setupTabs()
    }
    
    private func setupTabs() {
        
        let browseVC = BrowseViewController()
        browseVC.tabBarItem.image = UIImage(named: "home")
        
        let bookMarksVC = BookMarksViewController()
        bookMarksVC.tabBarItem.image = UIImage(named: "bookmark")
        
        let profileVC = UINavigationController(rootViewController: ProfileViewController())
        profileVC.tabBarItem.image = UIImage(named: "user")
        
        if browseVC.tabBarItem.image == nil {
            print("Image for Browse tab is missing")
        }
        
        viewControllers = [browseVC, bookMarksVC, profileVC]
    }
}

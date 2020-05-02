//
//  BaseTabBarController.swift
//  AppStore Using JSON API
//
//  Created by Douglas Moreira on 18/10/19.
//  Copyright © 2019 Douglas Moreira. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers  = [
            createNavController(viewController: TodayViewController(), title: "Today", imageName: "today_icon"),
            createNavController(viewController: AppsPageController(), title: "Apps", imageName: "apps"),
            createNavController(viewController: SearchViewController(), title: "Search", imageName: "search")
        ]
        
    }

    fileprivate func createNavController(viewController: UIViewController, title: String, imageName:String) -> UIViewController{

        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        navController.navigationBar.prefersLargeTitles = true
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = .white

        return navController

    }


}

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
        let appViewController = UIViewController()
        appViewController.navigationItem.title = "Apps"
        appViewController.view.backgroundColor = .white
        let appNavController = UINavigationController(rootViewController: appViewController)
        appNavController.tabBarItem.title = "Apps"
        appNavController.tabBarItem.image = #imageLiteral(resourceName: "apps")
        appNavController.navigationBar.prefersLargeTitles = true
//        appNavController.

        let todayViewController = UIViewController()
        todayViewController.navigationItem.title = "Today"
        todayViewController.view.backgroundColor = .white

        let todayNavController = UINavigationController(rootViewController: todayViewController)
        todayNavController.tabBarItem.title = "Today"
        todayNavController.navigationBar.prefersLargeTitles = true
        todayNavController.tabBarItem.image = #imageLiteral(resourceName: "today_icon")

        let searchViewController = UIViewController()
        searchViewController.tabBarItem.title = "Search"
        searchViewController.view.backgroundColor = .white

        let searchNavController = UINavigationController(rootViewController: searchViewController)
        searchNavController.tabBarItem.title = "Search"
        searchNavController.navigationBar.prefersLargeTitles = true
        searchViewController.navigationItem.title = "Search"
        searchNavController.tabBarItem.image = #imageLiteral(resourceName: "search")


        viewControllers  = [
        appNavController,
        todayNavController,
        searchNavController]

    }


}

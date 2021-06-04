//
//  TabBarViewController.swift
//  tabBar
//
//  Created by Aleksandr Dorofeev on 03.06.2021.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        setupVc()
    }
    
    func setupVc() {
        viewControllers = [createNavController(for: ProductCollectionViewController(), title: NSLocalizedString("Products", comment: ""), imageName: ""),
        createNavController(for: CartViewController(), title: NSLocalizedString("Cart", comment: ""), imageName: ""),
        createNavController(for: HistoryViewController(), title: NSLocalizedString("History", comment: ""), imageName: "")]
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController, title: String, imageName: String) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        navController.navigationBar.prefersLargeTitles = true
        navController.navigationItem.largeTitleDisplayMode = .always
        navController.navigationBar.sizeToFit()
        rootViewController.navigationItem.title = title
        return navController
    }
}

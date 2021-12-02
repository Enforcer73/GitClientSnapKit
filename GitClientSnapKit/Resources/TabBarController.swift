//
//  TabBarController.swift
//  GitClientSnapKit
//
//  Created by Ruslan Bagautdinov on 01.12.2021.
//

import UIKit

class TabBarController: UITabBarController {

    let reposVC = UINavigationController(rootViewController:ReposViewController())
    let favoritVC = UINavigationController(rootViewController:FavoriteViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UINavigationBar.appearance().backgroundColor = colorTabel
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black]
        
        
        self.setViewControllers([reposVC, favoritVC], animated: true )
        self.tabBar.tintColor = .black
        self.tabBar.backgroundColor = colorTabel
        
        reposVC.title = "Repositories"
        favoritVC.title = "Favorites"
        
        guard let items = self.tabBar.items else { return }

        let images = ["tablecells", "star"]

        for (index, element) in items.enumerated() {
          element.image = UIImage(systemName: images[index])
        }
    }
}

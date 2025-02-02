//
//  TabBarController.swift
//  FoodCourt
//
//  Created by Максим Бойчук on 14.05.2020.
//  Copyright © 2020 Maksim Boichuk. All rights reserved.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    private let recipeFeed = RecipeTableView()
    private let profile = ProfileView()
    private var currentUsername: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        guard let currentUsername = currentUsername else { return }
        recipeFeed.tabBarItem = UITabBarItem(title: nil,
                                             image: UIImage(named: SystemValues.imageCapName)?
                                                .withRenderingMode(.alwaysOriginal),
                                             tag: 1)
        recipeFeed.tabBarItem.selectedImage = UIImage(named: SystemValues.imageCapFillName)?
            .withRenderingMode(.alwaysOriginal)
        recipeFeed.tabBarItem.imageInsets = UIEdgeInsets(top: 9, left: 0, bottom: -9, right: 0)
        recipeFeed.setUsername(username: currentUsername)
        profile.tabBarItem = UITabBarItem(title: nil,
                                          image: UIImage(named: SystemValues.imagePersonName)?
                                            .withRenderingMode(.alwaysOriginal),
                                          tag: 2)
        profile.tabBarItem.selectedImage = UIImage(named: SystemValues.imagePersonFillName)?
            .withRenderingMode(.alwaysOriginal)
        profile.tabBarItem.imageInsets = UIEdgeInsets(top: 9, left: 0, bottom: -9, right: 0)
        self.viewControllers = [recipeFeed, profile]
        self.selectedIndex = 0
    }
    
    func setUsername(username: String) {
        currentUsername = username
    }
}

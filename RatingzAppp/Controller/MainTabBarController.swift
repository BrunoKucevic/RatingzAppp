//
//  MainTabBarController.swift
//  RatingzAppp
//
//  Created by Bruno Kucevic on 20/05/2020.
//  Copyright © 2020 Bruno Kucevic. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    let mainCoord = MoviesCoordinator(navigationController: UINavigationController())
    let tvShowsCoordinator = TVShowsCoordinator(navigationController: UINavigationController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.tabBarController?.navigationController?.navigationBar.isHidden = true
//        tabBar.tintColor = UIColor.someColor2()
//        tabBar.isTranslucent = false
        mainCoord.start()
        tvShowsCoordinator.start()
        viewControllers = [mainCoord.navigationController, tvShowsCoordinator.navigationController]
    }

}

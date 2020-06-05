//
//  TVShowsCoordinator.swift
//  RatingzAppp
//
//  Created by Bruno Kucevic on 20/05/2020.
//  Copyright © 2020 Bruno Kucevic. All rights reserved.
//

import Foundation
import UIKit

class TVShowsCoordinator : Coordinator{
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = TVShowsMainViewController.instantiate()
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
//    func vc2(){
//        let vc = ViewController2.instantiate()
//        //vc.coordinator = self
//        navigationController.pushViewController(vc, animated: false)
//    }
}

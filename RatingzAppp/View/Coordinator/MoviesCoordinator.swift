//
//  MoviesCoordinator.swift
//  RatingzAppp
//
//  Created by Bruno Kucevic on 20/05/2020.
//  Copyright © 2020 Bruno Kucevic. All rights reserved.
//

import Foundation
import UIKit

class MoviesCoordinator : NSObject, Coordinator, UINavigationControllerDelegate{
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = MoviesMainViewController.instantiate()
        navigationController.delegate = self
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: .mostViewed, tag: 0)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func subscribeToDetails(_ result : MoviesModelResult){
        let child = MoviesDetailsCoordinator(navigationController: navigationController, moviesDetails: result)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {return}
        
        if navigationController.viewControllers.contains(fromViewController){
            return
        }
        
        if let moviesDetailsViewController = fromViewController as? MoviesDetailsViewController{
            childDidFinish(moviesDetailsViewController.coordinator!)
        }
    }
    
    func childDidFinish(_ child: Coordinator){
        for (index, coordinator) in childCoordinators.enumerated(){
            if coordinator === child{
                childCoordinators.remove(at: index)
            }
        }
    }

}

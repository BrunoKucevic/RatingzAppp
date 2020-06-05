//
//  MoviesDetailsCoordinator.swift
//  RatingzAppp
//
//  Created by Bruno Kucevic on 23/05/2020.
//  Copyright © 2020 Bruno Kucevic. All rights reserved.
//

import Foundation
import UIKit

class MoviesDetailsCoordinator: NSObject, Coordinator, UINavigationControllerDelegate{
    
    weak var parentCoordinator : MoviesCoordinator?
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    var moviesDetails : MoviesModelResult
    
    init(navigationController: UINavigationController, moviesDetails: MoviesModelResult) {
        self.navigationController = navigationController
        self.moviesDetails = moviesDetails
    }
    
    func start() {
        let vc = MoviesDetailsViewController.instantiate()
//        navigationController.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//        navigationController.navigationBar.shadowImage = UIImage()
//        navigationController.navigationBar.isTranslucent = true
        navigationController.navigationItem.backBarButtonItem = UIBarButtonItem(title: "liygjhghig", style: .done, target: nil, action: nil)
        vc.coordinator = self
        vc.details = moviesDetails
        navigationController.pushViewController(vc, animated: false)
    }
    
    func subscribeToMoreLikeThis(_ movieId : Int){
        let child = MoviesMoreLikeThisCoordinator(navigationController: navigationController, movieId: movieId)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {return}
        
        if navigationController.viewControllers.contains(fromViewController){
            return
        }
        
        if let moviesDetailsViewController = fromViewController as? MoviesMoreLikeThisViewController{
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

extension UINavigationController{
    func setTheNavBarTranslucent(){
        self.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
    }
}

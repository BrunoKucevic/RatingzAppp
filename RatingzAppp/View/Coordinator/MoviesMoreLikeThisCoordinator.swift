//
//  MoviesMoreLikeThisCoordinator.swift
//  RatingzAppp
//
//  Created by Bruno Kucevic on 29/05/2020.
//  Copyright © 2020 Bruno Kucevic. All rights reserved.
//

import Foundation
import UIKit


class MoviesMoreLikeThisCoordinator: Coordinator{
    
    weak var parentCoordinator : MoviesDetailsCoordinator?
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    var movieId : Int?
    
    init(navigationController: UINavigationController, movieId: Int) {
        self.navigationController = navigationController
        self.movieId = movieId
    }
    
    func start() {
        let vc = MoviesMoreLikeThisViewController.instantiate()
        //        navigationController.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        //        navigationController.navigationBar.shadowImage = UIImage()
        //        navigationController.navigationBar.isTranslucent = true
        //navigationController.setTheNavBarTranslucent()
        //navigationController.navigationItem.backBarButtonItem = UIBarButtonItem(title: "liygjhghig", style: .done, target: nil, action: nil)
        vc.coordinator = self
        vc.movieId = movieId
        navigationController.pushViewController(vc, animated: false)
    }
    
}

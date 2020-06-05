//
//  MoviesDetailsViewController.swift
//  RatingzAppp
//
//  Created by Bruno Kucevic on 23/05/2020.
//  Copyright © 2020 Bruno Kucevic. All rights reserved.
//

import UIKit

class MoviesDetailsViewController: UIViewController, StoryBoarded {
    
    weak var coordinator : MoviesDetailsCoordinator?
    var details : MoviesModelResult?
    
    @IBOutlet weak var moreLikeThisButtonTapped: UIButton!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupControls()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    
    @IBAction func moreLikeThisBtnTapped(_ sender: UIButton) {
        guard let movieId = details?.id else {return}
        coordinator?.subscribeToMoreLikeThis(movieId)
    }
    
    func setupControls(){
        titleLabel.layer.cornerRadius = titleLabel.frame.height / 2
        detailsLabel.layer.cornerRadius = detailsLabel.frame.height / 5
        headerView.backgroundColor = UIColor.someColor2()
        detailsLabel.backgroundColor = UIColor.someColor2()
        moreLikeThisButtonTapped.backgroundColor = UIColor.someColor2()
        
        detailsLabel.text = details?.overview
        titleLabel.text = details?.title
        if let image = details?.imageStringBig {
            titleImage.downloaded(from: image)
        }
    }
}

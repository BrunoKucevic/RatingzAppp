//
//  MoviesMoreLikeThisViewController.swift
//  RatingzAppp
//
//  Created by Bruno Kucevic on 29/05/2020.
//  Copyright © 2020 Bruno Kucevic. All rights reserved.
//

import UIKit

class MoviesMoreLikeThisViewController: UIViewController, StoryBoarded, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var moviesModelArray = [MoviesModelResult]()
    weak var coordinator : MoviesMoreLikeThisCoordinator?
    var api = RatingzApppDataHandler()
    var movieId : Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(ReusableCellTableViewCell.nib(), forCellReuseIdentifier: ReusableCellTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.rowHeight = 130
        // Do any additional setup after loading the view.
        
        api.getData(movieId: movieId) { (movies) in
            DispatchQueue.main.async {
                movies.forEach { (movie) in
                    self.moviesModelArray.append(movie)
                }
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        moviesModelArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReusableCellTableViewCell.identifier, for: indexPath) as! ReusableCellTableViewCell
        cell.name.text = moviesModelArray[indexPath.row].title
        if let image = moviesModelArray[indexPath.row].imageString {
            cell.imgView.downloaded(from: image)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

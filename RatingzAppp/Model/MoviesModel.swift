//
//  MoviesModel.swift
//  RatingzAppp
//
//  Created by Bruno Kucevic on 21/05/2020.
//  Copyright © 2020 Bruno Kucevic. All rights reserved.
//

import Foundation
import UIKit

struct MoviesModel : Codable {
    
    let page : Int?
    let results : [MoviesModelResult]?
    let totalPages : Int?
    let totalResults : Int?
    
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}


struct MoviesModelResult : Codable {
    
    let adult : Bool?
    let backdropPath : String?
    let genreIds : [Int]?
    let id : Int?
    let originalLanguage : String?
    let originalTitle : String?
    let overview : String?
    let popularity : Float?
    let posterPath : String?
    let releaseDate : String?
    let title : String?
    let video : Bool?
    let voteAverage : Float?
    let voteCount : Int?
    
    let imgBaseUrl = "https://image.tmdb.org/t/p/w92"
    let imgBaseUrlBig = "https://image.tmdb.org/t/p/w300"
    var imageString: String?{
        if let posterPath = self.posterPath{
            return imgBaseUrl + posterPath
        }
            
        else {return nil}
        
    }
    
    var imageStringBig: String?{
        if let posterPath = self.posterPath{
            return imgBaseUrlBig + posterPath
        }
            
        else {return nil}
        
    }
    
    
    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case backdropPath = "backdrop_path"
        case genreIds = "genre_ids"
        case id = "id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title = "title"
        case video = "video"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}


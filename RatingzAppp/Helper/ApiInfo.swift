//
//  ApiInfo.swift
//  RatingzAppp
//
//  Created by Bruno Kucevic on 23/05/2020.
//  Copyright © 2020 Bruno Kucevic. All rights reserved.
//

import Foundation


struct ApiInfo{
    
    static let apiKey = "ba640ab1d79905e3aa24ff45e2f5199f"
    
    static let baseURL = "https://api.themoviedb.org/3/movie/top_rated?api_key="
    static let baseURLEnd = "&language=en-US&page=1"

    //static var movieId = ""
    static let moreLikeThisMoviesBaseUrl1 = "https://api.themoviedb.org/3/movie/"
    static var moreLikeThisMoviesBaseUrl2 = ""//\(movieId)/"
    static let moreLikeThisMoviesBaseUrl3 = "similar?api_key="
    static let moreLikeThisMoviesBaseUrlEnd = "&language=en-US&page=1"
    
    static var finalUrl : String{
        return self.baseURL + self.apiKey + self.baseURLEnd
    }
    
    static var id : String{
        
        get{
            return self.moreLikeThisMoviesBaseUrl2
        }
        set(value){
            self.moreLikeThisMoviesBaseUrl2 = "\(value)/"
        }
    }
    
    static var finalUrlMoreLikeThis : String{
        get{
            return self.moreLikeThisMoviesBaseUrl1 + self.id + self.moreLikeThisMoviesBaseUrl3 + self.apiKey + self.moreLikeThisMoviesBaseUrlEnd
        }
    }
}

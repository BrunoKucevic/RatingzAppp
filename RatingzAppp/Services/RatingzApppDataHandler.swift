
//
//  RatingzApppDataHandler.swift
//  RatingzAppp
//
//  Created by Bruno Kucevic on 22/05/2020.
//  Copyright © 2020 Bruno Kucevic. All rights reserved.
//

import Foundation

class RatingzApppDataHandler{
    
    var results = [MoviesModelResult]()
    
    func getData(callBack: @escaping ([MoviesModelResult]) -> Void){
        JSONParser.shared.fetch(urlString: ApiInfo.finalUrl) { (result: Result<MoviesModel, RequestError>) in
            
            switch result{
            case .success(let movies):
                movies.results?.forEach({ (result) in
                    self.results.append(result)
                })
                callBack(self.results)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getData(movieId: Int?, callBack: @escaping ([MoviesModelResult]) -> Void){
        
        guard let id = movieId else {return}
        
        ApiInfo.id = String(id)
        
        JSONParser.shared.fetch(urlString: ApiInfo.finalUrlMoreLikeThis) { (result: Result<MoviesModel, RequestError>) in
            //print(ApiInfo.finalUrlMoreLikeThis)
            switch result{
            case .success(let movies):
                movies.results?.forEach({ (result) in
                    self.results.append(result)
                })
                callBack(self.results)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}







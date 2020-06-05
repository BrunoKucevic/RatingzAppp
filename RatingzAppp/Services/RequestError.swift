//
//  RequestError.swift
//  RatingzAppp
//
//  Created by Bruno Kucevic on 20/05/2020.
//  Copyright © 2020 Bruno Kucevic. All rights reserved.
//

import Foundation


enum RequestError: Error{
    case clienError
    case serverError
    case noData
    case dataDecodingError
}

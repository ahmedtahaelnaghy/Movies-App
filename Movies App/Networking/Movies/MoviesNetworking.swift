//
//  MoviesNetworking.swift
//  Movies App
//
//  Created by Ahmed Taha on 11/09/2022.
//

import Foundation
import Alamofire

enum MoviesNetworking {
    case getMovies(genre: String)
}

extension MoviesNetworking: TargetType {
    
    var baseURL: String {
        switch self {
        default:
            return "https://yts.torrentbay.to/api/v2/list_movies.json"
        }
    }
    
    var path: String {
        switch self {
        case .getMovies:
            return ""
        }
    }
    
    var method: HttpMethod {
        switch self {
        case .getMovies:
            return .get
        }
    }
    
//    var parameters: Parameters? {
//        var params = Parameters()
//        switch self {
//        case .getMovies:
//            break
//        }
//        return params
//    }
    
    var task: Task {
        switch self {
        case .getMovies(let genre):
            return .requestParameters(parameters: ["genre": genre], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String] {
        switch self {
        default:
            return [:]
        }
    }
}

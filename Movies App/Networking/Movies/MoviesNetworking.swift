//
//  MoviesNetworking.swift
//  Movies App
//
//  Created by Ahmed Taha on 11/09/2022.
//

import Foundation
import Alamofire

enum MoviesNetworking {
    case getMovies
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
    
    var task: Task {
        switch self {
        case .getMovies:
            return .requestPlain
        }
    }
    
    var headers: [String : String] {
        switch self {
        default:
            return [:]
        }
    }
}

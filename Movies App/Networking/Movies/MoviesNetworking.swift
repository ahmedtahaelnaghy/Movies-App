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


///3/movie/616037/reviews?
//.requestParameters(parameters: ["api_key": "3bfd219a287f476c97bfb68c3b117bf3", "fbclid": "IwAR2kVHEaaq0wgnUlb6FJM0G4wSJAxaCZlKiJwb6Ie626z4OyuSYAd5my6k0"], encoding: URLEncoding.default)

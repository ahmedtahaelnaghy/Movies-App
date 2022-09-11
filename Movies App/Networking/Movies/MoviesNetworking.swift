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
            return "https://api.themoviedb.org"
        }
    }
    
    var path: String {
        switch self {
        case .getMovies:
            return "/3/movie/616037/reviews?"
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
            return .requestParameters(parameters: ["api_key": "3bfd219a287f476c97bfb68c3b117bf3", "fbclid": "IwAR2kVHEaaq0wgnUlb6FJM0G4wSJAxaCZlKiJwb6Ie626z4OyuSYAd5my6k0"], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String] {
        switch self {
        default:
            return [:]
        }
    }
}

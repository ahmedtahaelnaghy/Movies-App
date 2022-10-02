//
//  MovieAPI.swift
//  Movies App
//
//  Created by Ahmed Taha on 11/09/2022.
//

import Foundation
import Alamofire

protocol MovieAPIProtocol {
    func getData(completion: @escaping(Result<MoviesModel?, NSError>) -> Void)
}

class MovieAPI: BaseAPI<MoviesNetworking>, MovieAPIProtocol {
    
    func getData(completion: @escaping (Result<MoviesModel?, NSError>) -> Void) {
        self.fetchData(target: .getMovies, response: MoviesModel.self) { result in
            completion(result)
        }
    }
}

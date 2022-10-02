//
//  BaseAPI.swift
//  Movies App
//
//  Created by Ahmed Taha on 11/09/2022.
//

import Foundation
import Alamofire

class BaseAPI<T: TargetType> {
    
    func fetchData<M: Decodable>(target: T, response: M.Type, completion: @escaping(Result<M?, NSError>) -> Void) {
        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
        let headers = Alamofire.HTTPHeaders(target.headers)
        let parameteres = buildParameters(task: target.task)
        AF.request(target.baseURL + target.path, method: method, parameters: parameteres.0, encoding: parameteres.1, headers: headers).response { (response) in
            
            guard let statusCode = response.response?.statusCode else { return }
            if statusCode == 200 {
                switch response.result {
                case .success(let data):
                    guard let responseObj = try? JSONDecoder().decode(M.self, from: data!) else { return }
                    completion(.success(responseObj))
                case .failure(_):
                    let error = NSError(domain: target.baseURL, code: statusCode, userInfo: [NSLocalizedDescriptionKey: ErrorMessage.genericError])
                    completion(.failure(error))
                }
            } else {
                let error = NSError(domain: target.baseURL, code: statusCode, userInfo: [NSLocalizedDescriptionKey: ErrorMessage.genericError])
                completion(.failure(error))
            }
        }
    }
  
    private func buildParameters(task: Task) -> ([String: Any], ParameterEncoding) {
        switch task {
        case .requestPlain:
            return ([:], URLEncoding.default)
        case .requestParameters(let parameters, let encoding):
            return (parameters, encoding)
        }
    }
    
}

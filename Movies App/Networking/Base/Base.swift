//
//  Base.swift
//  Movies App
//
//  Created by Ahmed Taha on 11/09/2022.
//

import Foundation
import Alamofire

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"    
}

enum Task {
    case requestPlain
    case requestParameters(parameters: [String: Any], encoding: ParameterEncoding)
}

protocol TargetType {
    var baseURL: String { get }
    var path: String { get }
    var method: HttpMethod { get}
    var task: Task { get }
    var headers: [String: String] { get }
}

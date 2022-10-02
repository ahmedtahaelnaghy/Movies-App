//
//  BaseResponse.swift
//  Movies App
//
//  Created by Ahmed Taha on 11/09/2022.
//

import Foundation

class BaseResponse<T: Codable>: Codable {
    var state: String?
    var data: T?
}

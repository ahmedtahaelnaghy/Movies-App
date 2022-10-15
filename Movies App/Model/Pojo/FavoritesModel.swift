//
//  FavoritesModel.swift
//  Movies App
//
//  Created by Ahmed Taha on 01/10/2022.
//

import Foundation

struct FavoritesModel {
    var id: Int
    var image: Data
    var name: String
    var rating: Double
    var summary: String
    var runtime: Int
    var year: Int
    var isFavorite: Bool
    var genres: [String]
}

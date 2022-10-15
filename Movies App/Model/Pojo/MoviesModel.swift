//
//  MoviesModel.swift
//  Movies App
//
//  Created by Ahmed Taha on 11/09/2022.
//

import Foundation

// MARK: - MoviesModel
struct MoviesModel: Codable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let movies: [Movie]
}

// MARK: - Movie
struct Movie: Codable {
    let id: Int
    let title: String
    let year: Int
    let rating: Double
    let runtime: Int
    let genres: [String]
    let summary: String
    let largeCoverImage: String
    let isFav: Bool?

    enum CodingKeys: String, CodingKey {
        case id, title
        case year, rating, runtime, genres, summary
        case largeCoverImage = "large_cover_image"
        case isFav
    }
}

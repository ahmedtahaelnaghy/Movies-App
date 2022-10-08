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
    let url, title: String
    let year: Int
    let rating: Double
    let runtime: Int
    let genres: [String]
    let summary: String
    let backgroundImage, backgroundImageOriginal, smallCoverImage, mediumCoverImage: String
    let largeCoverImage: String

    enum CodingKeys: String, CodingKey {
        case id, url
        case title
        case year, rating, runtime, genres, summary
        case backgroundImage = "background_image"
        case backgroundImageOriginal = "background_image_original"
        case smallCoverImage = "small_cover_image"
        case mediumCoverImage = "medium_cover_image"
        case largeCoverImage = "large_cover_image"
    }
}

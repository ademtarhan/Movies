//
//  Movie.swift
//  Movie
//
//  Created by Adem Tarhan on 25.06.2022.
//

import Foundation


struct MovieList: Codable {
    let movieList: [Movie]
}

// MARK: - Result

struct Movie: Codable {
    let originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String

    enum CodingKeys: String, CodingKey {
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
    }
}

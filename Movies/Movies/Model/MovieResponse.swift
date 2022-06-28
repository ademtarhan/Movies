//
//  MovieResponse.swift
//  Movies
//
//  Created by Adem Tarhan on 25.06.2022.
//

import Foundation


struct MovieResponse : Codable{
    let posterPath: String
    let title: String
    let overview: String
    
    enum CodingKeys: String,CodingKey{
        case posterPath = "image"
        case title = "name"
        case overview = "information"
    }
}

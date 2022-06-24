//
//  Movie.swift
//  Movie
//
//  Created by Adem Tarhan on 25.06.2022.
//

import Foundation


struct MovieList: Decodable{
    let movieList: [Movie]
}

struct Movie: Decodable{
    var image: String
    var name: String
    var information: String
}

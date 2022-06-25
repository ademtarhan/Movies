//
//  APICallable.swift
//  Movie
//
//  Created by Adem Tarhan on 25.06.2022.
//

import Foundation


protocol APICallable: AnyObject{
    var APIKey: String {get}
    var BaseURL: String {get}
    var PageNum: Int {get}
    var imageBaseURL: String {get}
}

extension APICallable{
    var APIKey: String { return "c51c01d6b237900097f895fb7fd09ed4"}
    var BaseURL: String { return "https://api.themoviedb.org/4/list/"}
    var PageNum: Int { return 1}
    var imageBaseURL: String { return "https://image.tmdb.org/t/p/w500"}
}


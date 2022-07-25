//
//  DetailModel.swift
//  Movies
//
//  Created by Adem Tarhan on 29.06.2022.
//

import Foundation

protocol DetailsModel: AnyObject {
    var movie: MovieResult? {get set}
    func setData(with movie: MovieResult,completion: @escaping (Result<MovieResult,Error>)->Void)
    func setData(completion: @escaping (Result<MovieResult,Error>)->Void)
}

class DetailsModelImpl: DetailsModel {
    
    
    var movie: MovieResult?
    var error = "movie is nil"
    
    func setData(with movie: MovieResult, completion: @escaping (Result<MovieResult, Error>) -> Void) {
        if movie == nil {
            completion(.failure(error as! Error))
        }else{
            completion(.success(movie))
        }
    }
    func setData(completion: @escaping (Result<MovieResult, Error>) -> Void) {
        if movie == nil {
           // completion(.failure(MovieError.nilMovie(movie!)))
        }else{
            completion(.success(movie!))
        }
    }

}

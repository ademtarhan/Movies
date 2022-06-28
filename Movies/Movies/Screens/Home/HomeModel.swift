//
//  HomeModel.swift
//  Movies
//
//  Created by Adem Tarhan on 28.06.2022.
//

import Foundation

protocol HomeModel: AnyObject {
    func getMovies(at page: Int, _ completion: @escaping (Result<[MovieResult], Error>) -> Void)
}

class HomeModelImpl: HomeModel {
    func getMovies(at page: Int, _ completion: @escaping (Result<[MovieResult], Error>) -> Void) {
        APICall().getMovies(at: page) { result in
            switch result {
            case let .success(movies):
                completion(.success(movies))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}

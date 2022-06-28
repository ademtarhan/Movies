//
//  HomeViewModel.swift
//  Movies
//
//  Created by Adem Tarhan on 28.06.2022.
//

import Foundation

protocol HomeViewModel: AnyObject {
    var view: HomeViewController? { get set }
    var model: HomeModel? { get set }
    func setData()
}

class HomeViewModelImpl: HomeViewModel {
    var model: HomeModel?

    var view: HomeViewController?

    private var page = 0

    func setData() {
        page += 1
        model?.getMovies(at: page, { result in
            switch result {
            case let .success(movies):
                self.view?.update(movies: movies)
            case .failure:
                break
            }
        })
    }
}

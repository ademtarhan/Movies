//
//  DetailViewModel.swift
//  Movies
//
//  Created by Adem Tarhan on 29.06.2022.
//

import Foundation

protocol DetailsViewModel: AnyObject {
    var movie: MovieResult? { get set }
    var view: DetailsViewController? { get set }
    var model: DetailsModel? { get set }
    func update()
}

class DetailsViewModelImpl: DetailsViewModel {
    var movie: MovieResult?

    var view: DetailsViewController?

    var model: DetailsModel?
    private var page = 0

    func update() {
//        model?.setData(with: movie!, completion: { result in
//            switch result {
//            case let .success(mov):
//                self.view?.setUp(mov)
//            case let .failure(error):
//                break
//            }
//        })
//        model?.setData(completion: { result in
//            switch result {
//            case let .success(mov):
//                self.view?.setUp(mov)
//            case let .failure(error):
//                break
//            }
//        })
//        view?.setUp((model?.movie)!)
    }
}

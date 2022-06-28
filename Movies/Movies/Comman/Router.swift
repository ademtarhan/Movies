//
//  Router.swift
//  Movies
//
//  Created by Adem Tarhan on 27.06.2022.
//

import Foundation


//..MARK: Dependency injection
class Router {
    public static var shared = Router()

    var home: HomeViewController {
        let view: HomeViewController = HomeViewControllerImpl(nibName: String(describing: HomeViewController.self), bundle: nil)
        let viewModel: HomeViewModel = HomeViewModelImpl()
        let model: HomeModel = HomeModelImpl()
        view.viewModel = viewModel
        viewModel.view = view
        viewModel.model = model
        return view
    }
    
    var details: DetailsViewController{
        DetailsViewController(nibName: String(describing: DetailsViewController.self), bundle: nil)
    }
    
}

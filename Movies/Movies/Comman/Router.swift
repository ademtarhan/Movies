//
//  Router.swift
//  Movies
//
//  Created by Adem Tarhan on 27.06.2022.
//

import Foundation

class Router {
    public static var shared = Router()

    var home: ViewController {
        ViewController(nibName: "Home", bundle: nil)
    }
}

//
//  ViewController.swift
//  Movies
//
//  Created by Adem Tarhan on 25.06.2022.
//

import UIKit

protocol ViewControllerImpl: AnyObject {
    var apiCall: APICallImpl? { get }
}

class ViewController: UIViewController, APICallable {
    var apiCall: APICallImpl?
    var movie = [Movie]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
    }

    func setData() {
        print("set data")
        //..url
        let url = URL(string: "\(BaseURL)\(APIKey)")!
        print(url)
        APICall().getData(with: url){ movies in
           
            if let movies = movies {
                self.movie = movies
            }
            
        }
    }
}

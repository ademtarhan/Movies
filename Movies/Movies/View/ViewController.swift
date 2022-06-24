//
//  ViewController.swift
//  Movies
//
//  Created by Adem Tarhan on 25.06.2022.
//

import UIKit

protocol ViewControllerImpl: AnyObject{
    var apiCall: APICallImpl? { get }
}
class ViewController: UIViewController,APICallable {

    var apiCall: APICallImpl?
    var movies = [Movie]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func setData() {
        let url = URL(string: "\(BaseURL)\(APIKey)")!
        apiCall?.getData(with: url, completionHandler: { movies in
            if let movies = movies {
                self.movies = movies
                DispatchQueue.main.async {
                    //..code
                }
            }
        })
        
        
    }

}



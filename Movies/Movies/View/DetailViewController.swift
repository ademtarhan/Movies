//
//  DetailViewController.swift
//  Movies
//
//  Created by Adem Tarhan on 25.06.2022.
//

import Foundation
import UIKit

protocol DetailViewImpl: AnyObject {
    var movie: Result! { get }
}

class DetailViewController: UIViewController, APICallable {
    @IBOutlet var imageMoviePoster: UIImageView!

    @IBOutlet var labelMovieTitle: UILabel!

    @IBOutlet var textViewMovieOverview: UITextView!

    let movie: Result! = nil

    

    func setUp(_ movie: Result) {
        var url = URL(string: "\(imageBaseURL)\(movie.posterPath)")!
        loadImage(url: url)

        labelMovieTitle!.text = movie.title
        textViewMovieOverview!.text = movie.overview
    }

    func loadImage(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self!.imageMoviePoster.image = image
                    }
                }
            }
        }
    }
}

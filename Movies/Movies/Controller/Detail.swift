//
//  Detail.swift
//  Movies
//
//  Created by Adem Tarhan on 27.06.2022.
//

import Foundation
import UIKit

protocol DetailImpl: AnyObject {
    var movie: Result! { get }
}

class Detail: UIViewController, APICallable{
    var movie: Result?
    
    @IBOutlet var imageMoviePoster: UIImageView!
    @IBOutlet var labelMovieName: UILabel!
    @IBOutlet var labelMovieDate: UILabel!
    @IBOutlet var labelMovieVoteAverage: UILabel!
    @IBOutlet var textViewMovieOverview: UITextView!


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageMoviePoster.layer.cornerRadius = 20
        imageMoviePoster.clipsToBounds = true

        setUp(movie!)
        
        
    }

    func setUp(_ movie: Result) {
        var url = URL(string: "\(imageBaseURL)\(movie.posterPath)")!
        loadImage(url: url)
        labelMovieName.text = movie.title
        textViewMovieOverview.text = movie.overview
        labelMovieDate.text = movie.releaseDate
        labelMovieVoteAverage.text = String(movie.voteAverage)

        print("\(labelMovieName)\(textViewMovieOverview)")
    }

    func loadImage(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.imageMoviePoster?.image = image
                    }
                }
            }
        }
    }
}

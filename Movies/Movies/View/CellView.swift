//
//  CellView.swift
//  Movies
//
//  Created by Adem Tarhan on 25.06.2022.
//

import Foundation
import UIKit

class CellView: UICollectionViewCell, APICallable {
    @IBOutlet var labelMovieName: UILabel!
    @IBOutlet var imageMovie: UIImageView!
    @IBOutlet weak var cellView: UIView!
    
    func setup(_ movie: Result) {
        var url = URL(string: "\(imageBaseURL)\(movie.posterPath)")!
       
        labelMovieName.text = movie.title
        loadImage(url: url)
    }

    func loadImage(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self!.imageMovie.image = image
                    }
                }
            }
        }
    }
}

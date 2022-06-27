//
//  CollectionViewCell.swift
//  Movies
//
//  Created by Adem Tarhan on 27.06.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell,APICallable {
    @IBOutlet weak var imageMovie: UIImageView!
    
    @IBOutlet weak var labelMovieName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
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

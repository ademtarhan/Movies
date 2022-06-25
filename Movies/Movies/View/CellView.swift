//
//  CellView.swift
//  Movies
//
//  Created by Adem Tarhan on 25.06.2022.
//

import Foundation
import UIKit

class CellView: UICollectionViewCell{
    
    @IBOutlet weak var labelMovieName: UILabel!
    @IBOutlet weak var imageMovie: UIImageView!
    
    func setup(_ movie: Result){
        labelMovieName.text = movie.title
        imageMovie.image = UIImage(named: movie.posterPath)!
    }
    
    
}

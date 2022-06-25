//
//  MovieViewModel.swift
//  Movie
//
//  Created by Adem Tarhan on 25.06.2022.
//

import Foundation

struct MovieListViewModel{
    let movies : [Movie]
}


extension MovieListViewModel{
    var numberOfSections: Int {
        return movies.count
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return movies.count
    }
    
    func movieAtIndex(_ index: Int) -> MovieViewModel {
        let movie = self.movies[index]
        return MovieViewModel(movie)
    }
}

struct MovieViewModel {
    let movie: Movie
}

extension MovieViewModel{
    init(_ movie: Movie) {
        self.movie = movie
    }
}

extension MovieViewModel{
    var image: String { return ""}
    var name: String {return ""}
    var information: String {return ""}
}

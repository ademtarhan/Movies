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
    var image: String { return self.movie.posterPath}
    var name: String {return self.movie.title}
    var information: String {return self.movie.overview}
}

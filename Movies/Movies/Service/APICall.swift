//
//  APICall.swift
//  Movie
//
//  Created by Adem Tarhan on 25.06.2022.
//

import Foundation
import UIKit

protocol APICallImpl: AnyObject {
    func getData(with url: URL, completionHandler: @escaping ([Movie]?) -> Void)
}

class APICall: APICallImpl, APICallable {
    func getData(with url: URL, completionHandler: @escaping ([Movie]?) -> Void) {
        let url = URL(string: "\(BaseURL)\(APIKey)")!
        
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error---\(error)")
                return
            }
            if let data = data {
                let movie = try? JSONDecoder().decode(MovieList.self, from: data)
                completionHandler(movie?.movieList ?? [])
                print(movie)
            }
        }
        task.resume()
        
        
        
    }
}

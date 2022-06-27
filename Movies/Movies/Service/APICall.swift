//
//  APICall.swift
//  Movie
//
//  Created by Adem Tarhan on 25.06.2022.
//

import Foundation
import UIKit

protocol APICallImpl: AnyObject {
    func getTask(with url: URL, completion: @escaping ([Result]) -> Void)
    var pageNum: ViewControllerImpl? {get set}
    
}

// .. https://api.themoviedb.org/4/list/1?api_key=c51c01d6b237900097f895fb7fd09ed4

class APICall: APICallable {
    var pageNum: ViewControllerImpl?

    func getTask(with url: URL, completion: @escaping ([Result]) -> Void) {
        //for i in 1...10 {
        
           // let endPoint = "\(BaseURL)\(i)?api_key=\(APIKey)"
             let endPoint = "https://api.themoviedb.org/4/list/1?api_key=c51c01d6b237900097f895fb7fd09ed4&page=1"

            guard let safeURLString = endPoint.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
                  let endpointURL = URL(string: safeURLString) else {
                completion([])
                print(MovieError.invalidURL(endPoint))
                return
            }

            URLSession.shared.dataTask(with: endpointURL) { data, _, error in
                guard error == nil else {
                    completion([])
                    print(MovieError.forwarded(error as! Error))
                    return
                }

                guard let responseData = data else {
                    completion([])
                    print(MovieError.invalidPayload(endpointURL))
                    return
                }
                do {
                    let movieResponse = try? JSONDecoder().decode(Movie.self, from: data!)
                    let results = movieResponse?.results
                    
                    completion(results ?? [])
                } catch {
                    completion([])
                    print(MovieError.forwarded(error))
                }
            }.resume()
        }
   // }
}

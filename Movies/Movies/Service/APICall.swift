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
    
    func getData(with url: URL, completionHandler: @escaping ([Movie]?) -> ()) {
        //let url = URL(string: "\(BaseURL)\(APIKey)")!
        print("service18")
        
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completionHandler(nil)
                print("--20service")
            }
            else if let data = data {
               let movieList = try? JSONDecoder().decode(MovieList.self, from: data)
                print("--23service")
                
               
                if let movielist = movieList {
                    completionHandler(movieList?.movieList)
                    print("--28service")
                }
            }
        }.resume()
        
    }
}

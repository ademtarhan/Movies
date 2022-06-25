//
//  MovieError.swift
//  Movies
//
//  Created by Adem Tarhan on 25.06.2022.
//

import Foundation


enum MovieError: Error{
    case invalidURL(String)
    case invalidPayload(URL)
    case forwarded(Error)
}

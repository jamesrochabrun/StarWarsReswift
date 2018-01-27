//
//  ItunesClient.swift
//  ReSwiftStarWars
//
//  Created by James Rochabrun on 1/26/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import Foundation
import PromiseKit

class StarWarsClient: APIReusableClient {
    
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    func getFilms() -> Promise<FilmResults?> {
        return fetch(with: StarWars.films.request, decode: { genericModel -> FilmResults? in
            guard let filmResults = genericModel as? FilmResults else { return nil }
            return filmResults
        })
    }
}







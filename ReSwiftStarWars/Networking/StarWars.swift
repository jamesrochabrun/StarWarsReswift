//
//  StarWars.swift
//  ReSwiftStarWars
//
//  Created by James Rochabrun on 1/26/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import Foundation

enum StarWars {
    case films
}

extension StarWars: Endpoint {
    
    var queryItems: [URLQueryItem] {
        return []
    }
    
    var base: String {
        return "http://swapi.co"
    }
    
    var path: String {
        //switch on the cases of Itunes
        switch self {
        case .films: return "/api/films"
        }
    }
}

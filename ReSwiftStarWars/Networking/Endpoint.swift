//
//  Endpoint.swift
//  ReSwiftStarWars
//
//  Created by James Rochabrun on 1/26/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import Foundation

//MARK: Required variables for protocol creation of endpoint
protocol Endpoint {
    
    var base:  String { get }
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
}

//MARK: Creation of urlComponents
//when creating an Itunes enum instance, that instance will have a urlComponents and request variables access because Itunes confrom to Endpoint
extension Endpoint {
    
    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.path = path
        components.queryItems = queryItems
        return components
    }
    
    var request: URLRequest {
        let url = urlComponents.url! //want to crash if no information is complete
        return URLRequest(url: url)
    }
}












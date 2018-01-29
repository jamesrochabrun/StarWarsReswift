//
//  Films.swift
//  ReSwiftStarWars
//
//  Created by James Rochabrun on 1/26/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import Foundation

struct FilmResults: Codable {
    let results: [Film?]?
}

struct Film: Codable, Modelable {
    let director: String?
    let producer: String?
    let title: String?
    let episodeID: Int?
    let openingCrawl: String?
}

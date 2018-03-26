//
//  Result.swift
//  ReSwiftStarWars
//
//  Created by James Rochabrun on 3/25/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case error(APIError)
}

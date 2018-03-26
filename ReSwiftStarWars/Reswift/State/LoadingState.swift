//
//  LoadingState.swift
//  ReSwiftStarWars
//
//  Created by James Rochabrun on 1/26/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//
import Foundation
import ReSwift

/// Generic Loading State For App states

enum LoadingState<T> {
    
    case notAsked
    case loading
    case loaded(T)
    case error(APIError)
}



//
//  FilmReducer.swift
//  ReSwiftStarWars
//
//  Created by James Rochabrun on 1/26/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import ReSwift

func filmsReducer(action: Action, state: FilmState?) -> FilmState {
    
    switch action {
    case let action as SetFilmsAction:
        return .finished(action.films)
    case _ as LoadingFilmsAction:
        return .loading
    default:
        return .finished([])
    }
}

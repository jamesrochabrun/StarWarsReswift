//
//  FilmReducer.swift
//  ReSwiftStarWars
//
//  Created by James Rochabrun on 1/26/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import ReSwift

func filmsReducer(action: Action, state: LoadingState<[Film]>?) -> LoadingState<[Film]> {

    var localState = state ?? .notAsked
    switch action as? AppAction {
    case nil:
        break
    case .handleLoadPostResult(let result)?:
        switch result {
        case .success(let films):
            localState = .loaded(films)
        case .error(let error):
            localState = .error(error)
        }
    case .handleLoading?:
        localState = .loading
    }
    return localState
}

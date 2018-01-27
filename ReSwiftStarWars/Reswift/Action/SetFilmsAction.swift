//
//  SetFilmsAction.swift
//  ReSwiftStarWars
//
//  Created by James Rochabrun on 1/26/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import Foundation
import ReSwift

/// Action that provides the feed Success
struct SetFilmsAction: Action {
    let films: [Film]
}

/// Action for the loading state Loading
struct LoadingFilmsAction: Action {}

// Action for the error
struct FilmsErrorAction: Action {}

/// Action creator for the request
typealias ActionCreator = (AppState, Store<AppState>) -> Action?

func fetchFilms(with client: StarWarsClient = StarWarsClient()) -> ActionCreator {
    return { state, store in
        client.getFilms().then { filmResults in
            dispatch(filmResults: filmResults)
        }
        return LoadingFilmsAction()
    }
}

/// Helper Promise
private func dispatch(filmResults: FilmResults?) -> [Film] {
    if let filmResults = filmResults,
        let results = filmResults.results {
        return results.flatMap { return $0 }
    } else {
        return []
    }
}







//
//  SetFilmsAction.swift
//  ReSwiftStarWars
//
//  Created by James Rochabrun on 1/26/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import Foundation
import ReSwift


enum AppAction: Action {
    case handleLoadPostResult(Result<[Film]>)
    case handleLoading
}

func fetchFilms(with client: APIReusableClient = StarWarsClient()) -> Store<AppState>.ActionCreator {
    
    return { state, store in
        /// if loading or loaded avoid request
        if case .loading = state.filmState,
            case .loaded = state.filmState {
            return nil
        }
        let c = client as! StarWarsClient
        c.getFilms().then { filmResults in
            store.dispatch(AppAction.handleLoadPostResult(.success(set(filmResults: filmResults))))
        }
        return AppAction.handleLoading
    }
}


/// Helper Promise
private func set(filmResults: FilmResults?) -> [Film] {
    if let filmResults = filmResults,
        let results = filmResults.results {
        return results.flatMap { return $0 }
    } else {
        return [] 
    }
}







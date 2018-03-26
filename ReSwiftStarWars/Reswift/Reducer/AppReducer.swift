//
//  MainReducer.swift
//  ReSwiftStarWars
//
//  Created by James Rochabrun on 1/26/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import ReSwift

func appReducer(action: Action, state: AppState?) -> AppState {
    return AppState(
        /// Navigation
        routingState: routingReducer(action: action, state: state?.routingState),
        /// Films request
        filmState: filmsReducer(action: action, state: state?.filmState)
    )
}

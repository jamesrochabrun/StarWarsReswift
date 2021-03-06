//
//  AppState.swift
//  ReSwiftStarWars
//
//  Created by James Rochabrun on 1/26/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import ReSwift

struct AppState: StateType {
    let routingState: RoutingState
    var filmState: LoadingState<[Film]> = .notAsked
}

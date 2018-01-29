//
//  RoutingReducer.swift
//  ReSwiftStarWars
//
//  Created by James Rochabrun on 1/28/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import Foundation
import ReSwift

func routingReducer(action: Action, state: RoutingState?) -> RoutingState {
    var state = state ?? RoutingState()
    /// The switch checks if the passed action is a RoutingAction. If so, it uses its destination to change the RoutingState, then returns it.
    switch action {
    case let routingAction as RoutingAction:
        state.navigationState = routingAction.destination
    default: break
    }
    return state
}

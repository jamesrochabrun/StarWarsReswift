//
//  RoutingState.swift
//  ReSwiftStarWars
//
//  Created by James Rochabrun on 1/28/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import Foundation
import ReSwift

struct RoutingState: StateType {
    var navigationState: RoutingDestination
    
    init(navState: RoutingDestination = .films) {
        self.navigationState = navState
    }
}

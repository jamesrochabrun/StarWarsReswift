//
//  RoutingAction.swift
//  ReSwiftStarWars
//
//  Created by James Rochabrun on 1/28/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import Foundation
import ReSwift

/// RoutingAction changes the current routing destination.
struct RoutingAction: Action {
    let destination: RoutingDestination
}


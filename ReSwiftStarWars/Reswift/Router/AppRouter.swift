//
//  AppRouter.swift
//  ReSwiftStarWars
//
//  Created by James Rochabrun on 1/28/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import Foundation
import ReSwift

//MAIN CLASS FOR NAVIGATION

//This enum represents all of the view controllers in your app.
//Finally! You have something to store in the app’s State. There’s only one main state structure (AppState in this case), but you can divide the state of the app into sub-states referenced in the main state.

enum RoutingDestination: String {
    case films = "FilmsVC"
    case filmDetail = "FilmDetailVC"
}

//Any class can subscribe to the Store, not just Views. When a class subscribes to the Store, it gets informed of every change that happens in the current state or sub-state. You’ll want to do this on AppRouter so it can change the current screen in the UINavigationController when the routingState changes.

final class AppRouter {
    
    let navigationController: UINavigationController
    
    init(window: UIWindow) {
        navigationController = UINavigationController()
        window.rootViewController = navigationController
        // 1 AppState now subscribes to the global store. In the closure, select indicates you are specifically subscribing to changes in the routingState.
        store.subscribe(self) {
            $0.select {
                $0.routingState
            }
        }
    }
    
    // 2  you’ll recall that pushViewController is called each time a new navigationState is received. This means that you respond to the menu RoutingDestination update by…pushing the menu on again!
    fileprivate func pushViewController(identifier: String, animated: Bool) {
        
        ///You have to dynamically check if the MenuViewController isn’t already visible before pushing:
        let viewController = instantiateViewController(identifier: identifier)
        let newViewControllerType = type(of: viewController)
        if let currentVc = navigationController.topViewController {
            let currentViewControllerType = type(of: currentVc)
            if currentViewControllerType == newViewControllerType {
                return
            }
        }
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    private func instantiateViewController(identifier: String) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifier)
    }
}

// MARK: - StoreSubscriber
// 3 Make the AppRouter conform to StoreSubscriber to get newState callbacks whenever routingState changes.
extension AppRouter: StoreSubscriber {
    
    func newState(state: RoutingState) {
        // 4 You don’t want to animate the root view controller, so check if the current destination to push is the root.
        let shouldAnimate = navigationController.topViewController != nil
        // 5 When the state changes, you push the new destination onto the UINavigationController using the rawValue of state.navigationState, which is the name of the view controller.
        pushViewController(identifier: state.navigationState.rawValue, animated: shouldAnimate)
    }
}






































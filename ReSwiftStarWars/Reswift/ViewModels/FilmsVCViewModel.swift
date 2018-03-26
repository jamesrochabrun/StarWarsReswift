//
//  FilmsVCViewModel.swift
//  ReSwiftStarWars
//
//  Created by James Rochabrun on 3/25/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import Foundation

struct FilmsVCViewModel {
    
    let statusMessage: String?
    let activityIndicatorHidden: Bool
    let films: [Film]
    
    init(_ state: LoadingState<[Film]>) {
        
        switch state {
        case .notAsked:
            statusMessage = nil
            activityIndicatorHidden = true
            films = []
        case .loading:
            statusMessage = nil
            activityIndicatorHidden = false
            films = []
        case .loaded(let films):
            statusMessage = nil
            activityIndicatorHidden = true
            self.films = films
        case .error(let error):
            statusMessage = error.localizedDescription
            activityIndicatorHidden = true
            films = []
        }
    }
}

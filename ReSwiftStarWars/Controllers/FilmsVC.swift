//
//  ViewController.swift
//  ReSwiftStarWars
//
//  Created by James Rochabrun on 1/26/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import UIKit
import ReSwift

class FilmsVC: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        store.subscribe(self) { $0.select { $0.filmState }}
        store.dispatch(fetchFilms())
        
    }
    
    private func setUpTableView() {
        tableView.register(FilmCell.self)
    }
    
    deinit {
        store.unsubscribe(self)
    }}

extension FilmsVC: StoreSubscriber {
    
    func newState(state: FilmState) {
        switch state {
        case .loading:
            print("is loading")
        case .finished(let films):
            print(" the films are \(films)")
        case .error:
            print("error")
        }
    }
}














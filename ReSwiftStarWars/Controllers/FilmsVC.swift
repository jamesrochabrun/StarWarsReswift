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
    
    // MARK: - properties
    var tableDataSource: GenericTableDataSource<FilmCell, Film>?
    
    // MARK: - Action Creator For Request
    lazy var loadFilmsActionCreator: Store<AppState>.ActionCreator = {
        fetchFilms()
    }()
    
    // MARK: - AppLifecycle,subscribe and unsibscribe to store
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        store.dispatch(loadFilmsActionCreator)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Subscribe the store
        store.subscribe(self) { $0.select { $0.filmState }}
        self.updateNavigationState()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        // 3 Unsubscribe, when needed.
        store.unsubscribe(self)
    }
    
    // MARK: - Set Up UI
    private func setUpTableView() {
        tableView.register(FilmCell.self)
    }
    
    // MARK: - Navigation
    private func updateNavigationState() {
        store.dispatch(RoutingAction(destination: .films))
    }
}

// MARK: - StoreSubscriber
extension FilmsVC: StoreSubscriber {
    
    func newState(state: LoadingState<[Film]>) {
        
        /// Initializing the view model
        let vm = FilmsVCViewModel(state)
        // handle UI
        //activInd.isHidden = vm.activityIndicatorHidden
        
        // Update Data Source with models
        guard !vm.films.isEmpty else { return }
        tableDataSource = GenericTableDataSource(models: vm.films) { cell, model in
            cell.textLabel?.text = model.title
            return cell
        }
        tableView.dataSource = tableDataSource
        tableView.reloadData()
    }
}

// MARK: - UITableViewDelegate
extension FilmsVC {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var routeDestination: RoutingDestination = .films
        switch indexPath.row {
        case 0: routeDestination = .filmDetail
        default:
            return
        }
        store.dispatch(RoutingAction(destination: routeDestination))
    }
}














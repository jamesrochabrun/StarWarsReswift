//
//  Reusable.swift
//  ReSwiftStarWars
//
//  Created by James Rochabrun on 1/28/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//
import Foundation
import UIKit

//MARK: Protocol
protocol Reusable {}

//MARK: protocol extension constrained to UITableViewCell
extension Reusable where Self: UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

//MARK: protocol extension constrained to UICollectionViewCell
extension Reusable where Self: UICollectionViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

//MARK: elements conforming to Reusable
extension UICollectionViewCell: Reusable {}
extension UITableViewCell: Reusable {}

//MARK: extending Collections
extension UITableView {
    
    typealias DataSourceCompletionHandler = (Bool) -> ()
    func registerDataSource<T: UITableViewDataSource>(_ _dataSource: T, completion: @escaping DataSourceCompletionHandler) {
        dataSource = _dataSource
        DispatchQueue.main.async {
            self.reloadData()
            completion(true)
        }
    }
    
    func register<T: UITableViewCell>(_ :T.Type) {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            return T()
        }
        return cell
    }
    
    func dequeueReusableCell<T: UITableViewCell>() -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier) as? T else {
            return T()
        }
        return cell
    }
}

extension UICollectionView {
    
    typealias DataSourceCompletionHandler = (Bool) -> ()
    func registerDataSource<T: UICollectionViewDataSource>(_ _dataSource: T, completion: @escaping DataSourceCompletionHandler) {
        dataSource = _dataSource
        DispatchQueue.main.async {
            self.reloadData()
            completion(true)
        }
    }
    
    func register<T: UICollectionViewCell>(_ :T.Type) {
        register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            return T()
        }
        return cell
    }
}

// MARK: - Modelable
protocol Modelable {}

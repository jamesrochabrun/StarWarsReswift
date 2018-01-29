//
//  GenericCollectionDataSource.swift
//  ReSwiftStarWars
//
//  Created by James Rochabrun on 1/28/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import Foundation

import UIKit

/// This class is a mutable, declarative data source for UICollectionView
/// Apart from the current models array, it contains the last models array
/// to give the `CellConfiguration` a chance to calculate and react on differences in state
final class GenericCollectionDataSource<V, T>: NSObject, UICollectionViewDataSource where V: UICollectionViewCell {
    
    typealias CellConfiguration = (V, T) -> V
    
    var models: [T]
    private let configureCell: CellConfiguration
    
    init(models: [T], configureCell: @escaping CellConfiguration) {
        self.models = models
        self.configureCell = configureCell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: V = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        let model = models[indexPath.row]
        return configureCell(cell, model)
    }
}

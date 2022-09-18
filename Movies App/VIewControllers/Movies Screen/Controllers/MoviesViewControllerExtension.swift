//
//  MoviesViewControllerExtension.swift
//  Movies App
//
//  Created by Ahmed Taha on 15/09/2022.
//

import UIKit

extension MoviesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categoriesItem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeue(indexPath: indexPath) as CategoriesCollectionViewCell
        setupCollectionView(cell: cell, index: indexPath.row)
        cell.layer.cornerRadius = 8
        cell.layer.masksToBounds = true
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CategoriesCollectionViewCell
        cell.cellView.backgroundColor = UIColor(named: "AppColor")
        cell.categoryItemName.textColor = .black
    }
    
}

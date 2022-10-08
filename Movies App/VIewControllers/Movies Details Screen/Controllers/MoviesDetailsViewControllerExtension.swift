//
//  MoviesDetailsViewControllerExtension.swift
//  Movies App
//
//  Created by Ahmed Taha on 01/10/2022.
//

import UIKit

extension MoviesDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func setupCollectionView(cell: MovieGenreCollectionViewCell, index: Int) {
        cell.configureCell(model: comingData.genres[index])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        comingData.genres.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(indexPath: indexPath) as MovieGenreCollectionViewCell
        setupCollectionView(cell: cell, index: indexPath.row)
        cell.layer.cornerRadius = 20
        return cell
    }
}

//
//  AllMoviesViewControllerExtension.swift
//  Movies App
//
//  Created by Ahmed Taha on 26/09/2022.
//

import UIKit

// MARK: All Movies collection view implementation.
extension AllMoviesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func setUpCollectionView(cell: AllMoviesCollectionViewCell, index: Int) {
        cell.configureCell(model: allMoviesDataArray[index])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        allMoviesDataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(indexPath: indexPath) as AllMoviesCollectionViewCell
        setUpCollectionView(cell: cell, index: indexPath.row)
        collectionViewCellDesign(cell: cell,
                                 cornerRadius: 15,
                                 borderWidth: 0.5,
                                 borderColor: UIColor(named: "AppColor")!.cgColor,
                                 masksToBounds: true)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let moviesDetailsViewController = MoviesDetailsViewController(nibName: "MoviesDetailsViewController", bundle: nil)
        moviesDetailsViewController.comingData = allMoviesDataArray[indexPath.row]
        navigationController?.pushViewController(moviesDetailsViewController, animated: true)
    }
}

//
//  MoviesViewControllerExtension.swift
//  Movies App
//
//  Created by Ahmed Taha on 15/09/2022.
//

import UIKit
import FSPagerView

// MARK: - CategoriesCollectionView Implementation
extension MoviesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func setupCollectionView(cell: CategoriesCollectionViewCell, index: Int) {
        cell.configureCell(model: categoriesItem[index])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categoriesItem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(indexPath: indexPath) as CategoriesCollectionViewCell
        setupCollectionView(cell: cell, index: indexPath.row)
        cell.layer.cornerRadius = 15
        cell.layer.masksToBounds = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CategoriesCollectionViewCell
        UserDefaults.standard.setValue(categoriesItem[indexPath.row].item, forKey: "genre")
        cell.cellView.backgroundColor = UIColor(named: "AppColor")
        cell.categoryName.textColor = .white
    }
}

// MARK: - PagerView Implementation
extension MoviesViewController: FSPagerViewDataSource, FSPagerViewDelegate {
    
    public func numberOfItems(in pagerView: FSPagerView) -> Int {
        return moviesDataArray.count
    }
    
    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView?.setImage(for: moviesDataArray[index].largeCoverImage)
        cell.imageView?.contentMode = .scaleAspectFit
        cell.imageView?.clipsToBounds = true
        return cell
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        let moviesDetailsViewController = MoviesDetailsViewController(nibName: "MoviesDetailsViewController", bundle: nil)
        moviesDetailsViewController.comingData = moviesDataArray[index]
        navigationController?.pushViewController(moviesDetailsViewController, animated: true)
    }
}

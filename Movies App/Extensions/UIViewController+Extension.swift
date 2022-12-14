//
//  UIViewController+Extension.swift
//  Movies App
//
//  Created by Ahmed Taha on 28/09/2022.
//

import UIKit
import NVActivityIndicatorView

extension UIViewController {
    
    // MARK: CollectionViewCell Design
    func collectionViewCellDesign(cell: UICollectionViewCell, cornerRadius: CGFloat, borderWidth: CGFloat, borderColor: CGColor, masksToBounds: Bool) {
        cell.layer.cornerRadius = cornerRadius
        cell.layer.borderWidth = borderWidth
        cell.layer.borderColor = borderColor
        cell.layer.masksToBounds = masksToBounds
    }
    
    //MARK: Change CollectionView UI Design
    func collectionViewSetupUI(collectionView: UICollectionView) {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 3, leading: 5, bottom: 3, trailing: 5)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.42)), subitem: item, count: 2)
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        collectionView.collectionViewLayout = layout
    }
    
    // MARK: Showing Alert functions
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "Alert!", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.view.tintColor = UIColor(named: "AppColor")
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    
    // MARK: Activity Indicator shape
    func setActivityIndicator(_ activityIndicator: NVActivityIndicatorView) {
        activityIndicator.type = .ballRotateChase
        activityIndicator.color = UIColor(named: "AppColor") ?? .green
    }
    
    //MARK: Set navigation bar title.
    func setNavigationBarTitle(title: String, isLargeTitle: Bool) {
        navigationItem.title = title
        navigationController?.navigationBar.prefersLargeTitles = isLargeTitle
        setNavigationLargeTitleTextAttributes()
        setNavigationtitleTextAttributes()
        navigationController?.navigationBar.tintColor = UIColor(named: "AppColor")

    }
}

private extension UIViewController {
    
    func setNavigationLargeTitleTextAttributes() {
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor(named: "AppColor") ?? .green]
    }
    
    func setNavigationtitleTextAttributes() {
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(named: "AppColor") ?? .green]
    }
}

//MARK: -> Active swipe back between screens.
extension UIViewController {
    func swipeBack() {
        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipe(_ :)))
        swipeGestureRecognizer.direction = .right
        view.addGestureRecognizer(swipeGestureRecognizer)
    }
    
    @objc func swipe( _ gesture: UISwipeGestureRecognizer) {
        self.navigationController?.popViewController(animated: true)
    }
}

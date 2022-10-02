//
//  FavoritesViewControllerExtension.swift
//  Movies App
//
//  Created by Ahmed Taha on 01/10/2022.
//

import UIKit

extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setupFavoriteTableView(cell: FavoritesTableViewCell, index: Int) {
        cell.configureCell(model: favoritesArray[index])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favoritesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue() as FavoritesTableViewCell
        setupFavoriteTableView(cell: cell, index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }
}

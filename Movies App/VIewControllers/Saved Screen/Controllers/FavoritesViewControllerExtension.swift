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
        tableViewCellAnimation(cell, indexPath: indexPath)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let  moviesDetailsViewController = MoviesDetailsViewController(nibName: "MoviesDetailsViewController", bundle: nil)
        moviesDetailsViewController.comingData = favoritesArray[indexPath.row]
        navigationController?.pushViewController(moviesDetailsViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            favoritesArray.remove(at: indexPath.row)
            managedObjectContext.delete(coreDataArray[indexPath.row])
            do {
                try managedObjectContext.save()
            } catch let error as NSError {
                print(error.localizedDescription)
            }
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

// MARK: -> Add Animation for FavoritesViewController
extension FavoritesViewController {
    
    // MARK: TableView Animation
    func tableViewCellAnimation(_ cell: UITableViewCell, indexPath: IndexPath) {
        cell.transform = CGAffineTransform(translationX: 0, y: cell.contentView.frame.height)
        UIView.animate(withDuration: 0.5, delay: 0.05 * Double(indexPath.row), animations: {
              cell.transform = CGAffineTransform(translationX: cell.contentView.frame.width, y: cell.contentView.frame.height)
        })
    }
}

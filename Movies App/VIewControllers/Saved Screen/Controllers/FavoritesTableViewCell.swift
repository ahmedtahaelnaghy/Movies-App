//
//  FavoritesTableViewCell.swift
//  Movies App
//
//  Created by Ahmed Taha on 01/10/2022.
//

import UIKit
import Cosmos

class FavoritesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var favoriteMovieImage: UIImageView!
    @IBOutlet weak var favoriteMovieName: UILabel!
    @IBOutlet weak var favoriteMovieRate: CosmosView!
    @IBOutlet weak var contentDetailsView: UIView!
    
    func configureCell(model: FavoritesModel) {
        favoriteMovieName.text = model.name
        favoriteMovieRate.rating = model.rating / 2
        favoriteMovieImage.image = UIImage(data: model.image)
    }
}

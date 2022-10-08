//
//  AllMoviesCollectionViewCell.swift
//  Movies App
//
//  Created by Ahmed Taha on 26/09/2022.
//

import UIKit
import Cosmos

class AllMoviesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var moviesImage: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieRate: CosmosView!
    
    
    func configureCell(model: Movie) {
        moviesImage.setImage(for: "\(model.largeCoverImage)")
        movieName.text = model.title
        movieRate.rating = (model.rating / 2)
    }
}

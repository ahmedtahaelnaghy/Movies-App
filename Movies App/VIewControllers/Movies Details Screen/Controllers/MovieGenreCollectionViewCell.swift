//
//  MovieGenreCollectionViewCell.swift
//  Movies App
//
//  Created by Ahmed Taha on 01/10/2022.
//

import UIKit

class MovieGenreCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var movieGenre: UILabel!
    
    func configureCell(model: String) {
        movieGenre.text = model
    }
}

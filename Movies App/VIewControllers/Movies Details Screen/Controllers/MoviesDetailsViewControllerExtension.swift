//
//  MoviesDetailsViewControllerExtension.swift
//  Movies App
//
//  Created by Ahmed Taha on 01/10/2022.
//

import UIKit

extension MoviesDetailsViewController {
    
    func favoriteBtnDesign() {
        favoriteBtn.layer.cornerRadius = favoriteBtn.frame.height / 2
    }
    
    // MARK: short details views design
    func viewSetupDesign() {
        let viewsArray = [ratingView, releasedYearView, durationView]
        _ = viewsArray.map {
            $0!.layer.cornerRadius = 20
            $0!.layer.borderWidth = 1
            $0!.layer.borderColor = UIColor(named: "AppColor")?.cgColor ?? UIColor.green.cgColor
        }
    }
    
    func setDataInViewController() {
        movieRating.text = "\(comingData.rating / 2)/5"
        movieReleasedYear.text = "\(comingData.year)"
        movieDuration.text = "\(comingData.runtime) min"
        movieName.text = comingData.title
        movieDescription.text = comingData.summary
        movieImage.sd_setImage(with: URL(string: "\(comingData.largeCoverImage)"),
                               placeholderImage: UIImage(named: "placeholder.png"))
    }
}

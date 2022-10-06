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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tableViewCellContentDesign(view: [contentDetailsView, favoriteMovieImage], cornerRadius: 30, borderWidth: 0.5, masksToBounds: true, borderColor: UIColor(named: "AppColor") ?? .green)
    }
    
    func configureCell(model: FavoritesModel) {
        favoriteMovieName.text = model.name
        favoriteMovieRate.rating = model.rating / 2
        favoriteMovieImage.image = UIImage(data: model.image)
    }
    
    // MARK: TableViewCell Design
    func tableViewCellContentDesign(view: [AnyObject], cornerRadius: CGFloat? = nil, borderWidth: CGFloat? = nil, masksToBounds: Bool? = nil, borderColor: UIColor? = nil) {
        _ = view.map {
            $0.layer.cornerRadius = cornerRadius ?? 0
            $0.layer.borderWidth = borderWidth ?? 0
            $0.layer.borderColor = borderColor?.cgColor
            $0.layer.masksToBounds = masksToBounds ?? false
        }
    }
}

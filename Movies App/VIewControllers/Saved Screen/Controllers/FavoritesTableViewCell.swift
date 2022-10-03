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
        tableViewCellContentDesign(view: contentDetailsView, cornerRadius: 30, borderWidth: 0.5, borderColor: UIColor(named: "AppColor") ?? .green)
        tableViewCellContentDesign(view: favoriteMovieImage, cornerRadius: 25, masksToBounds: true)
    }
    
    func configureCell(model: FavoritesModel) {
        favoriteMovieName.text = model.name
        favoriteMovieRate.rating = model.rating / 2
        favoriteMovieImage.image = UIImage(data: model.image)
    }
    
    // MARK: TableViewCell Design
    func tableViewCellContentDesign(view: AnyObject, cornerRadius: CGFloat? = nil, borderWidth: CGFloat? = nil, masksToBounds: Bool? = nil, borderColor: UIColor? = nil) {
        view.layer.cornerRadius = cornerRadius ?? 0
        view.layer.borderWidth = borderWidth ?? 0
        view.layer.borderColor = borderColor?.cgColor
        view.layer.masksToBounds = masksToBounds ?? false
    }
}

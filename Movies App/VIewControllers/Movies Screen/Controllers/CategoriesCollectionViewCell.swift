//
//  CategoriesCollectionViewCell.swift
//  Movies App
//
//  Created by Ahmed Taha on 15/09/2022.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var cellView: UIView!

    func configureCell(model: CategoriesItem) {
        categoryName.text = model.item
    }
}

//
//  CategoriesCollectionViewCell.swift
//  Movies App
//
//  Created by Ahmed Taha on 15/09/2022.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryItemName: UILabel!
    @IBOutlet weak var cellView: UIView!

    func configureCell(model: CategoriesItem) {
        categoryItemName.text = model.item
    }
}

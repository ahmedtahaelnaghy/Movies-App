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
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }
    func configerCell(model: CategoriesItem) {
        categoryItemName.text = model.item
        print(model.item)
    }

}

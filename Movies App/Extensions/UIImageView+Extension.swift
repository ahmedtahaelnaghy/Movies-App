//
//  UIImageView+Extension.swift
//  Movies App
//
//  Created by Ahmed Taha on 08/10/2022.
//

import UIKit
import SDWebImage
import Kingfisher

// Dowanload image wrapper
extension UIImageView {
    
    func setImage(for linkString: String?, _ placeholder: UIImage? = UIImage(named: "placeholder.png")) {
        guard let linkString,
              let url = URL(string: linkString) else { return }
        sd_setImage(with: url, placeholderImage: placeholder) { [weak self] image, error, _, _ in
            guard let image else {
                self?.image = placeholder
                return
            }
            self?.image = image
        }
    }
    
    func setImageByKF(for linkString: String?) {
        guard let linkString,
              let url = URL(string: linkString) else { return }
        kf.setImage(with: url)
    }
}

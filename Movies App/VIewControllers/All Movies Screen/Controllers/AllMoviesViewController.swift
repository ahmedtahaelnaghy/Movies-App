//
//  AllMoviesViewController.swift
//  Movies App
//
//  Created by Ahmed Taha on 26/09/2022.
//

import UIKit
import NVActivityIndicatorView

class AllMoviesViewController: UIViewController {

    @IBOutlet weak var allMoviesCollectionView: UICollectionView!
    
    @IBOutlet weak var activityIndicatorView: NVActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicatorView.type = .ballRotateChase
        activityIndicatorView.color = UIColor(named: "AppColor") ?? .red
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        
        
    }
}

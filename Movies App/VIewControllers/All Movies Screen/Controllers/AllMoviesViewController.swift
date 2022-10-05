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
    
    var allMoviesDataArray = [Movie]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "All Movies"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(named: "AppColor") ?? .green]
        
        allMoviesCollectionView.register(cells: [AllMoviesCollectionViewCell.self])
        collectionViewSetupUI(collectionView: allMoviesCollectionView)
        activityIndicatorView.type = .ballRotateChase
        activityIndicatorView.color = UIColor(named: "AppColor") ?? .green
        allMoviesCollectionView.delegate = self
        allMoviesCollectionView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        activityIndicatorView.startAnimating()
        MovieAPI().getData { [self] (result) in
            activityIndicatorView.stopAnimating()
            switch result {
            case .success(let comingData):
                allMoviesDataArray = comingData!.data.movies
                allMoviesCollectionView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

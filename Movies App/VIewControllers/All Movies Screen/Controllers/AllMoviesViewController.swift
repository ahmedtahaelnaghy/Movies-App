//
//  AllMoviesViewController.swift
//  Movies App
//
//  Created by Ahmed Taha on 26/09/2022.
//

import UIKit
import SkeletonView
import NVActivityIndicatorView

class AllMoviesViewController: UIViewController {

    @IBOutlet weak var allMoviesCollectionView: UICollectionView!
    @IBOutlet weak var activityIndicatorView: NVActivityIndicatorView!
    
    var allMoviesDataArray = [Movie]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarTitle(title: "Movies", isLargeTitle: true)
        allMoviesCollectionView.register(cells: [AllMoviesCollectionViewCell.self])
        collectionViewSetupUI(collectionView: allMoviesCollectionView)
        setActivityIndicator(activityIndicatorView)
        allMoviesCollectionView.delegate = self
        allMoviesCollectionView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchDataFromAPI()
    }
}

// MARK: -> Fetch data from API and add Activity Indicator
extension AllMoviesViewController {
    
    func fetchDataFromAPI() {
        activityIndicatorView.startAnimating()
        MovieAPI().getData(genreName: "") { [self] (result) in
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

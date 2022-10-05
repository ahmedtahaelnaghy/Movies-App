//
//  MoviesViewController.swift
//  Movies App
//
//  Created by Ahmed Taha on 11/09/2022.
//

import UIKit
import FSPagerView
import SDWebImage
import NVActivityIndicatorView
import Cosmos

class MoviesViewController: UIViewController {
    
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    @IBOutlet weak var activityIndicatorView: NVActivityIndicatorView!
    @IBOutlet weak var bestMovieImage: UIImageView!
    @IBOutlet weak var bestMovieName: UILabel!
    @IBOutlet weak var bestMovieRate: CosmosView!
    @IBOutlet weak var bestMovieDescription: UILabel!
    
    @IBOutlet weak var pagerView: FSPagerView! {
        didSet {
            self.pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
            let transform = CGAffineTransform(scaleX: 0.44, y: 1)
            self.pagerView.itemSize = self.pagerView.frame.size.applying(transform)
            self.pagerView.decelerationDistance = FSPagerView.automaticDistance
            pagerView.transformer = FSPagerViewTransformer(type: .overlap)
        }
    }
    
    var moviesDataArray = [Movie]()
    var categoriesItem: [CategoriesItem] = [
                                            CategoriesItem(item: "All"),
                                            CategoriesItem(item: "Action"),
                                            CategoriesItem(item: "Animation"),
                                            CategoriesItem(item: "Biography"),
                                            CategoriesItem(item: "Comedy"),
                                            CategoriesItem(item: "Crime"),
                                            CategoriesItem(item: "Documentary"),
                                            CategoriesItem(item: "Drama"),
                                            CategoriesItem(item: "Family"),
                                            CategoriesItem(item: "Fantasy"),
                                            CategoriesItem(item: "Horror"),
                                            CategoriesItem(item: "Music"),
                                            CategoriesItem(item: "Mystery"),
                                            CategoriesItem(item: "Romance"),
                                            CategoriesItem(item: "Thriller"),
                                            CategoriesItem(item: "Western")
                                           ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Home"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(named: "AppColor") ?? .green]
        
        bestMovieImage.layer.cornerRadius = 25
        categoriesCollectionView.register(cells: [CategoriesCollectionViewCell.self])
        activityIndicatorView.type = .ballRotateChase
        activityIndicatorView.color = UIColor(named: "AppColor") ?? .red
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        pagerView.delegate = self
        pagerView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        activityIndicatorView.startAnimating()
        MovieAPI().getData { [self] result in
            activityIndicatorView.stopAnimating()
            switch result {
            case .success(let comingData):
                moviesDataArray = comingData!.data.movies
                pagerView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
            
            bestMovieImage.sd_setImage(with: URL(string: "\(moviesDataArray[5].largeCoverImage)"),
                                       placeholderImage: UIImage(named: "placeholder.png"))
            bestMovieName.text = moviesDataArray[5].title
            bestMovieRate.rating = (moviesDataArray[5].rating / 2)
            bestMovieDescription.text = moviesDataArray[5].summary
        }
    }
}

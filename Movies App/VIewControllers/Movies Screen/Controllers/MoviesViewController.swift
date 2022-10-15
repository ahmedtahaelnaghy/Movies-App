//
//  MoviesViewController.swift
//  Movies App
//
//  Created by Ahmed Taha on 11/09/2022.
//

import UIKit
import FSPagerView
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
    var sortedMoviesArray = [Movie]()
    var categoriesItem: [CategoriesItem] = [
                                            CategoriesItem(item: "All"),
                                            CategoriesItem(item: "Action"),
                                            CategoriesItem(item: "Adventure"),
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
                                            CategoriesItem(item: "Sci-Fi"),
                                            CategoriesItem(item: "Thriller"),
                                            CategoriesItem(item: "Western")
                                           ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarTitle(title: "Popular Now", isLargeTitle: true)
        bestMovieImage.layer.cornerRadius = 25
        categoriesCollectionView.register(cells: [CategoriesCollectionViewCell.self])
        setActivityIndicator(activityIndicatorView)
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        pagerView.delegate = self
        pagerView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        activityIndicatorView.startAnimating()
        MovieAPI().getData(genreName: "") { [self] result in
            activityIndicatorView.stopAnimating()
            switch result {
            case .success(let comingData):
                moviesDataArray = comingData!.data.movies
                pagerView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
            setTopMovieItems()
        }
    }

    @IBAction func TopRatingMovieTapped(_ sender: Any) {
        let moviesDetailsViewController = MoviesDetailsViewController(nibName: "MoviesDetailsViewController", bundle: nil)
        moviesDetailsViewController.comingData = sortedMoviesArray[sortedMoviesArray.count - 1]
        navigationController?.pushViewController(moviesDetailsViewController, animated: true)
    }
}

//MARK: -> Sorting coming data by rating and choose the top rate movie then display this movie in view controller.
extension MoviesViewController {
    
    func setTopMovieItems() {
        sortedMoviesArray = moviesDataArray.sorted {
            $0.rating < $1.rating
        }
        let arrayCount = sortedMoviesArray.count - 1
        bestMovieImage.setImageByKF(for: sortedMoviesArray[arrayCount].largeCoverImage)
        bestMovieName.text = sortedMoviesArray[arrayCount].title
        bestMovieRate.rating = (sortedMoviesArray[arrayCount].rating / 2)
        print(sortedMoviesArray[arrayCount].rating / 2)
        bestMovieDescription.text = sortedMoviesArray[arrayCount].summary
    }
}

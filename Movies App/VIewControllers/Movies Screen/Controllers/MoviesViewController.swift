//
//  MoviesViewController.swift
//  Movies App
//
//  Created by Ahmed Taha on 11/09/2022.
//

import UIKit
import FSPagerView
import SDWebImage

class MoviesViewController: UIViewController,FSPagerViewDataSource,FSPagerViewDelegate {

    fileprivate let transformerTypes: [FSPagerViewTransformerType] = [.crossFading,
                                                                      .zoomOut,
                                                                      .depth,
                                                                      .linear,
                                                                      .overlap,
                                                                      .ferrisWheel,
                                                                      .invertedFerrisWheel,
                                                                      .coverFlow,
                                                                      .cubic]
    fileprivate var typeIndex = 0 {
        didSet {
            let type = self.transformerTypes[typeIndex]
            self.pagerView.transformer = FSPagerViewTransformer(type:type)
            switch type {
            case .crossFading, .zoomOut, .depth:
                self.pagerView.itemSize = FSPagerView.automaticSize
                self.pagerView.decelerationDistance = 1
            case .linear, .overlap:
                let transform = CGAffineTransform(scaleX: 0.44, y: 1)
                self.pagerView.itemSize = self.pagerView.frame.size.applying(transform)
                self.pagerView.decelerationDistance = FSPagerView.automaticDistance
            case .ferrisWheel, .invertedFerrisWheel:
                self.pagerView.itemSize = CGSize(width: 180, height: 140)
                self.pagerView.decelerationDistance = FSPagerView.automaticDistance
            case .coverFlow:
                self.pagerView.itemSize = CGSize(width: 220, height: 170)
                self.pagerView.decelerationDistance = FSPagerView.automaticDistance
            case .cubic:
                let transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
                self.pagerView.itemSize = self.pagerView.frame.size.applying(transform)
                self.pagerView.decelerationDistance = 1
            }
        }
    }
    
    @IBOutlet weak var pagerView: FSPagerView! {
        didSet {
            self.pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
            self.typeIndex = 4
        }
    }
    
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    var moviesDataArray = [Movie]()
    var moviesImagesArray = [String]()
    
    var categoriesItem: [CategoriesItem] = [
                                            CategoriesItem(item: "All"),
                                            CategoriesItem(item: "Drama"),
                                            CategoriesItem(item: "Action"),
                                            CategoriesItem(item: "Comedy")
                                           ]
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let index = self.typeIndex
        self.typeIndex = index // Manually trigger didSet
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoriesCollectionView.register(cells: [CategoriesCollectionViewCell.self])
        
        

        
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        pagerView.delegate = self
        pagerView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        indicator.startAnimating()
        MovieAPI().getData { [self] result in
            switch result {
            case .success(let result):
                guard let result = result else {return}
                let data = result.data
                for movie in data.movies {
                    moviesDataArray.append(movie)
                    moviesImagesArray.append(movie.largeCoverImage)
                    pagerView.reloadData()
                    indicator.stopAnimating()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    func setupCollectionView(cell: CategoriesCollectionViewCell, index: Int) {
        cell.configerCell(model: categoriesItem[index])
    }
    
    // MARK:- FSPagerViewDataSource
    
    public func numberOfItems(in pagerView: FSPagerView) -> Int {
        return moviesImagesArray.count
    }
    
    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView?.sd_setImage(with: URL(string: "\(moviesImagesArray[index])"), placeholderImage: UIImage(named: "placeholder.png"))
        cell.imageView?.contentMode = .scaleAspectFit
        cell.imageView?.clipsToBounds = true
        return cell
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        pagerView.deselectItem(at: index, animated: true)
        pagerView.scrollToItem(at: index, animated: true)
    }
    
}

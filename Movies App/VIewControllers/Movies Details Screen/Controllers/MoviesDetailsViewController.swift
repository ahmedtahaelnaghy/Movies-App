//
//  MoviesDetailsViewController.swift
//  Movies App
//
//  Created by Ahmed Taha on 27/09/2022.
//

import UIKit
import SDWebImage
import CoreData

class MoviesDetailsViewController: UIViewController {
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var movieReleasedYear: UILabel!
    @IBOutlet weak var movieDuration: UILabel!
    @IBOutlet weak var ratingView: UIView!
    @IBOutlet weak var releasedYearView: UIView!
    @IBOutlet weak var durationView: UIView!
    @IBOutlet weak var favoriteBtn: UIButton!
    @IBOutlet weak var moviesGenreCollectionView: UICollectionView!
    
    var comingData: Movie!
    var genderArray: String!
    var managedObjectContext: NSManagedObjectContext!
    var appDelegate: AppDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarTitle(title: "Details", isLargeTitle: false)
        appDelegate = (UIApplication.shared.delegate as! AppDelegate)
        managedObjectContext = appDelegate.persistentContainer.viewContext
        viewSetupDesign()
        setDataInViewController()
        favoriteBtnDesign()
    }
    
    @IBAction func favoriteTaped(_ sender: Any) {
        coreDataSaving()
    }
    
    func coreDataSaving() {
        let movieImage = movieImage.image?.pngData()
        let movieName = movieName.text
        let movieRating = comingData.rating
        let entity = NSEntityDescription.entity(forEntityName: "FavoriteMoviesEntity", in: managedObjectContext)!
        let movie = NSManagedObject(entity: entity, insertInto: managedObjectContext)
        movie.setValue(movieImage, forKey: "image")
        movie.setValue(movieName, forKey: "name")
        movie.setValue(movieRating, forKey: "rating")
        movie.setValue(true, forKey: "isFavorite")
        do {
            try managedObjectContext.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}

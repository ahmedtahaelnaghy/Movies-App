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
        appDelegate = (UIApplication.shared.delegate as! AppDelegate)
        managedObjectContext = appDelegate.persistentContainer.viewContext
        navigationBarItemsSetup()
        viewSetupDesign()
        setDetailsDataInViewController()
        favoriteBtnDesign()
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        chekInCoreData()
    }
    
    @IBAction func favoriteTaped(_ sender: Any) {
        coreDataSaving()
    }
    
    
    func chekInCoreData() {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FavoriteMoviesEntity")
        let predicate = NSPredicate(format: "name == %@", comingData.title)
        fetchRequest.predicate = predicate
        do {
            let movie = try managedObjectContext.fetch(fetchRequest)
            let name = movie[0].value(forKey: "name")
        } catch let error as NSError {
            print("NNNNNNNNNNNNNN")
        }
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


extension MoviesDetailsViewController {
    
    private func navigationBarItemsSetup() {
        navigationItem.title = "Details"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(named: "AppColor") ?? .green]
        navigationController?.navigationBar.tintColor = UIColor(named: "AppColor")
    }
    
    private func favoriteBtnDesign() {
        favoriteBtn.layer.cornerRadius = favoriteBtn.frame.height / 2
    }
    
    private func viewSetupDesign() {
        let viewsArray = [ratingView, releasedYearView, durationView]
        _ = viewsArray.map {
            $0!.layer.cornerRadius = 20
            $0!.layer.borderWidth = 1
            $0!.layer.borderColor = UIColor(named: "AppColor")?.cgColor ?? UIColor.green.cgColor
        }
    }
    
    private func setDetailsDataInViewController() {
        movieRating.text = "\(comingData.rating / 2)/5"
        movieReleasedYear.text = "\(comingData.year)"
        movieDuration.text = "\(comingData.runtime) min"
        movieName.text = comingData.title
        movieDescription.text = comingData.summary
        movieImage.sd_setImage(with: URL(string: "\(comingData.largeCoverImage)"),
                               placeholderImage: UIImage(named: "placeholder.png"))
    }
}

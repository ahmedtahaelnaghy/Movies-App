//
//  FavoritesViewController.swift
//  Movies App
//
//  Created by Ahmed Taha on 18/09/2022.
//

import UIKit
import CoreData

class FavoritesViewController: UIViewController {

    @IBOutlet weak var favoritesTableView: UITableView!
    
    var appDelegate: AppDelegate!
    var managedObjectContext: NSManagedObjectContext!
    var favoritesArray = [FavoritesModel]()
    var coreDataArray = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarTitle(title: "Favorites", isLargeTitle: true)
        appDelegate = (UIApplication.shared.delegate as! AppDelegate)
        managedObjectContext = appDelegate.persistentContainer.viewContext
        favoritesTableView.register(UINib(nibName: "FavoritesTableViewCell", bundle: nil),
                                    forCellReuseIdentifier: "FavoritesTableViewCell")
        favoritesTableView.delegate = self
        favoritesTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let fetchData = NSFetchRequest<NSManagedObject>(entityName: "FavoriteMoviesEntity")
        do {
            favoritesArray.removeAll()
            coreDataArray = try managedObjectContext.fetch(fetchData)
            for movie in coreDataArray {
                guard let id = movie.value(forKey: "id") as? Int else { return }
                guard let image = movie.value(forKey: "image") as? Data else { return }
                guard let name = movie.value(forKey: "name") as? String else { return }
                guard let rating = movie.value(forKey: "rating") as? Double else { return }
                guard let summary = movie.value(forKey: "summary") as? String else { return }
                guard let runtime = movie.value(forKey: "runtime") as? Int else { return }
                guard let year = movie.value(forKey: "year") as? Int else { return }
                guard let isFavorite = movie.value(forKey: "isFavorite") as? Bool else { return }
                let movieObject = FavoritesModel(id: id, image: image, name: name, rating: rating, summary: summary, runtime: runtime, year: year, isFavorite: isFavorite)
                favoritesArray.append(movieObject)
            }
            favoritesTableView.reloadData()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}

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
                let image = movie.value(forKey: "image") as! Data
                let name = movie.value(forKey: "name") as! String
                let rating = movie.value(forKey: "rating") as! Double
                let movieObject = FavoritesModel(image: image, name: name, rating: rating)
                favoritesArray.append(movieObject)
            }
            favoritesTableView.reloadData()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}

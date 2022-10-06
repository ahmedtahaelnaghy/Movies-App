//
//  TabBarController.swift
//  Movies App
//
//  Created by Ahmed Taha on 18/09/2022.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    let moviesViewController = MoviesViewController(nibName: "MoviesViewController", bundle: nil)
    let allMoviesViewController = AllMoviesViewController(nibName: "AllMoviesViewController", bundle: nil)
    let favoritesViewController = FavoritesViewController(nibName: "FavoritesViewController", bundle: nil)
    let profileViewController = ProfileViewController(nibName: "ProfileViewController", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let controllers = [
                           moviesViewController,
                           allMoviesViewController,
                           favoritesViewController,
                           profileViewController
                          ]
        
        setTabBarItems(controllers)
        tabBarItemsColor()
        setNavigationControllerToTabBarScreens(controllers)
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        SimpleAnnimationWhenSelectItem(item)
    }
    
    // MARK: Add and show items in tabBar
    func setTabBarItems(_ controllers: [UIViewController]) {
        moviesViewController.tabBarItem = UITabBarItem (title: nil,
                                                image: UIImage(named: "Home"),
                                                selectedImage: UIImage(named: "Home"))

        allMoviesViewController.tabBarItem = UITabBarItem (title: nil,
                                                image: UIImage(named: "Categories"),
                                                selectedImage: UIImage(named: "Categories"))
        
        favoritesViewController.tabBarItem = UITabBarItem (title: nil,
                                                image: UIImage(named: "Favorite"),
                                                selectedImage: UIImage(named: "Favorite"))
        
        profileViewController.tabBarItem = UITabBarItem (title: nil,
                                                image: UIImage(named: "Profile"),
                                                selectedImage: UIImage(named: "Profile"))
        
        self.setViewControllers(controllers, animated: false)
    }
    
    // MARK: Set tabBar Items color
    func tabBarItemsColor() {
        tabBar.tintColor = UIColor(named: "AppColor")
    }
    
    // MARK: Set Navigation to all screens in tabBAr
    func setNavigationControllerToTabBarScreens(_ controllers: [UIViewController]) {
        viewControllers = controllers.map { UINavigationController(rootViewController: $0) }
    }
    
    // MARK: TabBar items animation when an item tapped
    func SimpleAnnimationWhenSelectItem(_ item: UITabBarItem){
        guard let barItemView = item.value(forKey: "view") as? UIView else { return }
        let timeInterval: TimeInterval = 0.3
        let propertyAnimator = UIViewPropertyAnimator(duration: timeInterval, dampingRatio: 0.5) {
            barItemView.transform = CGAffineTransform.identity.scaledBy(x: 0.9, y: 0.9)
        }
        propertyAnimator.addAnimations({ barItemView.transform = .identity }, delayFactor: CGFloat(timeInterval))
        propertyAnimator.startAnimation()
    }
}

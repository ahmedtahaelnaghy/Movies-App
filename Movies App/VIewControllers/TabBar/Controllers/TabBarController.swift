//
//  TabBarController.swift
//  Movies App
//
//  Created by Ahmed Taha on 18/09/2022.
//

import UIKit

final class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    let moviesViewController = MoviesViewController(nibName: "MoviesViewController", bundle: nil)
    let allMoviesViewController = AllMoviesViewController(nibName: "AllMoviesViewController", bundle: nil)
    let favoritesViewController = FavoritesViewController(nibName: "FavoritesViewController", bundle: nil)
    let profileViewController = ProfileViewController(nibName: "ProfileViewController", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = UIColor(named: "AppColor")
        setTabBar()
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        SimpleAnnimationWhenSelectItem(item)
    }
    
    // MARK: Add navigation to all screens and set images in all tabs.
    func setTabBar() {
        let controllers = [
                            moviesViewController,
                            allMoviesViewController,
                            favoritesViewController,
                            profileViewController
                          ]
        
        viewControllers = controllers.map { UINavigationController(rootViewController: $0) }
        
        setTabBarItem(for: 0, image: "Home", selectedImage: "Home")
        setTabBarItem(for: 1, image: "Categories", selectedImage: "Categories")
        setTabBarItem(for: 2, image: "Favorite", selectedImage: "Favorite")
        setTabBarItem(for: 3, image: "Profile", selectedImage: "Profile")
    }
    
    // MARK: Set tabBar image and selected image.
    func setTabBarItem(for index: Int, image: String, selectedImage: String) {
        tabBar.items?[index].image = UIImage(named: image)
        tabBar.items?[index].selectedImage = UIImage(named: selectedImage)
    }
    
    // MARK: TabBar items animation when an item tapped
    func SimpleAnnimationWhenSelectItem(_ item: UITabBarItem) {
        guard let barItemView = item.value(forKey: "view") as? UIView else { return }
        let timeInterval: TimeInterval = 0.3
        let propertyAnimator = UIViewPropertyAnimator(duration: timeInterval, dampingRatio: 0.5) {
            barItemView.transform = CGAffineTransform.identity.scaledBy(x: 0.9, y: 0.9)
        }
        propertyAnimator.addAnimations({ barItemView.transform = .identity }, delayFactor: CGFloat(timeInterval))
        propertyAnimator.startAnimation()
    }
}

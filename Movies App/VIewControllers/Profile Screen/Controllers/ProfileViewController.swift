//
//  ProfileViewController.swift
//  Movies App
//
//  Created by Ahmed Taha on 18/09/2022.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Profile"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(named: "AppColor") ?? .green]
    }
}

//
//  ProfileViewController.swift
//  Movies App
//
//  Created by Ahmed Taha on 18/09/2022.
//

import UIKit

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileNameTF: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        setupBorders(for: saveBtn)
        setNavigationBarTitle(title: "Profile", isLargeTitle: false)
        textFieldDesign(for: profileNameTF)
        imageDesign(for: profileImage)
    }
    
    @IBAction func openGalleryTapped(_ sender: Any) {
        present(imagePicker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            profileImage.image = selectedImage
        }
        dismiss(animated: true)
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        let image = String(describing: profileImage.image)
        let name = profileNameTF.text
        UserDefaults.standard.setValue(image, forKey: "image")
        UserDefaults.standard.setValue(name, forKey: "name")
    }
}

extension ProfileViewController {
    func textFieldDesign(for texteField: UITextField) {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        texteField.leftView = view
        texteField.leftViewMode = .always
        setupBorders(for: texteField)
    }
    func setupBorders(for item: AnyObject) {
        item.layer.borderWidth = 1.25
        item.layer.cornerRadius = 20
        item.layer.borderColor = UIColor(named: "AppColor")?.cgColor
    }
    
    func imageDesign(for image: UIImageView) {
        image.layer.cornerRadius = profileImage.frame.height / 2
    }
    
}

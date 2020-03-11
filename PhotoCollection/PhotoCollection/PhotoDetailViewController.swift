//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by krikaz on 3/10/20.
//  Copyright © 2020 thewire. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    var imagePicker = UIImagePickerController()

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    @IBAction func addPhoto(_ sender: UIButton) {
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func savePhoto(_ sender: UIBarButtonItem) {
        if let title = descriptionTextField.text, let imageData = photoImageView.image?.pngData() {
            if let photo = photo {
                photoController?.update(photo: photo, imageData: imageData, title: title)
            } else {
                photoController?.create(imageData: imageData, title: title)
            }
        }
        navigationController?.popViewController(animated: true)
    }
    
    func setTheme() {
        guard let themeHelper = themeHelper else { return }
        guard let themePreference = themeHelper.themePreference else { return }
        switch themePreference {
        case "Blue":
            self.view.backgroundColor = .blue
        default:
            self.view.backgroundColor = .darkGray
        }
    }
    
    func updateViews() {
        guard let photo = photo else { return }
        let image = UIImage(data: photo.imageData)
        photoImageView.image = image
        descriptionTextField.text = photo.title
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setTheme()
        updateViews()
        
        imagePicker.delegate = self
    }
    

}

extension PhotoDetailViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            photoImageView.image = pickedImage
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    
}

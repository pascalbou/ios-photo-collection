//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by krikaz on 3/10/20.
//  Copyright © 2020 thewire. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    func setTheme() {
        guard let themePreference = themeHelper.themePreference else { return }
        switch themePreference {
        case "Blue":
            self.view.backgroundColor = .blue
        default:
            self.view.backgroundColor = .darkGray
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setTheme()
        collectionView.reloadData()
    }

    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell() }
    
        let photo = photoController.photos[indexPath.item]
        cell.photo = photo
    
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "AddPhotoSegue":
            if let destinationVC = segue.destination as? PhotoDetailViewController {
                destinationVC.themeHelper = themeHelper
                destinationVC.photoController = photoController
            }
        case "DetailPhotoSegue":
            if let destinationVC = segue.destination as? PhotoDetailViewController, let cell = sender as? PhotosCollectionViewCell {
                destinationVC.themeHelper = themeHelper
                destinationVC.photoController = photoController
                destinationVC.photo = cell.photo
            }
        case "ThemeSegue":
            if let destinationVC = segue.destination as? ThemeSelectionViewController {
                destinationVC.themeHelper = themeHelper
            }
        default:
            return
        }
    }

}

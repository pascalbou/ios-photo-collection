//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by krikaz on 3/10/20.
//  Copyright © 2020 thewire. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoLabel: UILabel!
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let photo = photo else { return }
        photoImageView.image = UIImage(data: photo.imageData)
        photoLabel.text = photo.title
    }
    
}

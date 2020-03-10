//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by krikaz on 3/10/20.
//  Copyright © 2020 thewire. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    func create(imageData: Data, title: String) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
    }
    
    func update(photo: Photo, imageData: Data, title: String) {
        guard let index = photos.firstIndex(of: photo) else { return }
        photos[index].imageData = imageData
        photos[index].title = title
    }
}

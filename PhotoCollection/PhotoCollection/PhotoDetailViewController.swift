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

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    @IBAction func addPhoto(_ sender: UIButton) {
    }
    
    @IBAction func savePhoto(_ sender: UIBarButtonItem) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

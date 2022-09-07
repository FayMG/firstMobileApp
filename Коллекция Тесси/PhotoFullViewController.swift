//
//  PhotoFullViewController.swift
//  Коллекция Тесси
//
//  Created by Гера Молоканов on 04.09.2022.
//

import UIKit

class PhotoFullViewController: UIViewController {
    
    var image: UIImage?
    @IBOutlet weak var photoImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        photoImageView.image = image
        // Do any additional setup after loading the view.
    }
    
    @IBAction func shareAction(_ sender: Any) {
        
        let shareController = UIActivityViewController(activityItems: [image!], applicationActivities: nil)
        
        shareController.completionWithItemsHandler = { _, bool, _, _ in
            if bool {
                print("Доставлено успешно!")
            }
        }
        
        present(shareController, animated: true, completion: nil)
    }
    
    

}

//
//  PhotosCollectionViewController.swift
//  Коллекция Тесси
//
//  Created by Гера Молоканов on 28.08.2022.
//

import UIKit



class PhotosCollectionViewController: UICollectionViewController {
    
    let photos = ["Tessi1","Tessi2","Tessi3","Tessi4","Tessi5","Tessi6","Tessi7","Tessi8","Tessi9","Tessi10","Tessi11","Tessi12"]

    let itemsPerRow: CGFloat = 2
    let sectionInserts = UIEdgeInsets (top: 20, left: 20, bottom: 20, right: 20)
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pickPhotoSegue" {
            let photoVC = segue.destination as! PhotoFullViewController
            let cell = sender as! PhotoCell
             photoVC.image = cell.TessiImageView.image
            
        }
     }
    

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCell
        
        
        let imageName = photos[indexPath.item]
        let image = UIImage(named: imageName)
        
        cell.TessiImageView.image = image
     
        return cell
    }

   
}

extension PhotosCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingWidth = sectionInserts.left * ( itemsPerRow + 1)
        let availabelWidth = collectionView.frame.width - paddingWidth
        let widthPerItem = availabelWidth / itemsPerRow
        return CGSize (width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInserts
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }
    
}

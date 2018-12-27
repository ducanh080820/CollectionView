//
//  CollectionViewController.swift
//  CollectionView
//
//  Created by Duc Anh on 12/3/18.
//  Copyright © 2018 Duc Anh. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController, CollectionViewCellDelegate {
    func removeItem(at indexPath: IndexPath) {
        images.remove(at: indexPath.row)
        collectionView.reloadData()
    }
    
    
    var images: [UIImage] = []
    let albumPhoto = PhotoLibrary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Register cell classes
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        standardize()
        images = albumPhoto.getAllPhoto()
    }
    
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return images.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        cell.backgroundColor = UIColor.cyan
        cell.photoImage.image = images[indexPath.row]
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.red
    }
    
    override func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.cyan
    }
    
    func standardize() {
        let numberOfColums: CGFloat = 3
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            let _ = flowLayout.scrollDirection == .vertical ? flowLayout.minimumInteritemSpacing : flowLayout.minimumLineSpacing
            let cellWith = (view.frame.width - (numberOfColums-1)*flowLayout.minimumInteritemSpacing)/numberOfColums
            flowLayout.itemSize = CGSize(width: cellWith, height: cellWith)
        }
    }
    
    
    
}

//
//  CollectionViewCell.swift
//  CollectionView
//
//  Created by Duc Anh on 12/3/18.
//  Copyright © 2018 Duc Anh. All rights reserved.
//

import UIKit

protocol CollectionViewCellDelegate: class {
    func removeItem(at indexPath: IndexPath)
}

class CollectionViewCell: UICollectionViewCell {
    var indexPath: IndexPath!
    var delegate: CollectionViewCellDelegate?
    @IBOutlet weak var photoImage: UIImageView!
    
    @IBAction func removeItem(_ sender: UIButton) {
        if indexPath != nil {
            delegate?.removeItem(at: indexPath)
        }
    }
}

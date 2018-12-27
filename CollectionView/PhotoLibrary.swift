//
//  PhotoLibrary.swift
//  CollectionView
//
//  Created by Duc Anh on 12/3/18.
//  Copyright © 2018 Duc Anh. All rights reserved.
//

import Foundation
import Photos

class PhotoLibrary {
    fileprivate var imageManage: PHImageManager
    fileprivate var requestOption: PHImageRequestOptions
    fileprivate var fetchOption: PHFetchOptions
    fileprivate var fetchResult: PHFetchResult<PHAsset>
    
    init() {
        imageManage = PHImageManager.default()
        requestOption = PHImageRequestOptions()
        requestOption.isSynchronous = true
        fetchOption = PHFetchOptions()
        fetchOption.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
        fetchResult = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: fetchOption)
    }
    
    var count: Int {
        return fetchResult.count
    }
    
    func setPhoto(at index: Int, completion block: @escaping (UIImage?)->()) {
        if index < fetchResult.count {
            imageManage.requestImage(for: fetchResult.object(at: index), targetSize: UIScreen.main.bounds.size, contentMode: PHImageContentMode.aspectFit, options: requestOption)
            { (image, _) in
                block(image)
            }
        } else {
            block(nil)
        }
    }
    
    func getAllPhoto() -> [UIImage] {
        var resultArray = [UIImage]()
        for index in 0..<fetchResult.count {
            imageManage.requestImage(for: fetchResult.object(at: index) as PHAsset, targetSize: UIScreen.main.bounds.size, contentMode: PHImageContentMode.aspectFill, options: requestOption) { (image, _) in
                
                if let image = image {
                    resultArray.append(image)
                }
            }
        }
        return resultArray
    }
    
}

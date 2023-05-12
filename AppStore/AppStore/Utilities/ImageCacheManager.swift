//
//  ImageCacheManager.swift
//  AppStore
//
//  Created by Sunwoo on 2023/05/12.
//

import UIKit

final class ImageCacheManager {
    static let shared = NSCache<NSString, UIImage>()
    
    private init() { }
    
    static func getObject(forKey key: String) -> UIImage? {
        let cacheKey = NSString(string: key)
        let cachedImage = self.shared.object(forKey: cacheKey)
        
        return cachedImage
    }
    
    static func setObject(image: UIImage, forKey key: String) {
        let cacheKey = NSString(string: key)
        self.shared.setObject(image, forKey: cacheKey)
    }
    
}

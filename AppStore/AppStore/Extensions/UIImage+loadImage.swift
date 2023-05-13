//
//  loadImage.swift
//  AppStore
//
//  Created by Sunwoo on 2023/05/11.
//

import UIKit

extension UIImageView {
    func load(with key: String) {
        if let cachedImage = ImageCacheManager.getObject(forKey: key) {
            self.image = cachedImage
            return
        }
        
        guard let url = URL(string: key) else {
            return
        }
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    ImageCacheManager.setObject(image: image, forKey: key)
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

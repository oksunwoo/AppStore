//
//  PreviewCollectionViewCell.swift
//  AppStore
//
//  Created by Sunwoo on 2023/05/22.
//

import UIKit

final class PreviewCollectionViewCell: UICollectionViewCell {
    private let previewImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = CGFloat(15)
        imageView.layer.borderWidth = CGFloat(0.1)
        imageView.layer.borderColor = UIColor.systemGray.cgColor
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    convenience init() {
        self.init(frame: .zero)
        configureUI()
    }
    
    func configureUI() {
        addSubview(previewImageView)
        
        NSLayoutConstraint.activate([
            previewImageView.topAnchor.constraint(equalTo: topAnchor),
            previewImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            previewImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            previewImageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        previewImageView.load(with: "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource126/v4/62/01/0d/62010d85-cea4-5290-35c9-11a5704b59db/ee4d2e80-a9f8-436f-b510-478cca29e7f2_ios_5.5_01.png/392x696bb.png")
    }
}

extension PreviewCollectionViewCell {
    enum Text {
        static let reuseIdentifier = "PreviewCollectionViewCell"
    }
}


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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        previewImageView.image = nil
    }
    
    func setInformation(with previewURL: String) {
        configureUI()
        previewImageView.load(with: previewURL)
    }
    
    private func configureUI() {
        addSubview(previewImageView)
        
        NSLayoutConstraint.activate([
            previewImageView.topAnchor.constraint(equalTo: topAnchor),
            previewImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            previewImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            previewImageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

extension PreviewCollectionViewCell {
    enum Text {
        static let reuseIdentifier = "PreviewCollectionViewCell"
    }
}


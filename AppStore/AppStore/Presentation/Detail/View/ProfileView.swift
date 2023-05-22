//
//  ProfileView.swift
//  AppStore
//
//  Created by Sunwoo on 2023/05/19.
//

import UIKit

final class ProfileView: UIView {
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = CGFloat(15)
        imageView.layer.borderWidth = CGFloat(0.1)
        imageView.layer.borderColor = UIColor.systemGray.cgColor
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .title2)
        label.textColor = .black
        
        return label
    }()
    
    private let sellerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .body)
        label.textColor = .systemGray
        //label.backgroundColor = .systemCyan
    
        return label
    }()
    
    private let minimumOSLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .caption2)
        label.textColor = .systemGray
        
        return label
    }()
    
    convenience init() {
        self.init(frame: .zero)
        configureUI()
    }
    
    func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(profileImageView)
        addSubview(titleLabel)
        addSubview(sellerLabel)
        addSubview(minimumOSLabel)
        
        NSLayoutConstraint.activate([
            profileImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            profileImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3),
            profileImageView.heightAnchor.constraint(equalTo: profileImageView.widthAnchor),
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 20),
            sellerLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            minimumOSLabel.leadingAnchor.constraint(equalTo: sellerLabel.leadingAnchor),

            titleLabel.topAnchor.constraint(equalTo: profileImageView.topAnchor),
            sellerLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            minimumOSLabel.bottomAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: -10)
        ])
        
        profileImageView.image = UIImage(systemName: "square")
        profileImageView.backgroundColor = .systemYellow
        
        titleLabel.text = "카카오톡"
        sellerLabel.text = "Kakao Corp."
        minimumOSLabel.text = "최소 iOS 버전이 9.0 이상이여야 합니다."
    }
}

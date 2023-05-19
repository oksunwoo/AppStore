//
//  ProfileStackView.swift
//  AppStore
//
//  Created by Sunwoo on 2023/05/19.
//

import UIKit

final class ProfileStackView: UIStackView {
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
    
    private let textStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.backgroundColor = .systemBlue
        
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .largeTitle)
        label.textColor = .systemBackground
        label.backgroundColor = .systemRed
        
        return label
    }()
    
    private let sellerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .body)
        label.textColor = .systemGray
        label.backgroundColor = .systemCyan
    
        return label
    }()
    
    private let minimumOSLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .caption2)
        label.textColor = .systemGray
        label.backgroundColor = .brown
        
        return label
    }()
    
    convenience init() {
        self.init(frame: .zero)
        configureUI()
    }
    
    func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        axis = .horizontal
        spacing = 5
        
        addArrangedSubview(profileImageView)
        addArrangedSubview(textStackView)
        
        textStackView.addArrangedSubview(titleLabel)
        textStackView.addArrangedSubview(sellerLabel)
        textStackView.addArrangedSubview(minimumOSLabel)
        
        NSLayoutConstraint.activate([
            profileImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            profileImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3),
            profileImageView.heightAnchor.constraint(equalTo: profileImageView.widthAnchor),
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor),

            titleLabel.topAnchor.constraint(equalTo: profileImageView.topAnchor),
            minimumOSLabel.bottomAnchor.constraint(equalTo: profileImageView.bottomAnchor)
        ])
        
        profileImageView.image = UIImage(systemName: "square")
        profileImageView.backgroundColor = .systemYellow
        
        titleLabel.text = "카카오톡"
        sellerLabel.text = "Kakao Corp."
        minimumOSLabel.text = "최소 iOS 버전이 9.0 이상이여야 합니다."
    }
}

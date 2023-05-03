//
//  ListTableViewCell.swift
//  AppStore
//
//  Created by Sunwoo on 2023/05/02.
//

import UIKit

final class ListTableViewCell: UITableViewCell {
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()

    private let labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 7

        return stackView
    }()

    private let titleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        
        return label
    }()
    private var starRatingStackView = StarRatingStackView()
    
    convenience init() {
        self.init(style: .default, reuseIdentifier: Text.reuseIdentifier)
        configureUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureUI() {
        addSubview(iconImageView)
        addSubview(labelStackView)
        labelStackView.addArrangedSubview(titleLabel)
        labelStackView.addArrangedSubview(starRatingStackView)
        NSLayoutConstraint.activate([
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            iconImageView.heightAnchor.constraint(equalTo: iconImageView.widthAnchor),

            labelStackView.topAnchor.constraint(equalTo: iconImageView.topAnchor),
            labelStackView.bottomAnchor.constraint(equalTo: iconImageView.bottomAnchor),
            labelStackView.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
            labelStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
       
        iconImageView.image = UIImage(systemName: "circle")
        titleLabel.text = "카카오톡"
        starRatingStackView.makeStar(with: 4.5)
    }
}

extension ListTableViewCell {
    enum Text {
        static let reuseIdentifier = "ListTableViewCell"
    }
}

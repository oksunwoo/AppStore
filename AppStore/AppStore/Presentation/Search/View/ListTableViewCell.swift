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
        imageView.layer.cornerRadius = CGFloat(15)
        imageView.layer.borderWidth = CGFloat(0.1)
        imageView.layer.borderColor = UIColor.systemGray.cgColor
        imageView.backgroundColor = .yellow
        return imageView
    }()

    private let labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 0
//        stackView.backgroundColor = .yellow
        return stackView
    }()

    private let titleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = .preferredFont(forTextStyle: .title3)
//        label.backgroundColor = .green
        return label
    }()
    
    private let genreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.textColor = .systemGray
//        label.backgroundColor = .blue
        return label
    }()
    
    private let ratingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 5
//        stackView.backgroundColor = .brown
        return stackView
    }()
    
    private let ratingCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .caption1)
        label.textColor = .systemGray3
//        label.backgroundColor = .cyan
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
        labelStackView.addArrangedSubview(genreLabel)
        labelStackView.addArrangedSubview(ratingStackView)
        ratingStackView.addArrangedSubview(starRatingStackView)
        ratingStackView.addArrangedSubview(ratingCountLabel)
        
        NSLayoutConstraint.activate([
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            iconImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2),
            iconImageView.heightAnchor.constraint(equalTo: iconImageView.widthAnchor),

            labelStackView.topAnchor.constraint(equalTo: iconImageView.topAnchor, constant: 5),
            labelStackView.bottomAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: -10),
            labelStackView.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
            labelStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            genreLabel.heightAnchor.constraint(equalTo: titleLabel.heightAnchor),
            starRatingStackView.widthAnchor.constraint(equalTo: ratingStackView.widthAnchor, multiplier: 0.3),
        ])
       
        iconImageView.image = UIImage(systemName: "circle")
        titleLabel.text = "카카오톡"
        genreLabel.text = "Social Network"
        starRatingStackView.makeStar(with: 4.5)
        ratingCountLabel.text = "12만"
    }
}

extension ListTableViewCell {
    enum Text {
        static let reuseIdentifier = "ListTableViewCell"
    }
}

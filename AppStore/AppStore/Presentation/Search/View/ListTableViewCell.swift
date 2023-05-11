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
        imageView.clipsToBounds = true
        
        return imageView
    }()

    private let labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 0

        return stackView
    }()

    private let titleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = .preferredFont(forTextStyle: .callout)

        return label
    }()
    
    private let genreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.textColor = .systemGray
        
        return label
    }()
    
    private let ratingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 5

        return stackView
    }()
    
    private let ratingCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .caption1)
        label.textColor = .systemGray3

        return label
    }()
    
    private var starRatingStackView: StarRatingStackView?
    
    convenience init() {
        self.init(style: .default, reuseIdentifier: Text.reuseIdentifier)
        configureUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        titleLabel.text = nil
        genreLabel.text = nil
        ratingCountLabel.text = nil
        starRatingStackView?.removeFromSuperview()
        starRatingStackView = nil
        iconImageView.image = nil
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func apply(with appItem: AppInformation) {
        configureUI()
        setInformation(with: appItem)
    }
    
    private func configureUI() {
        starRatingStackView = StarRatingStackView()
        
        guard let starRatingStackView = starRatingStackView else {
            return
        }
        
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
    }
   
    private func setInformation(with appItem: AppInformation) {
        titleLabel.text = appItem.trackName
        genreLabel.text = appItem.primaryGenreName
        starRatingStackView?.makeStar(with: appItem.averageUserRating)
        ratingCountLabel.text = String(appItem.userRatingCount)
        iconImageView.load(urlString: appItem.artworkURL100)
    }
}

extension ListTableViewCell {
    enum Text {
        static let reuseIdentifier = "ListTableViewCell"
    }
}

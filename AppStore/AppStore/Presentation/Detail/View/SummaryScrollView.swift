//
//  SummaryScrollView.swift
//  AppStore
//
//  Created by Sunwoo on 2023/05/17.
//

import UIKit

final class SummaryScrollView: UIScrollView {
    private let HStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    private let ratingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 8
        
        return stackView
    }()
    
    private let ratingTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .systemGray
        label.font = .preferredFont(forTextStyle: .caption2)
        
        return label
    }()
    
    private let ratingTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .systemGray
        label.font = .preferredFont(forTextStyle: .largeTitle)
        
        return label
    }()
    
    private var starRatingStackView = StarRatingStackView()
    
    private let contentRatingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 8
        
        return stackView
    }()
    
    private let contentRatingTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .systemGray
        label.font = .preferredFont(forTextStyle: .caption2)
        
        return label
    }()
    
    private let contentRatingTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .systemGray
        label.font = .preferredFont(forTextStyle: .largeTitle)
        
        return label
    }()
    
    private let contentRatingBottomTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .systemGray
        label.font = .preferredFont(forTextStyle: .caption1)
        
        return label
    }()
    
    private let genreStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 8
        
        return stackView
    }()
    
    private let genreTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .systemGray
        label.font = .preferredFont(forTextStyle: .caption2)
        
        return label
    }()
    
    private let genreImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .systemGray
        
        return imageView
    }()
    
    private let genreBottomTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .systemGray
        label.font = .preferredFont(forTextStyle: .caption1)
        
        return label
    }()
    
    private let sellerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 8
        
        return stackView
    }()
    
    private let sellerTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .systemGray
        label.font = .preferredFont(forTextStyle: .caption2)
        
        return label
    }()
    
    private let sellerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .systemGray
        
        return imageView
    }()
    
    private let sellerBottomTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .systemGray
        label.font = .preferredFont(forTextStyle: .caption1)
        
        return label
    }()
   
    private let languageStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 8
        
        return stackView
    }()
    
    private let languageTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .systemGray
        label.font = .preferredFont(forTextStyle: .caption2)
        
        return label
    }()
    
    private let languageTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .systemGray
        label.font = .preferredFont(forTextStyle: .title1)
        
        return label
    }()
    
    private let languageBottomTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .systemGray
        label.font = .preferredFont(forTextStyle: .caption1)
        
        return label
    }()
    
    convenience init() {
        self.init(frame: .zero)
        configureUI()
    }
    
    func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        
        addSubview(HStack)
        HStack.addArrangedSubview(ratingStackView)
        HStack.addArrangedSubview(contentRatingStackView)
        HStack.addArrangedSubview(genreStackView)
        HStack.addArrangedSubview(sellerStackView)
        HStack.addArrangedSubview(languageStackView)
        
        ratingStackView.addArrangedSubview(ratingTitleLabel)
        ratingStackView.addArrangedSubview(ratingTextLabel)
        ratingStackView.addArrangedSubview(starRatingStackView)
        
        contentRatingStackView.addArrangedSubview(contentRatingTitleLabel)
        contentRatingStackView.addArrangedSubview(contentRatingTextLabel)
        contentRatingStackView.addArrangedSubview(contentRatingBottomTextLabel)
        
        genreStackView.addArrangedSubview(genreTitleLabel)
        genreStackView.addArrangedSubview(genreImageView)
        genreStackView.addArrangedSubview(genreBottomTextLabel)
        
        sellerStackView.addArrangedSubview(sellerTitleLabel)
        sellerStackView.addArrangedSubview(sellerImageView)
        sellerStackView.addArrangedSubview(sellerBottomTextLabel)
        
        languageStackView.addArrangedSubview(languageTitleLabel)
        languageStackView.addArrangedSubview(languageTextLabel)
        languageStackView.addArrangedSubview(languageBottomTextLabel)

        NSLayoutConstraint.activate([
            HStack.topAnchor.constraint(equalTo: topAnchor),
            HStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            HStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            HStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            starRatingStackView.heightAnchor.constraint(equalTo: contentRatingBottomTextLabel.heightAnchor),
            genreBottomTextLabel.heightAnchor.constraint(equalTo: contentRatingBottomTextLabel.heightAnchor),
            sellerBottomTextLabel.heightAnchor.constraint(equalTo: genreBottomTextLabel.heightAnchor),
            languageBottomTextLabel.heightAnchor.constraint(equalTo: sellerBottomTextLabel.heightAnchor),
            
            genreImageView.heightAnchor.constraint(equalTo: contentRatingTextLabel.heightAnchor),
            genreImageView.widthAnchor.constraint(equalTo: genreImageView.heightAnchor),
            sellerImageView.heightAnchor.constraint(equalTo: genreImageView.heightAnchor),
            sellerImageView.widthAnchor.constraint(equalTo: sellerImageView.heightAnchor),
            languageTextLabel.heightAnchor.constraint(equalTo: sellerImageView.heightAnchor)
            
        
        ])
        
        ratingTitleLabel.text = "13만개의 평가"
        ratingTextLabel.text = "3.0"
        starRatingStackView.makeStar(with: 4.0)
        
        contentRatingTitleLabel.text = "연령"
        contentRatingTextLabel.text = "4+"
        contentRatingBottomTextLabel.text = "세"
        
        genreTitleLabel.text = "차트"
        genreImageView.image = UIImage(systemName: "message.circle.fill")
        genreBottomTextLabel.text = "소셜 네트워킹"
        
        sellerTitleLabel.text = "개발자"
        sellerImageView.image = UIImage(systemName: "person.crop.square")
        sellerBottomTextLabel.text = "Kakao Corp."
        
        languageTitleLabel.text = "언어"
        languageTextLabel.text = "KO"
        languageBottomTextLabel.text = "+ 14개 언어"
    }
    
}

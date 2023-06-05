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
        stackView.spacing = 10
        
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
        label.setContentHuggingPriority(.required, for: .horizontal)
        
        return label
    }()
    
    private let ratingTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .systemGray
        label.font = .preferredFont(forTextStyle: .title2)
        
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
        label.font = .preferredFont(forTextStyle: .title2)
        
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
        label.font = .preferredFont(forTextStyle: .title2)
        
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
    
    private let ratingDivider = VerticalDivider()
    private let genreDivider = VerticalDivider()
    private let sellerDivider = VerticalDivider()
    private let languageDivider = VerticalDivider()
    
    convenience init() {
        self.init(frame: .zero)
        configureUI()
    }
    
    func apply(with appInformation: AppInformation) {
        ratingTitleLabel.text = "\(appInformation.userRatingCount.ratingCountFormatter)개의 평가"
        ratingTextLabel.text = String(format: "%.1f", appInformation.averageUserRating)
        starRatingStackView.makeStar(with: appInformation.averageUserRating)
        
        contentRatingTitleLabel.text = "연령"
        contentRatingTextLabel.text = appInformation.contentAdvisoryRating
        contentRatingBottomTextLabel.text = "세"
        
        genreTitleLabel.text = "차트"
        genreImageView.image = UIImage(systemName: setImageOf(appInformation.primaryGenreName))
        genreBottomTextLabel.text = appInformation.primaryGenreName
        
        sellerTitleLabel.text = "개발자"
        sellerImageView.image = UIImage(systemName: "person.crop.square")
        sellerBottomTextLabel.text = appInformation.artistName
        
        languageTitleLabel.text = "언어"
        languageTextLabel.text = appInformation.languageCodesISO2A.first
        languageBottomTextLabel.text = "+ \(appInformation.languageCodesISO2A.count)개의 언어"
    }
    
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        
        addSubview(HStack)
        HStack.addArrangedSubview(ratingStackView)
        HStack.addArrangedSubview(contentRatingStackView)
        HStack.addArrangedSubview(genreStackView)
        HStack.addArrangedSubview(sellerStackView)
        HStack.addArrangedSubview(languageStackView)
        HStack.addSubview(ratingDivider)
        HStack.addSubview(genreDivider)
        HStack.addSubview(sellerDivider)
        HStack.addSubview(languageDivider)
        
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
            
            ratingStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            contentRatingStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            genreStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            sellerStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            languageStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            ratingTextLabel.heightAnchor.constraint(equalTo: contentRatingTextLabel.heightAnchor, multiplier: 1.0),
            starRatingStackView.widthAnchor.constraint(equalTo: ratingTitleLabel.widthAnchor, multiplier: 1.0),
            starRatingStackView.widthAnchor.constraint(equalTo: ratingStackView.widthAnchor, multiplier: 0.62),
            
            genreImageView.heightAnchor.constraint(equalTo: contentRatingTextLabel.heightAnchor),
            genreImageView.widthAnchor.constraint(equalTo: genreImageView.heightAnchor),
            sellerImageView.heightAnchor.constraint(equalTo: genreImageView.heightAnchor),
            sellerImageView.widthAnchor.constraint(equalTo: sellerImageView.heightAnchor),
            languageTextLabel.heightAnchor.constraint(equalTo: sellerImageView.heightAnchor),
            
            ratingDivider.leadingAnchor.constraint(equalTo: ratingStackView.trailingAnchor, constant: 8),
            ratingDivider.heightAnchor.constraint(equalTo: HStack.heightAnchor, multiplier: 0.5),
            ratingDivider.centerYAnchor.constraint(equalTo: HStack.centerYAnchor),
            
            genreDivider.leadingAnchor.constraint(equalTo: contentRatingStackView.trailingAnchor, constant: 8),
            genreDivider.heightAnchor.constraint(equalTo: HStack.heightAnchor, multiplier: 0.5),
            genreDivider.centerYAnchor.constraint(equalTo: HStack.centerYAnchor),
            
            sellerDivider.leadingAnchor.constraint(equalTo: genreStackView.trailingAnchor, constant: 8),
            sellerDivider.heightAnchor.constraint(equalTo: HStack.heightAnchor, multiplier: 0.5),
            sellerDivider.centerYAnchor.constraint(equalTo: HStack.centerYAnchor),
            
            languageDivider.leadingAnchor.constraint(equalTo: sellerStackView.trailingAnchor, constant: 8),
            languageDivider.heightAnchor.constraint(equalTo: HStack.heightAnchor, multiplier: 0.5),
            languageDivider.centerYAnchor.constraint(equalTo: HStack.centerYAnchor),
        ])
    }
}

extension SummaryScrollView {
    private func setImageOf(_ genre: String) -> String {
        guard let name = Genre(rawValue: genre)?.name else {
            return "apps.iphone"
        }
        
        return name
    }
}

extension SummaryScrollView {
    enum Genre: String {
        case finance = "Finance"
        case travel = "Travel"
        case socialNetworking = "Social Networking"
        case entertainment = "Entertainment"
        case navigation = "Navigation"
        case reference = "Reference"
        case utilities = "Utilities"
        case book = "Book"
        case business = "Business"
        case developerTools = "Developer Tools"
        case education = "Education"
        case food = "Food & Drink"
        case game = "Games"
        case design = "Graphics & Design"
        case health = "Health & Fitness"
        case lifeStyle = "Lifestyle"
        case kids = "Kids"
        case magazines = "Magazines & Newspapers"
        case medical = "Medical"
        case music = "Music"
        case news = "News"
        case photo = "Photo & Video"
        case productivity = "Productivity"
        case shopping = "Shopping"
        case sport = "Sports"
        case weather = "Weather"
        
        var name: String {
            switch self {
            case .finance:
                return "dollarsign.circle"
            case .travel:
                return "airplane.departure"
            case .socialNetworking:
                return "message.circle.fill"
            case .entertainment:
                return "figure.cooldown"
            case .navigation:
                return "car.rear.road.lane"
            case .reference:
                return "magnifyingglass.circle.fill"
            case .utilities:
                return "folder.circle.fill"
            case .book:
                return "book.circle.fill"
            case .business:
                return "calendar.circle.fill"
            case .developerTools:
                return "macpro.gen3.fill"
            case .education:
                return "graduationcap.circle.fill"
            case .food:
                return "fork.knife.circle.fill"
            case .game:
                return "gamecontroller.fill"
            case .design:
                return "photo.artframe"
            case .health:
                return "figure.strengthtraining.traditional"
            case .lifeStyle:
                return "house.circle.fill"
            case .kids:
                return "figure.and.child.holdinghands"
            case .magazines:
                return "magazine"
            case .medical:
                return "stethoscope.circle"
            case .music:
                return "music.note.list"
            case .news:
                return "newspaper"
            case .photo:
                return "camera.circle.fill"
            case .productivity:
                return "icloud.and.arrow.down"
            case .shopping:
                return "cart"
            case .sport:
                return "sportscourt.circle.fill"
            case .weather:
                return "cloud.sun.fill"
            }
        }
    }
}

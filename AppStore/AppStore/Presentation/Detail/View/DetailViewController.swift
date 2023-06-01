//
//  DetailViewController.swift
//  AppStore
//
//  Created by Sunwoo on 2023/05/16.
//

import UIKit

final class DetailViewController: UIViewController {
    private let mainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        
        return stackView
    }()
    
    private let profileView = ProfileView()
    private let summaryScrollView = SummaryScrollView()
    private let newReleaseView = ReadMoreTextView(textType: .release)
    
    private let newReleaseLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .preferredFont(forTextStyle: .headline)
        label.textColor = .label
        label.text = Text.newReleaseTitle
        
        return label
    }()
    
    private let previewCollectionView: UICollectionView = {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = true
        collectionView.showsHorizontalScrollIndicator = false

        return collectionView
    }()
    
    private let previewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .preferredFont(forTextStyle: .headline)
        label.textColor = .label
        label.text = Text.previewTitle
        
        return label
    }()
    
    private let descriptionTextView = ReadMoreTextView(textType: .description)
    
    private let informationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .preferredFont(forTextStyle: .headline)
        label.textColor = .label
        label.text = Text.informationTitle
        
        return label
    }()
    
    private let informationTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isScrollEnabled = false
        tableView.isUserInteractionEnabled = false
        tableView.separatorInset.left = 0
        tableView.separatorInset.right = 15
        
        return tableView
    }()
    
    private let profileDevider = HorizontalDevider()
    private let summaryDevider = HorizontalDevider()
    private let newReleaseDevider = HorizontalDevider()
    private let previewDevider = HorizontalDevider()
    private let descriptionDevider = HorizontalDevider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    private func configureUI() {
        configureBackground()
        configureNavigation()
        configureLayout()
        configureCollectionView()
        configureTableView()
    }
    
    private func configureBackground() {
        view.backgroundColor = .white
    }
    
    private func configureNavigation() {
        let image = UIImage(systemName: "square")
        navigationItem.titleView = UIImageView(image: image)
        navigationItem.largeTitleDisplayMode = .never
    }
    
    private func configureLayout() {
        view.addSubview(mainScrollView)
        mainScrollView.addSubview(mainStackView)
        mainStackView.addArrangedSubview(profileView)
        mainStackView.addArrangedSubview(profileDevider)
        mainStackView.addArrangedSubview(summaryScrollView)
        mainStackView.addArrangedSubview(summaryDevider)
        mainStackView.addArrangedSubview(newReleaseLabel)
        mainStackView.addArrangedSubview(newReleaseView)
        mainStackView.addArrangedSubview(newReleaseDevider)
        mainStackView.addArrangedSubview(previewLabel)
        mainStackView.addArrangedSubview(previewCollectionView)
        mainStackView.addArrangedSubview(previewDevider)
        mainStackView.addArrangedSubview(descriptionTextView)
        mainStackView.addArrangedSubview(descriptionDevider)
        mainStackView.addArrangedSubview(informationLabel)
        mainStackView.addArrangedSubview(informationTableView)
        
        NSLayoutConstraint.activate([
            mainScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            mainScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mainScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            mainStackView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor),
            mainStackView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: mainScrollView.trailingAnchor),
            mainStackView.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor),
            
            profileView.widthAnchor.constraint(equalTo: mainStackView.widthAnchor),
            profileView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.16),
            
            previewCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6),
            informationTableView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
        ])
    }
    
    private func configureCollectionView() {
        previewCollectionView.delegate = self
        previewCollectionView.dataSource = self
        previewCollectionView.register(PreviewCollectionViewCell.self, forCellWithReuseIdentifier: Text.previewCellIdentifier)
    }
    
    private func configureTableView() {
        informationTableView.dataSource = self
        informationTableView.register(InformationTableViewCell.self, forCellReuseIdentifier: Text.InformationCellIdentifier)
    }
}

extension DetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Text.previewCellIdentifier, for: indexPath) as? PreviewCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configureUI()
        
        return cell
    }
}

extension DetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let estimateHeight = collectionView.frame.height * 0.95
        let estimateWidth = UIScreen.main.bounds.width * 0.6
        
        return CGSize(width: estimateWidth, height: estimateHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(15)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Text.InformationCellIdentifier, for: indexPath) as? InformationTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configureUI()
        
        return cell
    }
}

extension DetailViewController {
    enum Text {
        static let newReleaseTitle = "새로운 기능"
        static let previewTitle = "미리보기"
        static let informationTitle = "정보"
        static let previewCellIdentifier = "PreviewCollectionViewCell"
        static let InformationCellIdentifier = "InformationTableViewCell"
    }
}

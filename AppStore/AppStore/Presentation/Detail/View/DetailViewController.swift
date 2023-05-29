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
        scrollView.backgroundColor = .green
        
        return scrollView
    }()
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.backgroundColor = .cyan
        
        return stackView
    }()
    
    private let profileView = ProfileView()
    private let summaryScrollView = SummaryScrollView()
    
    private let previewCollectionView: UICollectionView = {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = true

        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
    }
    
    private func configureUI() {
        configureBackground()
        configureNavigation()
        configureLayout()
        configureCollectionView()
    }
    
    private func configureBackground() {
        view.backgroundColor = .white
    }
    
    private func configureNavigation() {
        navigationItem.largeTitleDisplayMode = .never
    }
    
    private func configureLayout() {
        let scrollContentGuide = mainScrollView.contentLayoutGuide
        let scrollFrameGuide = mainScrollView.frameLayoutGuide
        
        view.addSubview(mainScrollView)
        mainScrollView.addSubview(mainStackView)
        mainStackView.addArrangedSubview(profileView)
        profileView.backgroundColor = .red
        mainStackView.addArrangedSubview(summaryScrollView)
//        mainStackView.addArrangedSubview(previewCollectionView)
        
        NSLayoutConstraint.activate([
            mainScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mainScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainScrollView.contentLayoutGuide.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor),
            
            mainStackView.leadingAnchor.constraint(equalTo: scrollContentGuide.leadingAnchor),
            mainStackView.topAnchor.constraint(equalTo: scrollContentGuide.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: scrollContentGuide.bottomAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: scrollContentGuide.trailingAnchor),
            
            mainStackView.leadingAnchor.constraint(equalTo: scrollFrameGuide.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: scrollFrameGuide.trailingAnchor),
            mainStackView.heightAnchor.constraint(equalTo: scrollFrameGuide.heightAnchor),
            
            profileView.topAnchor.constraint(equalTo: mainStackView.topAnchor),
            profileView.heightAnchor.constraint(equalTo: mainStackView.heightAnchor, multiplier: 0.2)
            
            
            
//            mainStackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
//            mainStackView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor),
//            mainStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
//            mainStackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            
//            mainStackView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
//            mainStackView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor),
//            mainStackView.trailingAnchor.constraint(equalTo: mainScrollView.trailingAnchor),
//            mainStackView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
        ])
    }
    
    private func configureCollectionView() {
        previewCollectionView.delegate = self
        previewCollectionView.dataSource = self
        previewCollectionView.register(PreviewCollectionViewCell.self, forCellWithReuseIdentifier: Text.reuseIdentifier)
    }
}

extension DetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Text.reuseIdentifier, for: indexPath) as? PreviewCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configureUI()
        
        return cell
    }
}

extension DetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let estimateHeight = collectionView.frame.height * 0.7
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

extension DetailViewController {
    enum Text {
        static let reuseIdentifier = "PreviewCollectionViewCell"
    }
}

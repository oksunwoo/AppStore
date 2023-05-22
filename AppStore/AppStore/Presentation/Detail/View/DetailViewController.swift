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
        
        return stackView
    }()
    
    private let previewCollectionView: UICollectionView = {
        let collectionView = UICollectionView()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = false
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        test()
        // Do any additional setup after loading the view.
    }
    
    func test() {
        let profile = ProfileView()
        let summary = SummaryScrollView()
       
        view.backgroundColor = .white
        view.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(profile)
        mainStackView.addArrangedSubview(summary)
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            profile.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
            profile.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor),
            profile.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            summary.topAnchor.constraint(equalTo: profile.bottomAnchor)
            
        ])
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

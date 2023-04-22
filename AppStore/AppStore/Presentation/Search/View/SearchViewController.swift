//
//  SearchViewController.swift
//  AppStore
//
//  Created by Sunwoo on 2023/03/30.
//

import UIKit

class SearchViewController: UIViewController {
    private let searchField: UISearchBar = {
        let searchbar = UISearchBar()
        searchbar.translatesAutoresizingMaskIntoConstraints = false
        searchbar.placeholder = "게임, 앱, 스토리 등"
        searchbar.setImage(UIImage(systemName: "magnifyingglass"), for: .search, state: .normal)
        searchbar.setImage(UIImage(systemName: "x.circle.fill"), for: .clear, state: .normal)
        
        return searchbar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureBackground()
        configureNavigationBar()
        configureLayout()
    }
    
    private func configureBackground() {
        view.backgroundColor = .systemBackground
    }
   
    private func configureNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.topItem?.title = "Search"
    }
    
    private func configureLayout() {
        view.addSubview(searchField)
        
        NSLayoutConstraint.activate([
            searchField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            searchField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 12),
            searchField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -12)
        ])
    }
}

import SwiftUI

struct SearchViewController_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SearchViewController().toPreview()
        }
    }
}

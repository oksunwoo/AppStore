//
//  SearchViewController.swift
//  AppStore
//
//  Created by Sunwoo on 2023/03/30.
//

import UIKit

final class SearchViewController: UIViewController {
    private let search: UISearchController = {
        let searchController = UISearchController()
        searchController.searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchController.searchBar.placeholder = Text.placeholder
        searchController.searchBar.setImage(UIImage(named: "icSearchNonW"), for: .search, state: .normal)
        searchController.searchBar.setImage(UIImage(named: "icCancel"), for: .clear, state: .normal)
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.automaticallyShowsCancelButton = true
       
        return searchController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    private func configureUI() {
        configureBackground()
        configureNavigationBar()
    }
    
    private func configureBackground() {
        view.backgroundColor = .systemBackground
    }
   
    private func configureNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.topItem?.title = Text.title
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationItem.searchController = search
    }
}

extension SearchViewController {
    private enum Text {
        static let placeholder = "게임, 앱, 스토리 등"
        static let title = "Search"
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

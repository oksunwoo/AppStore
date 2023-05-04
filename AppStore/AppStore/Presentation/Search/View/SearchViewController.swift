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
    
    private let listTableView: UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .singleLine
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    private func configureUI() {
        configureBackground()
        configureNavigationBar()
        configureTableView()
        listTableView.register(ListTableViewCell.self, forCellReuseIdentifier: "ListTableViewCell")
        listTableView.dataSource = self
        listTableView.delegate = self
        search.searchBar.delegate = self
    }
    
    private func configureTableView() {
        view.addSubview(listTableView)
        
        NSLayoutConstraint.activate([
            listTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            listTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            listTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            listTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
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

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchKeyword = searchBar.text else {
            return
        }
        
        print(searchKeyword)
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as? ListTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configureUI()
        return cell
    }
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return CGFloat(100)
    }
}

//
//  SearchViewController.swift
//  AppStore
//
//  Created by Sunwoo on 2023/03/30.
//

import UIKit
import Combine

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
    
    private var viewModel : SearchViewModel!
    private var appsInformation: [AppInformation] = []
    private let inputKeyword = PassthroughSubject<String, Never>()
    private var cancellable = Set<AnyCancellable>()
    
    convenience init(viewModel: SearchViewModel) {
        self.init()
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        bind()
    }
    
    private func configureUI() {
        configureBackground()
        configureNavigationBar()
        configureTableView()
    }
    
    private func configureBackground() {
        view.backgroundColor = .systemBackground
    }
    
    private func configureNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.topItem?.title = Text.title
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationItem.searchController = search
        search.searchBar.delegate = self
    }
    
    private func configureTableView() {
        listTableView.dataSource = self
        listTableView.delegate = self
        registerCell()
        
        view.addSubview(listTableView)
        
        NSLayoutConstraint.activate([
            listTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            listTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            listTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            listTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func registerCell() {
        listTableView.register(ListTableViewCell.self, forCellReuseIdentifier: Text.cellIdentifier)
    }
}

extension SearchViewController {
    private func bind() {
        let input = SearchViewModel.Input(searchButtonDidTap: inputKeyword.eraseToAnyPublisher())
        let output = viewModel.transform(input: input)
        
        configureUIContents(with: output.appsItem)
    }
    
    private func configureUIContents(with outputPublisher: AnyPublisher<[AppInformation]?, Never>) {
        outputPublisher
            .receive(on: DispatchQueue.main)
            .sink { appItem in
                guard let informations = appItem else {
                    return
                }
                self.appsInformation = informations
                self.listTableView.reloadData()
            }
            .store(in: &cancellable)
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchKeyword = searchBar.text else {
            return
        }
        
        inputKeyword.send(searchKeyword)
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appsInformation.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Text.cellIdentifier, for: indexPath) as? ListTableViewCell else {
            return UITableViewCell()
        }
        
        cell.apply(with: appsInformation[indexPath.row])
        return cell
    }
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return CGFloat(100)
    }
}

extension SearchViewController {
    private enum Text {
        static let placeholder = "게임, 앱, 스토리 등"
        static let title = "Search"
        static let cellIdentifier = "ListTableViewCell"
    }
}

//
//  SearchCoordinator.swift
//  AppStore
//
//  Created by Sunwoo on 2023/04/20.
//

import UIKit

final class SearchCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var type: CoordinatorType = .search
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showSearchPage()
    }
    
    private func showSearchPage() {
        let navigationController = navigationController
        let searchViewModel = SearchViewModel(coordinator: self)
        let searchViewController = SearchViewController(viewModel: searchViewModel)
        
        navigationController.pushViewController(searchViewController, animated: true)
    }
    
    func showDetailPage(with appInformation: AppInformation) {
        let detailCoordinator = DetailCoordinator(navigationController: navigationController)
        childCoordinators.append(detailCoordinator)
        detailCoordinator.start()
    }
}

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
    weak var parentCoordinator: Coordinator?
    var type: CoordinatorType = .search
    
    init(navigationController: UINavigationController, parentCoordinator: Coordinator) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
    }
    
    func start() {
        showSearchPage()
    }
    
    private func showSearchPage() {
        let searchViewModel = SearchViewModel(coordinator: self)
        let searchViewController = SearchViewController(viewModel: searchViewModel)
        
        navigationController.pushViewController(searchViewController, animated: true)
    }
    
    func showDetailPage(with appInformation: AppInformation) {
        let detailCoordinator = DetailCoordinator(navigationController: navigationController, parentCoordinator: self)
        childCoordinators.append(detailCoordinator)
        detailCoordinator.start(with: appInformation)
    }
    
    func end() {
        parentCoordinator?.removeChildCoordinator(self)
    }
}

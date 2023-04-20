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
        let searchViewController = SearchViewController()
        
        navigationController.pushViewController(searchViewController, animated: true)
    }
}

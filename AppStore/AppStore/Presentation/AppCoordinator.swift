//
//  AppCoordinator.swift
//  AppStore
//
//  Created by Sunwoo on 2023/04/20.
//

import UIKit

final class AppCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var type: CoordinatorType = .app
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showSearchPage()
    }
    
    private func showSearchPage() {
        let navigationController = navigationController
        let searchCoordinator = SearchCoordinator(navigationController: navigationController)
        childCoordinators.append(searchCoordinator)
        searchCoordinator.start()
    }
}

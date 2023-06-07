//
//  DetailCoordinator.swift
//  AppStore
//
//  Created by Sunwoo on 2023/05/15.
//

import UIKit

final class DetailCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    weak var parentCoordinator: Coordinator?
    var type: CoordinatorType = .detail
    
    init(navigationController: UINavigationController, parentCoordinator: Coordinator) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
    }
    
    func start(with appInformation: AppInformation) {
        showDetailPage(with: appInformation)
    }
    
    private func showDetailPage(with appInformation: AppInformation) {
        let detailViewModel = DetailViewModel(coordinator: self, appInformation: appInformation)
        let detailViewController = DetailViewController(viewModel: detailViewModel)
        
        navigationController.pushViewController(detailViewController, animated: true)
    }
    
    func end() {
        parentCoordinator?.removeChildCoordinator(self)
    }
}

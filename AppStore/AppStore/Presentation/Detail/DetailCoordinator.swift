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
    var type: CoordinatorType = .detail
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(with appInformation: AppInformation) {
        showDetailPage(with: appInformation)
    }
    
    private func showDetailPage(with appInformation: AppInformation) {
        let detailViewModel = DetailViewModel(coordinator: self, appInformation: appInformation)
        let detailViewController = DetailViewController(viewModel: detailViewModel)
        
        navigationController.pushViewController(detailViewController, animated: true)
    }
}

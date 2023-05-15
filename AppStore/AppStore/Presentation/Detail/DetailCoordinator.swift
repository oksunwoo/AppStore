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
    
    func start() {
        showDetailPage()
    }
    
    private func showDetailPage() {
        let navigationController = navigationController
        
    }
}

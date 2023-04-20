//
//  AppCoordinator.swift
//  AppStore
//
//  Created by Sunwoo on 2023/04/20.
//

import UIKit

final class AppCooridinator: Coordinator {
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
        
    }
    
}

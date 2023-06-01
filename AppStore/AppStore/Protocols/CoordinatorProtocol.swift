//
//  CoordinatorProtocol.swift
//  AppStore
//
//  Created by Sunwoo on 2023/04/17.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    var type: CoordinatorType { get }
}

extension Coordinator {
    func removeChildCoordinator(_ child: Coordinator) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}

//
//  CoordinatorProtocol.swift
//  AppStore
//
//  Created by Sunwoo on 2023/04/17.
//

import Foundation

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var type: CoordinatorType { get }
}

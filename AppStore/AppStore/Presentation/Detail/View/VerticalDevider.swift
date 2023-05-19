//
//  VerticalDevider.swift
//  AppStore
//
//  Created by Sunwoo on 2023/05/19.
//

import UIKit

final class VerticalDevider: UIView {
    func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: 0.5).isActive = true
        backgroundColor = .systemGray3
    }

}

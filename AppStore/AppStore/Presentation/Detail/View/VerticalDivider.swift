//
//  VerticalDivider.swift
//  AppStore
//
//  Created by Sunwoo on 2023/05/19.
//

import UIKit

final class VerticalDivider: UIView {
    convenience init() {
        self.init(frame: .zero)
        configure()
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: 0.5).isActive = true
        backgroundColor = .systemGray3
    }
}

//
//  HorizontalDivider.swift
//  AppStore
//
//  Created by Sunwoo on 2023/05/31.
//

import UIKit

final class HorizontalDivider: UIView {
    convenience init() {
        self.init(frame: .zero)
        configure()
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        backgroundColor = .systemGray4
    }
}

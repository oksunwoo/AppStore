//
//  InformationTableViewCell.swift
//  AppStore
//
//  Created by Sunwoo on 2023/05/30.
//

import UIKit

final class InformationTableViewCell: UITableViewCell {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .callout)
        label.textColor = .systemGray2
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        
        return label
    }()
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .callout)
        label.textColor = .black
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        
        return label
    }()
    
    convenience init() {
        self.init(frame: .zero)
        configureUI()
    }
    
    func configureUI() {
        addSubview(titleLabel)
        addSubview(contentLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            contentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            contentLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        titleLabel.text = "제공자"
        contentLabel.text = "Danggeun Market Inc."
    }
}

extension InformationTableViewCell {
    enum Text {
        static let reuseIdentifier = "InformationTableViewCell"
    }
}

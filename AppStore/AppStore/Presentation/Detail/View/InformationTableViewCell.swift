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
        label.textColor = .label
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier )
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setInformation(title: String, content: String) {
        titleLabel.text = title
        contentLabel.text = content
    }
    
    private func configureUI() {
        addSubview(titleLabel)
        addSubview(contentLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            contentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            contentLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}

extension InformationTableViewCell {
    enum Text {
        static let reuseIdentifier = "InformationTableViewCell"
    }
}

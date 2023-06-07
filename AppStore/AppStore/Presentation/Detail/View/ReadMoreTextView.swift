//
//  ReadMoreTextView.swift
//  AppStore
//
//  Created by Sunwoo on 2023/05/31.
//

import UIKit

final class ReadMoreTextView: UITextView {
    enum TextType {
        case release
        case description
    }
    
    convenience init(textType: TextType) {
        self.init(frame: .zero)
        configure(textType: textType)
    }
    
    func apply(with text: String) {
        self.text = text
    }
    
    private func configure(textType: TextType) {
        isEditable = false
        font = .preferredFont(forTextStyle: .callout)
        textColor = .label
        textAlignment = .left
        translatesAutoresizingMaskIntoConstraints = false
        isSelectable = false
        isScrollEnabled = false
        textContainer.lineBreakMode = .byTruncatingTail
        
        switch textType {
        case .release:
            textContainer.maximumNumberOfLines = 4
            
        case .description:
            textContainer.maximumNumberOfLines = 15
        }
    }
}

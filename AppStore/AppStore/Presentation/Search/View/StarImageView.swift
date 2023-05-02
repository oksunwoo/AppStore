//
//  StarImageView.swift
//  AppStore
//
//  Created by Sunwoo on 2023/05/02.
//

import UIKit

final class StarImageView: UIImageView {
    enum Star {
        case empty
        case filled
        case halfFilled
        
        var systemName: String {
            switch self {
            case .empty:
                return Text.emptyStar
            case .filled:
                return Text.filledStar
            case .halfFilled:
                return Text.halfStar
            }
        }
    }
    
    convenience init(star: Star) {
        self.init(image: UIImage(systemName: star.systemName))
        configureStar()
    }
    
    private func configureStar() {
        translatesAutoresizingMaskIntoConstraints = false
        tintColor = .systemGray
    }
}

extension StarImageView {
    private enum Text {
        static let emptyStar: String = "star"
        static let filledStar: String = "star.fill"
        static let halfStar: String = "star.leadinghalf.filled"
    }
}

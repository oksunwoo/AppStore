//
//  StarRatingStackView.swift
//  AppStore
//
//  Created by Sunwoo on 2023/05/02.
//

import UIKit

final class StarRatingStackView: UIStackView {
    private let maxStarCount = 5
    
    convenience init() {
        self.init()
        configureUI()
    }
    
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        axis = .horizontal
        distribution = .fillEqually
    }
    
    func makeStar(with rating: Double) {
        let filledStarCount = Int(rating)
        let halfFilledStarCount = rating - Double(filledStarCount) >= 0.5 ? 1 : 0
        let emptyStarCount = maxStarCount - filledStarCount - halfFilledStarCount
        
        for _ in 0..<filledStarCount {
            addArrangedSubview(StarImageView(star: .filled))
        }
        
        for _ in 0..<halfFilledStarCount {
            addArrangedSubview(StarImageView(star: .halfFilled))
        }
        
        for _ in 0..<emptyStarCount {
            addArrangedSubview(StarImageView(star: .empty))
        }
    }
}

//
//  Int+formatter.swift
//  AppStore
//
//  Created by Sunwoo on 2023/05/12.
//

import Foundation

extension Int {
    var ratingCountFormatter: String {
        let stringNumber = String(self)
        
        switch self {
        case 1000..<10000:
            let digit: Double = pow(10, 3)
            let ratingCount = String(format: "%.1f", Double(self)/digit)
            return "\(ratingCount)천"
        case 10000...:
            let digit: Double = pow(10, 4)
            let ratingCount = String(format: "%.1f", Double(self)/digit)
            return "\(ratingCount)만"
        default:
            return stringNumber
        }
    }
}

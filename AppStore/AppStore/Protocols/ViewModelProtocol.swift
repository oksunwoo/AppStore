//
//  ViewModelPrototol.swift
//  AppStore
//
//  Created by Sunwoo on 2023/04/24.
//

import Foundation

protocol ViewModelPrototol {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}

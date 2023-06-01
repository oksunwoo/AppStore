//
//  DetailViewModel.swift
//  AppStore
//
//  Created by Sunwoo on 2023/05/16.
//

import Foundation

class DetailViewModel: ViewModelProtocol {
    struct Input {
        
    }
    
    struct Output {
        
    }
    
    private weak var coordinator: DetailCoordinator!
    private let appInformation: AppInformation!
    
    init(coordinator: DetailCoordinator, appInformation: AppInformation) {
        self.coordinator = coordinator
        self.appInformation = appInformation
    }
    
    func transform(input: Input) -> Output {
        Output()
    }
    
}

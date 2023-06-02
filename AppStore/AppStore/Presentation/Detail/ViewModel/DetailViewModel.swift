//
//  DetailViewModel.swift
//  AppStore
//
//  Created by Sunwoo on 2023/05/16.
//

import Foundation
import Combine

final class DetailViewModel: ViewModelProtocol {
    struct Input {
        let appear: AnyPublisher<Void, Never>
    }
    
    struct Output {
        let appInformation: AnyPublisher<AppInformation, Never>
    }
    
    private weak var coordinator: DetailCoordinator!
    private let appInformation: AppInformation!
    
    init(coordinator: DetailCoordinator, appInformation: AppInformation) {
        self.coordinator = coordinator
        self.appInformation = appInformation
    }
    
    func transform(input: Input) -> Output {
        let appInformation = configureOperator(input: input.appear)
        return Output(appInformation: appInformation)
    }
    
    private func configureOperator(input publisher: AnyPublisher<Void, Never>) -> AnyPublisher<AppInformation, Never>{
        return publisher.map({
            self.appInformation
        })
        .eraseToAnyPublisher()
    }
}

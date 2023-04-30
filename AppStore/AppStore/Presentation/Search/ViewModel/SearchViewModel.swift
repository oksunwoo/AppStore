//
//  SearchViewModel.swift
//  AppStore
//
//  Created by Sunwoo on 2023/04/24.
//

import Foundation
import Combine

class SearchViewModel: ViewModelPrototol {
    struct Input {
        let keyword: AnyPublisher<String, Never>
    }
    
    struct Output {
        let isAPISuccess: AnyPublisher<Bool, Never>
    }
    
    private let coordinator: SearchCoordinator
    
    init(coordinator: SearchCoordinator) {
        self.coordinator = coordinator
    }
    
    func transform(input: Input) -> Output {
        
    }
    
    func configureSubject(input publisher: AnyPublisher<String, Never>) -> AnyPublisher<Bool, Never> {
        publisher
            .filter{ keyword in
                return keyword.isEmpty == false
            }
            .map { keyword in
            let resultPublisher = self.fetchData(with: keyword)
                .map { dto in

                }
            return true
        }
        .replaceError(with: false)
        .eraseToAnyPublisher()
    }
    
    private func fetchData(with keyword: String) -> AnyPublisher<SearchResultDTO, NetworkError> {
        return ItunesAPI.SearchAPI(appName: keyword).fetchData()
    }
    
}

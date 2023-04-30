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
    
    private func fetchData(with keyword: String) -> AnyPublisher<SearchResultDTO, NetworkError> {
        return ItunesAPI.SearchAPI(appName: keyword).fetchData()
    }
    
}

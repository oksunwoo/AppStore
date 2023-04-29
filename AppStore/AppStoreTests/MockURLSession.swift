//
//  MockURLSession.swift
//  AppStoreTests
//
//  Created by Sunwoo on 2023/04/29.
//

import Foundation
import Combine
@testable import AppStore

final class MockURLSession: APIProvider {
    func request<T: Decodable>(urlRequest: URLRequest) -> AnyPublisher<T, NetworkError> {
        guard let path = Bundle(for: type(of: self)).path(forResource: "mock", ofType: "json"),
                let jsonString = try? String(contentsOfFile: path),
                let data = jsonString.data(using: .utf8),
              let result = try? JSONDecoder().decode(SearchResultDTO.self, from: data) as? T else {
            fatalError()
        }
        
        return Just(result)
            .setFailureType(to: NetworkError.self)
            .eraseToAnyPublisher()
    }
}

final class MockFailURLSession: APIProvider {
    func request<T: Decodable>(urlRequest: URLRequest) -> AnyPublisher<T, NetworkError> {
        return Fail(error: NetworkError.invalidURL)
            .eraseToAnyPublisher()
    }
}

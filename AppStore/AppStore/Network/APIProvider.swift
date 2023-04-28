//
//  APIProvider.swift
//  AppStore
//
//  Created by Sunwoo on 2023/04/27.
//

import Foundation
import Combine

protocol APIProvider {
    func request<T: Decodable>(urlRequest: URLRequest) -> AnyPublisher<T, NetworkError>
}

extension URLSession: APIProvider {
    func request<T: Decodable>(urlRequest: URLRequest) -> AnyPublisher<T, NetworkError> {
        return dataTaskPublisher(for: urlRequest)
            .tryMap { data, response in
                let statusCode = 200..<300
                
                guard let httpResponse = response as? HTTPURLResponse,
                      statusCode.contains(httpResponse.statusCode) else {
                    throw NetworkError.responseError
                }
                
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                if let error = error as? NetworkError {
                    return error
                }
                
                return .UnknownError(message: error.localizedDescription)
            }
            .eraseToAnyPublisher()
    }
}

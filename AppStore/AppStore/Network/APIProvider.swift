//
//  APIProvider.swift
//  AppStore
//
//  Created by Sunwoo on 2023/04/27.
//

import Foundation
import Combine

protocol APIProvider {
    var session: URLSession { get }
    func request<T: Decodable>(urlRequest: URLRequest) -> AnyPublisher<T, NetworkError>
}

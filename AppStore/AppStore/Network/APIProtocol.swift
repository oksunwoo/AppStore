//
//  APIProtocol.swift
//  AppStore
//
//  Created by Sunwoo on 2023/04/26.
//

import Foundation
import Combine

protocol APIProtocol {
    var baseURL: String { get }
    var method: HttpMethod { get }
    var path: String { get }
    var header: [String: String] { get }
    var parameter: [String: String] { get }
    var body: Data? { get }
}

extension APIProtocol {
    var url: URL? {
        var urlComponents = URLComponents(string: self.baseURL + self.path)
        urlComponents?.queryItems = parameter.map { key, value in
            URLQueryItem(name: key, value: value)
        }
        
        return urlComponents?.url
    }
    
    var urlRequest: URLRequest? {
        guard let url = self.url else {
            return nil
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = self.method.description
        
        header.forEach { key, value in
            urlRequest.addValue(value, forHTTPHeaderField: key)
        }
        urlRequest.httpBody = body
        
        return urlRequest
    }
}

protocol Gettable: APIProtocol {
    func fetchData() -> AnyPublisher<SearchResultDTO, NetworkError>
}

extension Gettable {
    var method: HttpMethod {
        return .get
    }
    
    var body: Data? {
        return nil
    }
}

enum HttpMethod {
    case get
    
    var description: String {
        switch self {
        case .get:
                return "GET"
        }
    }
}

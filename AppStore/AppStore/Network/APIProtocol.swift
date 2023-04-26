//
//  APIProtocol.swift
//  AppStore
//
//  Created by Sunwoo on 2023/04/26.
//

import Foundation

protocol APIProtocol {
    var baseURL: String { get }
    var method: HttpMethod { get }
    var path: String { get }
    var header: [String: String] { get }
    var parameter: [String: String] { get }
    var body: Data? { get }
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

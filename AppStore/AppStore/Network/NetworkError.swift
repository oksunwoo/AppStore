//
//  NetworkError.swift
//  AppStore
//
//  Created by Sunwoo on 2023/04/27.
//

import Foundation

enum NetworkError: LocalizedError {
    case invalidURL
    case parseError
    case UnknownError(message: String)
    
    var errorDescription: String {
        switch self {
        case .invalidURL:
            return "Invalid URL Address"
        case . parseError:
            return "Parse Error"
        case .UnknownError(message: let message):
            return "Unknown Error : \(message)"
        }
    }
}

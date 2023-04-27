//
//  NetworkError.swift
//  AppStore
//
//  Created by Sunwoo on 2023/04/27.
//

import Foundation

enum NetworkError: LocalizedError {
    case URLIsNil
    case invaildURL
    case UnknownError(message: String)
    
    var errorDescription: String {
        switch self {
        case .URLIsNil:
            return "No URL"
        case .invaildURL:
            return "Invaild URL Address"
        case .UnknownError(message: let message):
            return "Unknown Error : \(message)"
        }
    }
}

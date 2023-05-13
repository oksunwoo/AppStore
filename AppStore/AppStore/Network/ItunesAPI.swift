//
//  ItunesAPI.swift
//  AppStore
//
//  Created by Sunwoo on 2023/04/29.
//

import Foundation
import Combine

struct ItunesAPI {
    static let baseURL: String = "http://itunes.apple.com/"
    static let header: [String: String] = ["Content-Type": "application/json", "Accept": "application/json"]
}

extension ItunesAPI {
    struct SearchAPI: Gettable {
        let session: SessionRequestable
        var baseURL = ItunesAPI.baseURL
        var header = ItunesAPI.header
        var path = "search"
        let appName: String
        var parameter: [String : String] {
            ["term" : appName, "country": "kr", "entity": "software", "limit": "20"]
        }
        
        init(session: SessionRequestable = URLSession.shared, appName: String) {
            self.session = session
            self.appName = appName
        }
        
        func fetchData() -> AnyPublisher<SearchResultDTO, NetworkError> {
            guard let request = urlRequest else {
                return Fail(error: NetworkError.invalidURL)
                    .eraseToAnyPublisher()
            }
            
            return session.request(urlRequest: request)
        }
    }
}

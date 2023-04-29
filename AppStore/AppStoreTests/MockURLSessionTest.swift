//
//  MockURLSessionTest.swift
//  AppStoreTests
//
//  Created by Sunwoo on 2023/04/29.
//

import XCTest
import Combine
@testable import AppStore

final class MockURLSessionTest: XCTestCase {
    var mockSession: SessionRequestable!
    var mockFailSession: SessionRequestable!
    
    var cancellable = Set<AnyCancellable>()

    override func setUpWithError() throws {
        self.mockSession = MockURLSession()
        self.mockFailSession = MockFailURLSession()
    }

    override func tearDownWithError() throws {
        self.mockSession = nil
        self.mockFailSession = nil
    }

    func test_request() throws {
        let testAppName = "터틀넥"
        let publisher = ItunesAPI.SearchAPI(session: mockSession, appName: testAppName).fetchData()
        
        publisher.sink { fail in
            if case .failure(_) = fail {
                XCTFail()
            }
        } receiveValue: { result in
            XCTAssertEqual("Sunwoo Nam", result.results[0].artistName)
        }.store(in: &cancellable)
    }

    func test_requestFail() throws {
        let testAppName = "터틀넥"
        let publisher = ItunesAPI.SearchAPI(session: mockFailSession, appName: testAppName).fetchData()
        
        publisher.sink { fail in
            if case .failure(let error) = fail {
                print(error)
                XCTAssertEqual(error, NetworkError.invalidURL)
            }
        } receiveValue: { _ in
            XCTFail()
        }.store(in: &cancellable)
    }
}

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

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

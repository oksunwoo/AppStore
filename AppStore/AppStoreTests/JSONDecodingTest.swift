//
//  JSONDecodingTest.swift
//  AppStoreTests
//
//  Created by Sunwoo on 2023/04/28.
//

import XCTest
@testable import AppStore

final class JSONDecodingTest: XCTestCase {
    func test_SearchResultDTO_decode시_parsing이_되는지() {
        guard let path = Bundle(for: type(of: self)).path(forResource: "mock", ofType: "json") else {
            XCTFail()
            return
        }
        
        guard let jsonString = try? String(contentsOfFile: path) else {
            XCTFail()
            return
        }
        
        guard let data = jsonString.data(using: .utf8) else {
            XCTFail()
            return
        }
        
        guard let result = try? JSONDecoder().decode(SearchResultDTO.self, from: data) else {
            XCTFail()
            return
        }
       
        XCTAssertEqual(result.resultCount, 2)
    }
}

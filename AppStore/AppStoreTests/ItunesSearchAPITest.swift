//
//  ItunesSearchAPITest.swift
//  AppStoreTests
//
//  Created by Sunwoo on 2023/05/01.
//

import XCTest
import Combine
@testable import AppStore

final class ItunesSearchAPITest: XCTestCase {
    var sut: ItunesAPI.SearchAPI!
    var cancellableBag: Set<AnyCancellable>!

    override func setUpWithError() throws {
        let searchKeyword: String = "터틀넥"
        sut = ItunesAPI.SearchAPI(appName: searchKeyword)
        cancellableBag = Set<AnyCancellable>()
    }

    override func tearDownWithError() throws {
        sut = nil
        cancellableBag = nil
    }

    func test_터틀넥_information을_잘불러오는지_test() throws {
        let expectation = XCTestExpectation(description: "SearchAPITest")
        let publisher = sut.fetchData()
        
        publisher.sink(receiveCompletion: { completion in
            if case .failure(_) = completion {
                XCTFail()
            }
        }, receiveValue: { searchResultDTO in
            XCTAssertNotNil(searchResultDTO)
            XCTAssertEqual(searchResultDTO.resultCount, 2)
            
            let appInformationDTO = searchResultDTO.results.first!
            let appInformation = AppInformation(
                artworkURL100: appInformationDTO.artworkUrl100,
                screenshotURLs: appInformationDTO.screenshotUrls,
                releaseNotes: appInformationDTO.releaseNotes,
                artistName: appInformationDTO.artistName,
                primaryGenreName: appInformationDTO.primaryGenreName,
                description: appInformationDTO.description,
                trackName: appInformationDTO.trackName,
                sellerName: appInformationDTO.sellerName,
                languageCodesISO2A: appInformationDTO.languageCodesISO2A,
                fileSizeBytes: appInformationDTO.fileSizeBytes,
                contentAdvisoryRating: appInformationDTO.contentAdvisoryRating,
                formattedPrice: appInformationDTO.formattedPrice,
                averageUserRating: appInformationDTO.averageUserRating,
                userRatingCount: appInformationDTO.userRatingCount,
                version: appInformationDTO.version)
            
            XCTAssertEqual(appInformation.trackName, "터틀넥 - 올바른 자세 검사")
            XCTAssertEqual(appInformation.sellerName, "Sunwoo Nam")
            
            expectation.fulfill()
        })
        .store(in: &cancellableBag)
        
        wait(for: [expectation], timeout: 5.0)
    }

}

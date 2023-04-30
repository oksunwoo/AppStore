//
//  SearchViewModel.swift
//  AppStore
//
//  Created by Sunwoo on 2023/04/24.
//

import Foundation
import Combine

class SearchViewModel: ViewModelPrototol {
    struct Input {
        let keyword: AnyPublisher<String, Never>
    }
    
    struct Output {
        let isAPISuccess: AnyPublisher<Bool, Never>
    }
    
    private let coordinator: SearchCoordinator
    
    init(coordinator: SearchCoordinator) {
        self.coordinator = coordinator
    }
    
    func transform(input: Input) -> Output {
        let isSuccess = configureSubject(input: input.keyword)
        return Output(isAPISuccess: isSuccess)
    }
    
    func configureSubject(input publisher: AnyPublisher<String, Never>) -> AnyPublisher<Bool, Never> {
        publisher
            .filter{ keyword in
                return keyword.isEmpty == false
            }
            .map { keyword in
                let resultPublisher = self.fetchData(with: keyword)
                    .map { resultDTO in
                        let results: [AppInformation] = resultDTO.results.map { appInformationDTO in
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
                                version: appInformationDTO.version
                            )
                            return appInformation
                        }
                    }
                return true
            }
            .replaceError(with: false)
            .eraseToAnyPublisher()
    }
    
    private func fetchData(with keyword: String) -> AnyPublisher<SearchResultDTO, NetworkError> {
        return ItunesAPI.SearchAPI(appName: keyword).fetchData()
    }
    
}

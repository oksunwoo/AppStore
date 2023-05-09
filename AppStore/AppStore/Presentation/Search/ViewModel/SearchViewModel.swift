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
        let searchButtonDidTap: AnyPublisher<String, Never>
    }
    
    struct Output {
        let isAPISuccess: AnyPublisher<Bool, Never>
    }
    
    //    private weak var coordinator: SearchCoordinator!
    //
    //    init(coordinator: SearchCoordinator) {
    //        self.coordinator = coordinator
    //    }
    
    func transform(input: Input) -> Output {
        let isSuccess = configureOperator(input: input.searchButtonDidTap)
        return Output(isAPISuccess: isSuccess)
    }
    
    func configureOperator(input publisher: AnyPublisher<String, Never>) -> AnyPublisher<Bool, Never> {
        return publisher
            .flatMap { keyword -> AnyPublisher<Bool, Never> in
                return self.fetchData(with: keyword).map { searchResultDTO -> Bool in
                    if searchResultDTO.resultCount == 0 {
                        return false
                    }
                    
                    let informationOfApps = searchResultDTO.results.map { appInformationDTO in
                        return AppInformation(
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
                    }
                    print(informationOfApps)
                    return true
                }
                .replaceError(with: false)
                .eraseToAnyPublisher()
            }.eraseToAnyPublisher()
    }
    
    private func fetchData(with keyword: String) -> AnyPublisher<SearchResultDTO, NetworkError> {
        return ItunesAPI.SearchAPI(appName: keyword).fetchData()
    }
}

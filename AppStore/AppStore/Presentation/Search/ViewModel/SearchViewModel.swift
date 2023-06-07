//
//  SearchViewModel.swift
//  AppStore
//
//  Created by Sunwoo on 2023/04/24.
//

import Foundation
import Combine

class SearchViewModel: ViewModelProtocol {
    struct Input {
        let searchButtonDidTap: AnyPublisher<String, Never>
    }
    
    struct Output {
        let appsItem: AnyPublisher<[AppInformation]?, Never>
    }
    
    private weak var coordinator: SearchCoordinator!
    
    init(coordinator: SearchCoordinator) {
        self.coordinator = coordinator
    }
    
    func transform(input: Input) -> Output {
        let appsInformation = configureOperator(input: input.searchButtonDidTap)
        return Output(appsItem: appsInformation)
    }
    
    private func configureOperator(input publisher: AnyPublisher<String, Never>) -> AnyPublisher<[AppInformation]?, Never> {
        return publisher
            .flatMap { keyword -> AnyPublisher<[AppInformation]?, Never> in
                return self.fetchData(with: keyword)
                    .map { searchResultDTO -> [AppInformation]? in
                        if searchResultDTO.resultCount == 0 {
                            return nil
                        }
                        
                        let appsInformation = searchResultDTO.results.map { appInformationDTO in
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
                                minimumOsVersion: appInformationDTO.minimumOSVersion,
                                version: appInformationDTO.version
                            )
                        }
                        return appsInformation
                    }
                    .replaceError(with: nil)
                    .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
    
    private func fetchData(with keyword: String) -> AnyPublisher<SearchResultDTO, NetworkError> {
        return ItunesAPI.SearchAPI(appName: keyword).fetchData()
    }
    
    func showDetailPage(with appInformation: AppInformation) {
        coordinator.showDetailPage(with: appInformation)
    }
    
    func endSearchPage() {
        coordinator.end()
    }
}

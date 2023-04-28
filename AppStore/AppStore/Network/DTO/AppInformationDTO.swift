//
//  AppInformationDTO.swift
//  AppStore
//
//  Created by Sunwoo on 2023/04/25.
//

import Foundation

struct AppInformationDTO: Decodable {
    let artworkUrl100: String
    let artistViewURL: String
    let screenshotUrls: [String]
    let artworkUrl60, artworkUrl512: String
    let supportedDevices: [String]
    let advisories: [String]
    let features: [String]
    let isGameCenterEnabled: Bool
    let kind: String
    let ipadScreenshotUrls: [String]
    let appletvScreenshotUrls: [String]
    let currentVersionReleaseDate: String
    let artistID: Int
    let artistName: String
    let genres: [String]
    let price: Double
    let description: String
    let releaseDate: String
    let sellerName: String
    let genreIDS: [String]
    let bundleID: String
    let trackID: Int
    let trackName: String
    let primaryGenreName: String
    let primaryGenreID: Int
    let minimumOSVersion: String
    let currency: String
    let trackViewURL: String
    let contentAdvisoryRating: String
    let averageUserRatingForCurrentVersion: Double
    let userRatingCountForCurrentVersion: Int
    let formattedPrice: String
    let averageUserRating: Double
    let trackContentRating: String
    let languageCodesISO2A: [String]
    let fileSizeBytes: String
    let trackCensoredName: String
    let isVppDeviceBasedLicensingEnabled: Bool
    let releaseNotes: String
    let version: String
    let wrapperType: String
    let userRatingCount: Int
    
    enum CodingKeys: String, CodingKey {
        case isGameCenterEnabled, advisories, features, supportedDevices, ipadScreenshotUrls, artworkUrl60, artworkUrl512, artworkUrl100, appletvScreenshotUrls
        case artistViewURL = "artistViewUrl"
        case screenshotUrls
        case kind, currentVersionReleaseDate
        case artistID = "artistId"
        case artistName, genres, price, description, releaseDate, sellerName
        case genreIDS = "genreIds"
        case bundleID = "bundleId"
        case trackID = "trackId"
        case trackName, primaryGenreName
        case primaryGenreID = "primaryGenreId"
        case minimumOSVersion = "minimumOsVersion"
        case currency
        case trackViewURL = "trackViewUrl"
        case contentAdvisoryRating, averageUserRatingForCurrentVersion, userRatingCountForCurrentVersion, formattedPrice, averageUserRating, trackContentRating, languageCodesISO2A, fileSizeBytes, trackCensoredName, isVppDeviceBasedLicensingEnabled, releaseNotes, version, wrapperType, userRatingCount
    }
}

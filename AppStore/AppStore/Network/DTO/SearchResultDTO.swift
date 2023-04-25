//
//  SearchResultDTO.swift
//  AppStore
//
//  Created by Sunwoo on 2023/04/25.
//

import Foundation

struct SearchResultDTO: Decodable {
    let resultCount: Int
    let results: [AppInformationDTO]
}

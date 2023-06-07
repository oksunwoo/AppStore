//
//  String+FileSize.swift
//  AppStore
//
//  Created by Sunwoo on 2023/06/06.
//

import Foundation

extension String {
    func fileSizeFormatter() -> String {
        guard let number = Double(self) else {
            return "확인 불가"
        }
        
        let fileSize = String(format: "%1.f", number / Double(1024*1024)) + "MB"
        
        return fileSize
    }
}

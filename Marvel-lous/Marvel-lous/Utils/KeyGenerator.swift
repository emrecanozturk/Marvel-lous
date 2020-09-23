//
//  KeyGenerator.swift
//  Marvel-lous
//
//  Created by Zodiac on 13.09.2020.
//  Copyright © 2020 path. All rights reserved.
//

import Foundation
import CryptoSwift

struct KeyGenerator {

    static private var timestamp: String = ""
    static private let publicKey: String = "de38f361e888c06c7234bae538c05ecb"
    static private let privateKey: String = "76967d555da5b56c40bd01726f93a85dad059e28"

    static func getApiKey() -> String {
        return KeyGenerator.publicKey
    }

    static func getTimeStamp() -> String {
        KeyGenerator.timestamp = "\(Date().timeIntervalSince1970)"
        return KeyGenerator.timestamp
    }

    static func getHash() -> String {
        return "\(KeyGenerator.timestamp)\(KeyGenerator.privateKey)\(KeyGenerator.publicKey)".md5()
    }
    
    static func getCurrentData() -> String {
        
        let date = Date()

        let components = date.get(.day, .month, .year)
        if let day = components.day, let month = components.month, let year = components.year {
            return "\(year)-\(month)-\(day)"
        }
        return ""
    }
}

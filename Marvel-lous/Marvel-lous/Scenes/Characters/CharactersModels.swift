//
//  CharactersModels.swift
//  Marvel-lous
//
//  Created by Zodiac on 13.09.2020.
//  Copyright (c) 2020 path. All rights reserved.
//

import UIKit

enum Characters {
    // MARK: Use cases
  
    enum Something {
        struct Request {}
        struct Response: Codable {
            public let code: Int?
            public let status: String?
            public let copyright: String?
            public let attributionText: String?
            public let attributionHTML: String?
            public let etag: String?
            public let data: DataClass?
        }
        struct ViewModel {}
    }
}

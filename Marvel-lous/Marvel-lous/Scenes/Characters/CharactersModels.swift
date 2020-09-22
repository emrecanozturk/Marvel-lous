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
  
    enum Select {
        struct Request {
            let limit: Int!
            let offset: Int!
        }
        struct Response: Codable {
            let code: Int?
            let status: String?
            let copyright: String?
            let attributionText: String?
            let attributionHTML: String?
            let etag: String?
            let data: DataClass?
        }
        struct ViewModel: Codable {
            let characters: [Result]?
        }
    }
}

//
//  DetailDataModels.swift
//  Marvel-lous
//
//  Created by Emrecan Ozturk on 23.09.2020.
//  Copyright © 2020 path. All rights reserved.
//

import Foundation

// MARK: - DataClass
public struct DetailData: Decodable {
    let offset: Int?
    let limit: Int?
    let total: Int?
    let count: Int?
    let results: [DetailResult]?
}
//
// MARK: - Result
public struct DetailResult: Decodable {
    let title: String?
    let thumbnail: Image?
}

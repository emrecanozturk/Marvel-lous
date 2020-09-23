//
//  DataModels.swift
//  Marvel-lous
//
//  Created by Emrecan Ozturk on 22.09.2020.
//  Copyright © 2020 path. All rights reserved.
//

import Foundation

// MARK: - DataClass
public struct CharacterData: Decodable {
    public let offset: Int?
    public let limit: Int?
    public let total: Int?
    public let count: Int?
    public let results: [CharacterResult]?
}

// MARK: - Result
public struct CharacterResult: Decodable {
    public let id: Int?
    public let name: String?
    public let description: String?
    public let modified: String?
    public let thumbnail: Image?
    public let resourceURI: String?
    public let comics: Comics?
    public let series: Comics?
    public let stories: Stories?
    public let events: Comics?
    public let urls: [URLElement]?
}

// MARK: - Comics
public struct Comics: Codable {
    public let available: Int?
    public let collectionURI: String?
    public let items: [ComicsItem]?
    public let returned: Int?
}

// MARK: - ComicsItem
public struct ComicsItem: Codable {
    public let resourceURI: String?
    public let name: String?
}

// MARK: - Stories
public struct Stories: Codable {
    public let available: Int?
    public let collectionURI: String?
    public let items: [StoriesItem]?
    public let returned: Int?
}

// MARK: - StoriesItem
public struct StoriesItem: Codable {
    public let resourceURI: String?
    public let name: String?
    public let type: String?
}

// MARK: - Image
public struct Image: Decodable {
    
    let url: URL?
    
    init(_ url: URL?) {
        self.url = url
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let path = try container.decode(String.self, forKey: .path)
        let fileExtension = try container.decode(String.self, forKey: .fileExtension)
        self.url = URL(string: "\(path).\(fileExtension)")
    }
    
    enum CodingKeys: String, CodingKey {
        case path
        case fileExtension = "extension"
    }
}

// MARK: - URLElement
public struct URLElement: Codable {
    public let type: String?
    public let url: URL?
}

//
//  CharactersAPI.swift
//  Marvel-lous
//
//  Created by Zodiac on 13.09.2020.
//  Copyright © 2020 path. All rights reserved.
//

import Moya

enum CharactersAPI {
    case getCharacters(limit: Int, offset: Int)
}

extension CharactersAPI: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "https://gateway.marvel.com") else { fatalError() }
        return url
    }
    
    var path: String {
        "/v1/public/characters"
    }
    
    var method: Method {
        .get
    }
    
    var sampleData: Data {
        Data()
    }
    
    var task: Task {
        switch self {
            case .getCharacters(let limit, let offset):
                return .requestParameters(parameters: ["ts": KeyGenerator.getTimeStamp(),
                                                       "hash": KeyGenerator.getHash(),
                                                       "apikey": KeyGenerator.getApiKey(),
                                                       "limit": limit,
                                                       "offset": offset], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
//        ["Content-type": "application/json"]
        return nil
    }
    
    
}

//
//  DetailsAPI.swift
//  Marvel-lous
//
//  Created by Emrecan Ozturk on 23.09.2020.
//  Copyright © 2020 path. All rights reserved.
//

import Moya

enum DetailAPI {
    case getComics(id: Int, limit: Int)
}

extension DetailAPI: TargetType {
    var baseURL: URL {
        guard let apiURL = Bundle.infoPlistValue(forKey: "BaseAPIUrl") else { fatalError("Base URL API error") }
        return apiURL
    }
    
    var path: String {
        switch self {
        case .getComics(let id, _):
            return "/v1/public/characters/" + "\(id)" + "/comics"
        }
    }
    
    var method: Method {
        .get
    }
    
    var sampleData: Data {
        Data()
    }
    
    var task: Task {
        switch self {
            case .getComics(let id, let limit):
                return .requestParameters(parameters: ["ts": KeyGenerator.getTimeStamp(),
                                                       "hash": KeyGenerator.getHash(),
                                                       "apikey": KeyGenerator.getApiKey(),
                                                       "limit": limit,
                                                       "formatType": "comic",
                                                       "dateRange": "2005-01-0," + KeyGenerator.getCurrentData(),
                                                       "orderBy": "onsaleDate"], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        ["Content-type": "application/json"]
    }
    
    var validationType: ValidationType  {
        .successAndRedirectCodes
    }
    
}


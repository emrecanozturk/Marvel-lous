//
//  DetailsNetworkManager.swift
//  Marvel-lous
//
//  Created by Emrecan Ozturk on 23.09.2020.
//  Copyright © 2020 path. All rights reserved.
//

import Moya
import PromiseKit

typealias detailsResponseSuccess = (_ response: Detail.Select.Response) -> ()

protocol DetailNetworkable {
    var provider: MoyaProvider<DetailAPI> { get }
    func getComics(id: Int, limit: Int, with succes: @escaping detailsResponseSuccess, failure: @escaping responseFailure)
}

struct DetailNetworkManager: DetailNetworkable {
    
    var provider = MoyaProvider<DetailAPI>(plugins: [NetworkLoggerPlugin()])
    
    func getComics(id: Int, limit: Int, with succes: @escaping detailsResponseSuccess, failure: @escaping responseFailure) {
        firstly {
            provider.request(target: .getComics(id: id, limit: limit))
        }.map {
            try JSONDecoder().decode(Detail.Select.Response.self, from: $0.data)
        }.done { data in
            succes(data)
        }.catch { error in
            failure(error)
        }
    }
    
}

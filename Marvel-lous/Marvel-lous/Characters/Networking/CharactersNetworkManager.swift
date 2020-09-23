//
//  CharactersNetworkManager.swift
//  Marvel-lous
//
//  Created by Zodiac on 13.09.2020.
//  Copyright © 2020 path. All rights reserved.
//

import Moya
import PromiseKit

typealias charactersResponseSuccess = (_ response: Characters.Select.Response) -> ()
typealias responseFailure = (_ response: Error) -> ()

protocol CharactersNetworkable {
    var provider: MoyaProvider<CharactersAPI> { get }
    func getCharacters(limit: Int, offset: Int, with succes: @escaping charactersResponseSuccess, failure: @escaping responseFailure)
}

struct CharactersNetworkManager: CharactersNetworkable {
    
    var provider = MoyaProvider<CharactersAPI>()
    
    func getCharacters(limit: Int, offset: Int, with succes: @escaping charactersResponseSuccess, failure: @escaping responseFailure) {
        firstly {
            provider.request(target: .getCharacters(limit: limit, offset: offset))
        }.map {
            try JSONDecoder().decode(Characters.Select.Response.self, from: $0.data)
        }.done { data in
            succes(data)
        }.catch { error in
            failure(error)
        }
    }
    
}

//
//  CharactersNetworkManager.swift
//  Marvel-lous
//
//  Created by Zodiac on 13.09.2020.
//  Copyright © 2020 path. All rights reserved.
//

import Moya

typealias responseSuccess = (_ response: Any) -> ()
typealias responseFailure = (_ response: Any) -> ()

protocol Networkable {
    var provider: MoyaProvider<CharactersAPI> { get }
    func getCharacters(limit: Int, offset: Int, with succes: @escaping responseSuccess, failure: @escaping responseFailure)
}

struct CharactersNetworkManager: Networkable {
    var provider: MoyaProvider<CharactersAPI>
    
    func getCharacters(limit: Int, offset: Int, with succes: @escaping responseSuccess, failure: @escaping responseFailure) {
        
    }
    
    
}

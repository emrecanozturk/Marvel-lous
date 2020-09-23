//
//  CharactersWorker.swift
//  Marvel-lous
//
//  Created by Zodiac on 13.09.2020.
//  Copyright (c) 2020 path. All rights reserved.
//

import UIKit

class CharactersWorker {
    
    func getCharacters(limit: Int, offset: Int, with succes: @escaping charactersResponseSuccess, failure: @escaping responseFailure) {
        CharactersNetworkManager().getCharacters(limit: limit, offset: offset, with: { (response) in
            succes(response)
        }) { (error) in
            failure(error)
        }
    }
}

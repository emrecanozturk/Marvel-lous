//
//  CharactersInteractor.swift
//  Marvel-lous
//
//  Created by Zodiac on 13.09.2020.
//  Copyright (c) 2020 path. All rights reserved.
//

import UIKit

protocol CharactersBusinessLogic {
    func getCharacters(request: Characters.Select.Request)
    func sendToDetail(character: CharacterResult?)
}

protocol CharactersDataStore {
    var character: CharacterResult? { get set }
}

class CharactersInteractor: CharactersBusinessLogic, CharactersDataStore {
    
    var presenter: CharactersPresentationLogic?
    var worker: CharactersWorker?
    
    var character: CharacterResult?
  
    // MARK: Get Characters
  
    func getCharacters(request: Characters.Select.Request) {
        worker = CharactersWorker()
        worker?.getCharacters(limit: request.limit, offset: request.offset, with: { [self] (success) in
            presenter?.presentCharacters(response: success)
        }, failure: { [self] (error) in
            presenter?.presentError(error: error)
        })
    }
    
    func sendToDetail(character: CharacterResult?) {
        self.character = character
        presenter?.presentDetailPage(character: character)
    }
    
}

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
    func sendToDetail(character: Result?)
}

protocol CharactersDataStore {
    var character: Result? { get set }
}

class CharactersInteractor: CharactersBusinessLogic, CharactersDataStore {
    
    var presenter: CharactersPresentationLogic?
    var worker: CharactersWorker?
    
    var character: Result?
  
    // MARK: Get Characters
  
    func getCharacters(request: Characters.Select.Request) {
        worker = CharactersWorker()
        worker?.getCharacters(limit: request.limit, offset: request.offset, with: { (success) in
            self.presenter?.presentCharacters(response: success)
        }, failure: { (error) in
            self.presenter?.presentError(error: error)
        })
    }
    
    func sendToDetail(character: Result?) {
        self.character = character
        presenter?.presentDetailPage(character: character)
    }
    
}

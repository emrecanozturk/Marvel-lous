//
//  CharactersInteractor.swift
//  Marvel-lous
//
//  Created by Zodiac on 13.09.2020.
//  Copyright (c) 2020 path. All rights reserved.
//

import UIKit

protocol CharactersBusinessLogic {
    func doSomething(request: Characters.Something.Request)
}

protocol CharactersDataStore {
    //var name: String { get set }
}

class CharactersInteractor: CharactersBusinessLogic, CharactersDataStore {
    var presenter: CharactersPresentationLogic?
    var worker: CharactersWorker?
    //var name: String = ""
  
    // MARK: Do something
  
    func doSomething(request: Characters.Something.Request) {
        worker = CharactersWorker()
        worker?.doSomeWork()
    
        let response = Characters.Something.Response()
        presenter?.presentSomething(response: response)
    }
}

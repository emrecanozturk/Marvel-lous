//
//  CharactersPresenter.swift
//  Marvel-lous
//
//  Created by Zodiac on 13.09.2020.
//  Copyright (c) 2020 path. All rights reserved.
//

import UIKit

protocol CharactersPresentationLogic {
    func presentCharacters(response: Characters.Select.Response)
    func presentError(error: Error)
    func presentDetailPage(character: CharacterResult?)
}

class CharactersPresenter: CharactersPresentationLogic {
    weak var viewController: CharactersDisplayLogic?
  
    // MARK: Present Characters
  
    func presentCharacters(response: Characters.Select.Response) {
        let viewModel = Characters.Select.ViewModel(characters: response.data?.results)
        viewController?.displayCharacters(viewModel: viewModel)
    }
    
    func presentError(error: Error) {
        viewController?.displayError(error: error)
    }
    
    func presentDetailPage(character: CharacterResult?) {
        viewController?.displayDetailpage(character: character)
    }
}

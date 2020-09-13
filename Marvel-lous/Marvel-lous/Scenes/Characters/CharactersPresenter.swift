//
//  CharactersPresenter.swift
//  Marvel-lous
//
//  Created by Zodiac on 13.09.2020.
//  Copyright (c) 2020 path. All rights reserved.
//

import UIKit

protocol CharactersPresentationLogic {
    func presentSomething(response: Characters.Something.Response)
}

class CharactersPresenter: CharactersPresentationLogic {
    weak var viewController: CharactersDisplayLogic?
  
    // MARK: Do something
  
    func presentSomething(response: Characters.Something.Response) {
        let viewModel = Characters.Something.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
}

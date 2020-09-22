//
//  DetailPresenter.swift
//  Marvel-lous
//
//  Created by Emrecan Ozturk on 22.09.2020.
//  Copyright (c) 2020 path. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol DetailPresentationLogic {
    func presentSomething(response: Detail.Something.Response)
}

class DetailPresenter: DetailPresentationLogic {
    weak var viewController: DetailDisplayLogic?
  
    // MARK: Do something
  
    func presentSomething(response: Detail.Something.Response) {
        let viewModel = Detail.Something.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
}

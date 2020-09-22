//
//  CharactersViewController.swift
//  Marvel-lous
//
//  Created by Zodiac on 13.09.2020.
//  Copyright (c) 2020 path. All rights reserved.
//

import UIKit
import Moya

protocol CharactersDisplayLogic: class {
    func displayCharacters(viewModel: Characters.Select.ViewModel)
    func displayError(error: Error)
}

class CharactersViewController: UITableViewController, CharactersDisplayLogic {
    var interactor: CharactersBusinessLogic?
    var router: (NSObjectProtocol & CharactersRoutingLogic & CharactersDataPassing)?
    
    let dataSource = CharactersDataSource()
    private var page: Int = 0
    private let limit: Int = 30

    // MARK: Object lifecycle
  
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
  
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
  
    // MARK: Setup
  
    private func setup() {
        let viewController = self
        let interactor = CharactersInteractor()
        let presenter = CharactersPresenter()
        let router = CharactersRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
  
    // MARK: Routing
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
  
    // MARK: View lifecycle
  
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
        getCharacters(page: page)
    }
  
    // MARK: Get Characters
  
    func getCharacters(page: Int) {
        let request = Characters.Select.Request(limit: limit, offset: limit*page)
        interactor?.getCharacters(request: request)
    }
  
    func displayCharacters(viewModel: Characters.Select.ViewModel) {
        dataSource.results = viewModel.characters
        tableView.reloadData()
    }
    
    func displayError(error: Error) {
        
    }
}

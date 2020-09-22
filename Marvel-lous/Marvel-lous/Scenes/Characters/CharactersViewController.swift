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
    func displayDetailpage(character: Result?)
}

class CharactersViewController: UITableViewController, CharactersDisplayLogic {
    var interactor: CharactersBusinessLogic?
    var router: (NSObjectProtocol & CharactersRoutingLogic & CharactersDataPassing)?
    
    let dataSource = CharactersDataSource()
    private var page: Int = 0 {
        willSet {
            getCharacters(page: newValue)
        }
    }
    private let limit: Int = 30
    private var spinner: UIActivityIndicatorView?

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
        initSpinner()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        title = "Heros"
    }
    
    func initSpinner() {
        spinner = UIActivityIndicatorView(style: .medium)
        spinner?.frame = CGRect(x: 0.0, y: 0.0, width: tableView.bounds.width, height: 70)
    }
  
    // MARK: Get Characters
  
    func getCharacters(page: Int) {
        let request = Characters.Select.Request(limit: limit, offset: limit*page)
        interactor?.getCharacters(request: request)
    }
  
    func displayCharacters(viewModel: Characters.Select.ViewModel) {
        guard let characters = viewModel.characters else { print("No characters"); return }
        spinner?.stopAnimating()
        tableView.tableFooterView = nil
        dataSource.results?.append(contentsOf: characters)
        tableView.reloadData()
    }
    
    func displayDetailpage(character: Result?) {
        router?.navigateToDetail(source: self, destination: DetailViewController.instantiate())
    }
    
    func displayError(error: Error) {
        
    }
}


extension CharactersViewController {
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let count = dataSource.results?.count else { fatalError("Data source count reading error") }
        if indexPath.section ==  tableView.numberOfSections - 1 && indexPath.row == tableView.numberOfRows(inSection: tableView.numberOfSections - 1) - 1 && count > 0 {
            spinner?.startAnimating()
            tableView.tableFooterView = spinner
        }
        if indexPath.row == count - 1 { page += 1 }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        interactor?.sendToDetail(character: dataSource.results?[indexPath.row])
    }
}

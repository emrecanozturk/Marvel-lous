//
//  DetailViewController.swift
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
import MXParallaxHeader
import Kingfisher

protocol DetailDisplayLogic: class {
    func displaySomething(viewModel: Detail.Something.ViewModel)
}

class DetailViewController: UIViewController, DetailDisplayLogic {
    var interactor: DetailBusinessLogic?
    var router: (NSObjectProtocol & DetailRoutingLogic & DetailDataPassing)?
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    // MARK: Object lifecycle
  
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
  
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    static func instantiate() -> DetailViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
    }
  
    // MARK: Setup
  
    private func setup() {
        let viewController = self
        let interactor = DetailInteractor()
        let presenter = DetailPresenter()
        let router = DetailRouter()
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
        setDatas()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        initUI()
    }
  
    // MARK: Do something
  
    //@IBOutlet weak var nameTextField: UITextField!
  
    func setDatas() {
        if let name = router?.dataStore?.character?.name, name != "" {
            nameLabel.text = name
            title = name
        } else {
            nameLabel.text = "No content"
        }
        
        if let description = router?.dataStore?.character?.description, description != "" {
            descriptionLabel.text = description
        } else {
            descriptionLabel.text = "No content"
        }
        
        headerImageView.kf.setImage(with: router?.dataStore?.character?.thumbnail?.url, options: [.processor(DefaultImageProcessor.default)])
    }
    
    func initUI() {
        scrollView.parallaxHeader.view = headerImageView
        scrollView.parallaxHeader.height = 250
        scrollView.parallaxHeader.mode = .fill
        scrollView.parallaxHeader.minimumHeight = 50
    }
  
    func displaySomething(viewModel: Detail.Something.ViewModel) {
        //nameTextField.text = viewModel.name
    }
}

//
//  CharactersRouter.swift
//  Marvel-lous
//
//  Created by Zodiac on 13.09.2020.
//  Copyright (c) 2020 path. All rights reserved.
//

import UIKit

@objc protocol CharactersRoutingLogic {
    //func routeToSomewhere(segue: UIStoryboardSegue?)
    func navigateToDetail(source: CharactersViewController, destination: DetailViewController)
}

protocol CharactersDataPassing {
    var dataStore: CharactersDataStore? { get }
}

class CharactersRouter: NSObject, CharactersRoutingLogic, CharactersDataPassing {
    weak var viewController: CharactersViewController?
    var dataStore: CharactersDataStore?
  
    // MARK: Routing

    //func routeToSomewhere(segue: UIStoryboardSegue?) {
    //
    //  if let segue = segue {
    //    let destinationVC = segue.destination as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //  } else {
    //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //    navigateToSomewhere(source: viewController!, destination: destinationVC)
    //  }
    //}

    // MARK: Navigation

    func navigateToDetail(source: CharactersViewController, destination: DetailViewController) {
        var destinationDS = destination.router!.dataStore!
        passDataToDetail(source: dataStore!, destination: &destinationDS)
        source.navigationController?.show(destination, sender: nil)
    }

    // MARK: Passing data

    func passDataToDetail(source: CharactersDataStore, destination: inout DetailDataStore) {
        destination.character = source.character
    }
}

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

    //func navigateToSomewhere(source: CharactersViewController, destination: SomewhereViewController) {
    //
    //  source.show(destination, sender: nil)
    //}

    // MARK: Passing data

    //func passDataToSomewhere(source: CharactersDataStore, destination: inout SomewhereDataStore) {
    //
    //  destination.name = source.name
    //}
}

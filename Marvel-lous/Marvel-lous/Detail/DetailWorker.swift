//
//  DetailWorker.swift
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

class DetailWorker {
    func getComics(id: Int?, with succes: @escaping detailsResponseSuccess, failure: @escaping responseFailure) {
        guard let id = id else { fatalError("No id for comics")}
        DetailNetworkManager().getComics(id: id, limit: 100, with: { (response) in
            succes(response)
        }) { (error) in
            failure(error)
        }
    }
}

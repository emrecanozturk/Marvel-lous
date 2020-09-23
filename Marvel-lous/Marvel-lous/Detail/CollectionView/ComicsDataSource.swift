//
//  ComicsDataSource.swift
//  Marvel-lous
//
//  Created by Emrecan Ozturk on 23.09.2020.
//  Copyright © 2020 path. All rights reserved.
//

import UIKit

class ComicssDataSource: NSObject, UICollectionViewDataSource {
    
    var results: [ComicResult]? = []
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ComicCollectionViewCell.self), for: indexPath) as? ComicCollectionViewCell else { return UICollectionViewCell() }
        cell.setDatas(comic: results?[indexPath.row])
        return cell
    }
}


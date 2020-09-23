//
//  ComicCollectionViewCell.swift
//  Marvel-lous
//
//  Created by Emrecan Ozturk on 23.09.2020.
//  Copyright © 2020 path. All rights reserved.
//

import UIKit
import Kingfisher

class ComicCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var comicTitleLabel: UILabel!
    
    func setDatas(comic: ComicResult?) {
        coverImageView.kf.setImage(with: comic?.thumbnail?.url)
        comicTitleLabel.text = comic?.title
    }
}

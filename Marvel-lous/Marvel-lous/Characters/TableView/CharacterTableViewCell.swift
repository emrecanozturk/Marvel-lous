//
//  CharacterTableViewCell.swift
//  Marvel-lous
//
//  Created by Emrecan Ozturk on 22.09.2020.
//  Copyright © 2020 path. All rights reserved.
//

import UIKit
import Kingfisher

class CharacterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setDatas(character: CharacterResult?) {
        backgroundImageView.kf.setImage(with:character?.thumbnail?.url)
        nameLabel.text = character?.name
    }

}

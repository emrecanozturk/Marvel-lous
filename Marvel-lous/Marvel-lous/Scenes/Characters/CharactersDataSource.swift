//
//  CharactersDataSource.swift
//  Marvel-lous
//
//  Created by Emrecan Ozturk on 22.09.2020.
//  Copyright © 2020 path. All rights reserved.
//

import UIKit

class CharactersDataSource: NSObject, UITableViewDataSource {
    
    var results: [Result]? = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CharacterTableViewCell.self), for: indexPath) as? CharacterTableViewCell else { return UITableViewCell() }
        cell.setDatas(character: results?[indexPath.row])
        return cell
    }
    
}

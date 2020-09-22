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
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath)
        cell.textLabel?.text = results?[indexPath.row].name
        return cell
    }
    
}

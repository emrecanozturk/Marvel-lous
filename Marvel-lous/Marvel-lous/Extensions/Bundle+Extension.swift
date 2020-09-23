//
//  Bundle+Extension.swift
//  Marvel-lous
//
//  Created by Emrecan Ozturk on 22.09.2020.
//  Copyright © 2020 path. All rights reserved.
//

import Foundation

extension Bundle {
    static func infoPlistValue(forKey key: String) -> URL? {
        
        guard let path = Bundle.main.path(forResource: "Info", ofType: "plist") else { fatalError("Plist reading error") }
        guard let dict = NSDictionary(contentsOfFile: path) as? [String: AnyObject] else { fatalError("Plist casting error") }
        guard let value = dict[key] as? String else { fatalError("Plist value String casting error") }
        guard let url = URL(string: value) else { fatalError("Plist value URL casting error") }
        
        return url
    }
}

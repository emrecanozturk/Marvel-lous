//
//  UIViewController+Extension.swift
//  Marvel-lous
//
//  Created by Emrecan Ozturk on 23.09.2020.
//  Copyright © 2020 path. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlertView(titleString : String , messageString: String) {
        let alertView = UIAlertController(title: titleString, message: messageString, preferredStyle: .alert)

        let alertAction = UIAlertAction(title: "Ok", style: .cancel) { (alert) in
            alertView.dismiss(animated: true, completion: nil)
        }
        alertView.addAction(alertAction)
        self.present(alertView, animated: true, completion: nil)
    }
}

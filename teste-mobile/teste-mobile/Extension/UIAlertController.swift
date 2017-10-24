//
//  UIAlertController.swift
//  teste-mobile
//
//  Created by Nicolau Atala Pelluzi on 24/10/17.
//  Copyright © 2017 Nicolau Atala Pelluzi. All rights reserved.
//

import UIKit

class Alert {
    
    static func showMessage(message: String?) -> UIAlertController {
        let alert = UIAlertController(title: "Atenção", message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default) { (alertAction) in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okButton)
        return alert
    }
    
}

//
//  UILabel+Extension.swift
//  teste-mobile
//
//  Created by Nicolau Atala Pelluzi on 24/10/17.
//  Copyright © 2017 Nicolau Atala Pelluzi. All rights reserved.
//

import UIKit

extension UILabel {
    
    func setDynamicFont() {
        self.font = UIFont(name: self.font.fontName, size: UIView.heightScaleProportion()*self.font.pointSize)!
    }
    
}

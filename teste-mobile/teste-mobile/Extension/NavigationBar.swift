//
//  NavigationBar.swift
//  teste-mobile
//
//  Created by Nicolau Atala Pelluzi on 24/10/17.
//  Copyright © 2017 Nicolau Atala Pelluzi. All rights reserved.
//

import UIKit

protocol NavigationBarDelegate: NSObjectProtocol {
    func leftButtonTouchUpInside()
    func rightButtonTouchUpInside()
    func centerButtonTouchUpInside()
}

extension NavigationBarDelegate {
    func leftButtonTouchUpInside() {}
    func rightButtonTouchUpInside() {}
    func centerButtonTouchUpInside() {}
}

class NavigationBar: UIView {
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var image: UIImageView!
    
    weak var delegate: NavigationBarDelegate?
    
    override func awakeFromNib() {
        titleLabel.setDynamicFont()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        Bundle.main.loadNibNamed("NavigationBar", owner: self, options: nil)
        self.addSubview(view)
        view.frame = self.bounds
    }
    
    @IBAction func leftButtonTouchUpInside(_ sender: Any) {
        delegate?.leftButtonTouchUpInside()
    }
    
    @IBAction func rightButtonTouchUpInside(_ sender: Any) {
        delegate?.rightButtonTouchUpInside()
    }
    
    @IBAction func centerButtonTouchUpInside(_ sender: Any) {
        delegate?.centerButtonTouchUpInside()
    }
}

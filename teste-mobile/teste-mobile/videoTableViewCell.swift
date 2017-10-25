//
//  VideoTableViewCell.swift
//  teste-mobile
//
//  Created by Nicolau Atala Pelluzi on 24/10/17.
//  Copyright © 2017 Nicolau Atala Pelluzi. All rights reserved.
//

import UIKit
import Kingfisher

class videoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.setDynamicFont()
        descriptionLabel.setDynamicFont()
    }
    
    func setup(video: Video){
        if let thumbnail = video.thumbnail {
            self.thumbnail.kf.setImage(with: URL(string: thumbnail))
        }
        self.titleLabel.text = video.title
        self.descriptionLabel.text = video.description
    }
    
}

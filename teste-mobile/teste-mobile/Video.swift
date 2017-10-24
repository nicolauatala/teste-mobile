//
//  Video.swift
//  teste-mobile
//
//  Created by Nicolau Atala Pelluzi on 24/10/17.
//  Copyright © 2017 Nicolau Atala Pelluzi. All rights reserved.
//

import Foundation
import SwiftyJSON

class Video {
    var videoId: String?
    var title: String?
    var description: String?
    var thumbnail: String?
    
    init(with data: JSON?) {
        self.videoId = data?["id"]["videoId"].string
        self.title = data?["snippet"]["title"].string
        self.description = data?["snippet"]["description"].string
        self.thumbnail = data?["snippet"]["thumbnails"]["high"]["url"].string
    }
    
    convenience init(){
        self.init(with: nil)
    }
}

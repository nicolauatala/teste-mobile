//
//  File.swift
//  teste-mobile
//
//  Created by Nicolau Atala Pelluzi on 26/10/17.
//  Copyright © 2017 Nicolau Atala Pelluzi. All rights reserved.
//

import Foundation
import SwiftyJSON

class Details {
    var tags: [String]?
    var viewCount: String?
    var likeCount: String?
    var dislikeCount: String?
    
    init(with data: JSON?) {
        self.videoId = data?["id"]["videoId"].string
    }
    
    convenience init(){
        self.init(with: nil)
    }
}

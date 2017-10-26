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
    var tags = [String]()
    var viewCount: String?
    var likeCount: String?
    var dislikeCount: String?
    
    init(with data: JSON?) {
        if let arrayTags = data?["snippet"]["tags"].array {
            var array = [String]()
            for tag in arrayTags {
                array.append(tag.string!)
            }
            self.tags = array
        }
        self.viewCount = data?["statistics"]["viewCount"].string
        self.likeCount = data?["statistics"]["likeCount"].string
        self.dislikeCount = data?["statistics"]["dislikeCount"].string
    }
    
    convenience init(){
        self.init(with: nil)
    }
}

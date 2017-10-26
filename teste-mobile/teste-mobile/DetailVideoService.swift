//
//  DetailVideoService.swift
//  teste-mobile
//
//  Created by Nicolau Atala Pelluzi on 25/10/17.
//  Copyright © 2017 Nicolau Atala Pelluzi. All rights reserved.
//

import Foundation
import SwiftyJSON

class DetailVideoService {
    static func getDetail(id: String, completion: @escaping (_ video: Video?, _ message: String?) -> Void) {
        APIManager.getRequest(forUrl: pathToDetailVideo(id), completion: { (success, message, result) in
            var video = Video()
            if let result = result {
                let arrayData = JSON(result)["items"].array

            }
            completion(video, message)
        })
    }
}

//
//  HomeService.swift
//  teste-mobile
//
//  Created by Nicolau Atala Pelluzi on 24/10/17.
//  Copyright © 2017 Nicolau Atala Pelluzi. All rights reserved.
//

import Foundation
import SwiftyJSON

class HomeService {
    static func getListVideos(keywords: String, completion: @escaping (_ chats: [Video]?, _ message: String?) -> Void) {
        APIManager.getRequest(forUrl: pathToListVideos(keywords)) { (success, message, result) in
            var videos = [Video]()
            if let result = result {
                let arrayData = JSON(result)["items"].array
                for object : JSON in arrayData! {
                    let video = Video(with: object)
                    videos.append(video)
                }
            }
            completion(videos, message)
        }
    }
}

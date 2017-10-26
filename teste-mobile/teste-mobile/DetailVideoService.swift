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
    static func getDetail(id: String, completion: @escaping (_ video: Details?, _ message: String?) -> Void) {
        APIManager.getRequest(forUrl: pathToDetailVideo(id), completion: { (success, message, result) in
            var details = Details()
            if let result = result {
                let data = JSON(result)["items"].array
                let setDetails = Details(with: data?[0])
                details = setDetails
            }
            completion(details, message)
        })
    }
}

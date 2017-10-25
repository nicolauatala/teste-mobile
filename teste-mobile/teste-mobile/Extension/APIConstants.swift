//
//  APIConstant.swift
//  teste-mobile
//
//  Created by Nicolau Atala Pelluzi on 24/10/17.
//  Copyright © 2017 Nicolau Atala Pelluzi. All rights reserved.
//

import Foundation

let kBaseUrl = "https://www.googleapis.com/youtube/v3/search?"
let kKeyAPI = "AIzaSyCkqNWJlR1YVyPuPweI7aeFoGJsNJIAlas"
let kURLListDetailVideo = kBaseUrl
let kPathToListVideos = { (keywords: String) -> String in
    return kBaseUrl + "part=id,snippet&q=" + keywords + "&key=" + kKeyAPI
}

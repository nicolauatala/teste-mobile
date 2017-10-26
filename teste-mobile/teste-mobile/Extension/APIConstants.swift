//
//  APIConstant.swift
//  teste-mobile
//
//  Created by Nicolau Atala Pelluzi on 24/10/17.
//  Copyright © 2017 Nicolau Atala Pelluzi. All rights reserved.
//

import Foundation

let kBaseUrl = "https://www.googleapis.com/youtube/v3/"
let kKeyAPI = "AIzaSyCkqNWJlR1YVyPuPweI7aeFoGJsNJIAlas"
let kURLListDetailVideo = kBaseUrl
let pathToListVideos = { (keywords: String) -> String in
    return kBaseUrl + "search?part=id,snippet&q=" + keywords + "&type=video&key=" + kKeyAPI
}

let pathToDetailVideo = {(id: String) -> String in
    return kBaseUrl + "videos?id=" + id + "&part=snippet,statistics&key=" + kKeyAPI
}

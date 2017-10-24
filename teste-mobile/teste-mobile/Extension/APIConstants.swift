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
let kPathToListVideos = kBaseUrl + "part=id,snippet&q=piratas&key=" + kKeyAPI
let kURLListVideos = kBaseUrl + kPathToListVideos
let kURLListDetailVideo = kBaseUrl

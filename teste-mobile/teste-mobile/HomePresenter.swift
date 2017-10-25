//
//  HomePresenter.swift
//  teste-mobile
//
//  Created by Nicolau Atala Pelluzi on 24/10/17.
//  Copyright © 2017 Nicolau Atala Pelluzi. All rights reserved.
//

import Foundation

protocol ListVideosView: NSObjectProtocol {
    func setListVideos(videos: [Video]?, message: String?)
}

class HomePresenter {
    
    weak private var listVideosView: ListVideosView?
    var videos = [Video]()
    
    func setViewDelegate(_ view: ListVideosView){
        self.listVideosView = view
    }
    
    func getVideos(with keywords: String) {
        HomeService.getListVideos(keywords: keywords) { (videos, message) in
            self.listVideosView?.setListVideos(videos: videos, message: message)
        }
    }
}

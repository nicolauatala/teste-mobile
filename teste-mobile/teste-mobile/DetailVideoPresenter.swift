//
//  DescriptionVideoPresenter.swift
//  teste-mobile
//
//  Created by Nicolau Atala Pelluzi on 25/10/17.
//  Copyright © 2017 Nicolau Atala Pelluzi. All rights reserved.
//

import Foundation

protocol DetailVideoView: NSObjectProtocol {
    func setDetailVideo(videos: Video, message: String?)
}

class DetailVideoPresenter {
    
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

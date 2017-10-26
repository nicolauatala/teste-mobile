//
//  DescriptionVideoPresenter.swift
//  teste-mobile
//
//  Created by Nicolau Atala Pelluzi on 25/10/17.
//  Copyright © 2017 Nicolau Atala Pelluzi. All rights reserved.
//

import Foundation

protocol DetailVideoView: NSObjectProtocol {
    func setDetailVideo(videoDetail: Details, message: String?)
}

class DetailVideoPresenter {
    
    weak private var detailView: DetailVideoView?
    
    func setViewDelegate(_ view: DetailVideoView){
        self.detailView = view
    }
    
    func getDetail(with id: String) {
        DetailVideoService.getDetail(id: id) { (videoDetail, message) in
            self.detailView?.setDetailVideo(videoDetail: videoDetail!, message: message)
        }
    }
}

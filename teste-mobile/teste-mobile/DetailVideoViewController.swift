//
//  DescriptionVideoViewController.swift
//  teste-mobile
//
//  Created by Nicolau Atala Pelluzi on 25/10/17.
//  Copyright © 2017 Nicolau Atala Pelluzi. All rights reserved.
//

import UIKit
import PKHUD

class DetailVideoViewController: UIViewController {

    @IBOutlet weak var navigationBar: NavigationBar!
    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var titleVideo: UILabel!
    @IBOutlet weak var visualization: UILabel!
    @IBOutlet weak var likeCount: UILabel!
    @IBOutlet weak var deslikeCount: UILabel!
    @IBOutlet weak var descriptionVideo: UILabel!
    @IBOutlet weak var likeImage: UIImageView!
    @IBOutlet weak var deslikeImage: UIImageView!
    
    fileprivate let presenter = DetailVideoPresenter()
    var videoDetail: Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.image.image = #imageLiteral(resourceName: "madeinweb")
        navigationBar.delegate = self
        webView.delegate = self
        presenter.setViewDelegate(self)
        if let videoId = videoDetail?.videoId {
            let url = URL(string: "https://www.youtube.com/embed/\(videoId)")
            webView.loadRequest(URLRequest(url: url!))
            self.presenter.getDetail(with: videoId)
        }
        setDynamicFont()
    }
    
    func setDynamicFont(){
        titleVideo.setDynamicFont()
        visualization.setDynamicFont()
        likeCount.setDynamicFont()
        deslikeCount.setDynamicFont()
        descriptionVideo.setDynamicFont()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        HUD.show(.rotatingImage(#imageLiteral(resourceName: "progress")))
    }
}

extension DetailVideoViewController: NavigationBarDelegate{
    func centerButtonTouchUpInside() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension DetailVideoViewController: DetailVideoView {
    func setDetailVideo(videoDetail: Details, message: String?) {
        titleVideo.text = self.videoDetail?.title
        visualization.text = videoDetail.viewCount!.numberFormatting() + " visualizações."
        likeCount.text = videoDetail.likeCount?.numberFormatting()
        deslikeCount.text = videoDetail.dislikeCount?.numberFormatting()
        descriptionVideo.text = self.videoDetail?.description
        likeImage.image = #imageLiteral(resourceName: "like")
        deslikeImage.image = #imageLiteral(resourceName: "deslike")
    }
}

extension DetailVideoViewController: UIWebViewDelegate {
    func webViewDidFinishLoad(_ webView: UIWebView) {
        HUD.hide()
    }
}

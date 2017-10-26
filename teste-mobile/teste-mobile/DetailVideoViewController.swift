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
    
    fileprivate let presenter = DetailVideoPresenter()
    var videoDetail: Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.delegate = self
        presenter.setViewDelegate(self)
        if let videoId = videoDetail?.videoId {
            let url = URL(string: "https://www.youtube.com/embed/\(videoId)")
            webView.loadRequest(URLRequest(url: url!))
            self.presenter.getDetail(with: videoId)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        HUD.show(.rotatingImage(#imageLiteral(resourceName: "progress")))
    }
}

extension DetailVideoViewController: DetailVideoView {
    func setDetailVideo(videoDetail: Video, message: String?) {
        print(#function)
    }
}

extension DetailVideoViewController: UIWebViewDelegate {
    func webViewDidFinishLoad(_ webView: UIWebView) {
        HUD.hide()
    }
}

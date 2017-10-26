//
//  DescriptionVideoViewController.swift
//  teste-mobile
//
//  Created by Nicolau Atala Pelluzi on 25/10/17.
//  Copyright © 2017 Nicolau Atala Pelluzi. All rights reserved.
//

import UIKit
import PKHUD

class DescriptionVideoViewController: UIViewController {

    @IBOutlet weak var navigationBar: NavigationBar!
    @IBOutlet weak var webView: UIWebView!
    
    var videoDetail: Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.delegate = self
        if let videoId = videoDetail?.videoId {
            let url = URL(string: "https://www.youtube.com/embed/\(videoId)")
            webView.loadRequest(URLRequest(url: url!))
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        HUD.show(.rotatingImage(#imageLiteral(resourceName: "progress")))
    }
}

extension DescriptionVideoViewController: UIWebViewDelegate {
    func webViewDidFinishLoad(_ webView: UIWebView) {
        HUD.hide()
    }
}

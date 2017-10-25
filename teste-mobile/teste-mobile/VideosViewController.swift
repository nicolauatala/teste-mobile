//
//  VideosViewController.swift
//  teste-mobile
//
//  Created by Nicolau Atala Pelluzi on 24/10/17.
//  Copyright © 2017 Nicolau Atala Pelluzi. All rights reserved.
//

import UIKit

protocol SetListVideos: NSObjectProtocol {
    func setListVideos(videos: [Video])
}

class VideosViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var listVideos = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "videoTableViewCell", bundle: nil), forCellReuseIdentifier: "videoCell")
        
        let video = Video()
        video.title = "Primeiro video"
        video.description = "JOUansiduabsdiunas diau sdpiuabs idhbashid aisd asdasd. aoiusd iays d;ias dilyba sd."
        video.thumbnail = "https://i.ytimg.com/vi/dRCJ9NeVsus/sddefault.jpg"
        listVideos.append(video)
        // Do any additional setup after loading the view.
    }
    
}

extension VideosViewController: SetListVideos {
    func setListVideos(videos: [Video]) {
        listVideos = videos
    }
}

extension VideosViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listVideos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "videoCell") as? videoTableViewCell
        cell?.setup(video: listVideos[indexPath.row])
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 4.5
    }
}

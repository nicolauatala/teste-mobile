//
//  VideosViewController.swift
//  teste-mobile
//
//  Created by Nicolau Atala Pelluzi on 24/10/17.
//  Copyright © 2017 Nicolau Atala Pelluzi. All rights reserved.
//

import UIKit
import PKHUD

protocol SetListVideos: NSObjectProtocol {
    func setListVideos(videos: [Video])
}

class VideosViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    
    fileprivate let presenter = HomePresenter()
    var listVideos = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        tableView.register(UINib(nibName: "videoTableViewCell", bundle: nil), forCellReuseIdentifier: "videoCell")
        presenter.setViewDelegate(self)
    }
    
    @IBAction func search(_ sender: Any) {
        HUD.show(.rotatingImage(#imageLiteral(resourceName: "progress")))
        if let text = searchTextField.text {
            if !text.isEmpty {
                if let encodingText = text.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) {
                    presenter.getVideos(with: encodingText)
                }
            } else {
                HUD.hide()
                present(Alert.showMessage(title: "Campo vazio", message: "Para continuar, informe as palavras chaves."), animated: true, completion: nil)
            }
        }
    }
    
}

extension VideosViewController: ListVideosView {
    func setListVideos(videos: [Video]?, message: String?) {
        HUD.hide()
        if videos?.count != 0 {
            self.listVideos.removeAll()
            self.listVideos = videos!
            self.tableView.reloadData()
        } else {
            present(Alert.showMessage(title: "Ops!", message: "Erro, tente novamente."), animated: true, completion: nil)
        }
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

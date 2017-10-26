//
//  ViewController.swift
//  madeInWeb
//
//  Created by Nicolau Atala Pelluzi on 23/10/17.
//  Copyright © 2017 Nicolau Atala Pelluzi. All rights reserved.
//

import UIKit
import PKHUD

class HomeViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    fileprivate let presenter = HomePresenter()
    var listVideos = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround() 
        setCornerRadius()
        presenter.setViewDelegate(self)
    }
    
    func setCornerRadius(){
        searchTextField.layer.masksToBounds = false
        searchTextField.layer.cornerRadius = searchTextField.frame.height / 2
        searchButton.layer.masksToBounds = false
        searchButton.layer.cornerRadius = searchButton.frame.height / 2
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

extension HomeViewController: ListVideosView {
    func setListVideos(videos: [Video]?, message: String?) {
        HUD.hide()
        if videos?.count != 0 {
            self.listVideos = videos!
            performSegue(withIdentifier: "toVideoSegue", sender: nil)
        } else {
            present(Alert.showMessage(title: "Ops!", message: message), animated: true, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toVideoSegue" {
            if let viewController = segue.destination as? VideosViewController {
               viewController.listVideos = self.listVideos
            }
        }
    }
}

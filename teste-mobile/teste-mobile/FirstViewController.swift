//
//  FirstViewController.swift
//  teste-mobile
//
//  Created by Nicolau Atala Pelluzi on 28/10/17.
//  Copyright © 2017 Nicolau Atala Pelluzi. All rights reserved.
//

import UIKit
import PKHUD

class FirstViewController: UIViewController {
    
    // MARK: Constraints
    @IBOutlet weak var logoMadeImage: UIImageView!
    
    @IBOutlet weak var contentHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var topLogoConstraint: NSLayoutConstraint!
    @IBOutlet weak var logoHeighConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftLogoConstraint: NSLayoutConstraint!
    @IBOutlet weak var rightLogoConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var rightTextFieldConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftTextFieldConstraint: NSLayoutConstraint!
    @IBOutlet weak var topTextFieldConstraint: NSLayoutConstraint!
    @IBOutlet weak var textFieldHeighConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var topSearchConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftSearchConstraint: NSLayoutConstraint!
    @IBOutlet weak var rightSearchConstraint: NSLayoutConstraint!
    @IBOutlet weak var searchHeighConstraint: NSLayoutConstraint!

    @IBOutlet weak var tableView: UITableView!
    
    fileprivate let presenter = HomePresenter()
    var listVideos = [Video]()
    var videoSelected: Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialConstraint()
        self.hideKeyboardWhenTappedAround()
        logoMadeImage.isUserInteractionEnabled = true
        logoMadeImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(toSearchScene)))
        
        tableView.register(UINib(nibName: "videoTableViewCell", bundle: nil), forCellReuseIdentifier: "videoCell")
        presenter.setViewDelegate(self)
        animateCellTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateCellTableView()
    }
    
    func animateCellTableView() {
        tableView.reloadData()
        for cell in tableView.visibleCells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableView.bounds.size.height)
        }
        var delayCounter = 0
        for cell in tableView.visibleCells {
            UIView.animate(withDuration: 1.5, delay: Double(delayCounter) * 0.05, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                cell.transform = CGAffineTransform.identity
            }, completion: nil)
            delayCounter += 1
        }
        
    }
    
    func initialConstraint(){
        contentHeightConstraint.constant = self.view.frame.height
        topLogoConstraint.constant       = self.view.frame.height * 0.26
        logoHeighConstraint.constant      = self.view.frame.height * 0.1
        leftLogoConstraint.constant       = self.view.frame.height * 0.12
        rightLogoConstraint.constant      = self.view.frame.height * 0.12
        textFieldHeighConstraint.constant = self.view.frame.height * 0.065
        searchHeighConstraint.constant    = self.view.frame.height * 0.065
        topSearchConstraint.constant      = self.view.frame.height * 0.085
        topTextFieldConstraint.constant   = self.view.frame.height * 0.04
        rightTextFieldConstraint.constant = self.view.frame.width * 0.1
        leftTextFieldConstraint.constant  = self.view.frame.width * 0.1
        leftSearchConstraint.constant     = self.view.frame.width * 0.1
        rightSearchConstraint.constant    = self.view.frame.width * 0.1
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
    
    func changeConstraint(){
        contentHeightConstraint.constant = self.view.frame.height * 0.24
        logoHeighConstraint.constant     = self.view.frame.height * 0.1
        topLogoConstraint.constant       = self.view.frame.height * 0.02
        topTextFieldConstraint.constant  = self.view.frame.height * 0.01
        leftLogoConstraint.constant      = self.view.frame.height * 0.18
        rightLogoConstraint.constant     = self.view.frame.height * 0.18
        
        topSearchConstraint.constant = 0
        rightTextFieldConstraint.constant = self.view.frame.width * 0.3
        leftSearchConstraint.constant     = self.view.frame.width * 0.7
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }

    @IBAction func searchTouchUpInside(_ sender: Any) {
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
    
    func toSearchScene(){
        print(#function)
        initialConstraint()
    }
    
}

extension FirstViewController: ListVideosView {
    func setListVideos(videos: [Video]?, message: String?) {
        HUD.hide()
        if videos?.count != 0 {
            self.listVideos.removeAll()
            self.listVideos = videos!
            self.changeConstraint()
            animateCellTableView()
        } else {
            present(Alert.showMessage(title: "Ops!", message: "Erro, tente novamente."), animated: true, completion: nil)
        }
    }
}

extension FirstViewController: UITableViewDelegate, UITableViewDataSource {
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        videoSelected = listVideos[indexPath.row]
        performSegue(withIdentifier: "toDetailSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailSegue" {
            if let viewController = segue.destination as? DetailVideoViewController {
                viewController.videoDetail = self.videoSelected
            }
        }
    }
}


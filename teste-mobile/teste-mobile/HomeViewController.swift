//
//  ViewController.swift
//  madeInWeb
//
//  Created by Nicolau Atala Pelluzi on 23/10/17.
//  Copyright © 2017 Nicolau Atala Pelluzi. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicatorView.stopAnimating()
        setCornerRadius()
    }
    
    func setCornerRadius(){
        searchTextField.layer.masksToBounds = false
        searchTextField.layer.cornerRadius = searchTextField.frame.height / 2
        searchButton.layer.masksToBounds = false
        searchButton.layer.cornerRadius = searchButton.frame.height / 2
    }

    @IBAction func search(_ sender: Any) {
        indicatorView.startAnimating()
        indicatorView.isHidden = !indicatorView.isHidden
        
        if !(searchTextField.text?.isEmpty)! {
            //search
        } else {
            present(Alert.showMessage(message: "Campo vazio, informe o "), animated: true, completion: nil)
        }
    }

}


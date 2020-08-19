//
//  ViewController.swift
//  Example
//
//  Created by Alexander on 8/19/20.
//  Copyright © 2020 Alexander. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func openAction(_ sender: UIButton) {
        let model = ProfileViewModel(profileService: ProfileService())
        let viewController = ProfileViewController(model: model)
        self.present(viewController, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


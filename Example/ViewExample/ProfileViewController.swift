//
//  ProfileViewController.swift
//  Example
//
//  Created by Alexander on 8/19/20.
//  Copyright © 2020 Alexander. All rights reserved.
//

import UIKit

class ProfileViewController: CollectionViewController<ProfileView> {
    private let model: ProfileViewModel
    init(model: ProfileViewModel) {
        self.model = model
        super.init(container: model.container!)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func loadView() {
        self.view = ProfileView()
    }
}



//
//  VideoItemView.swift
//  Example
//
//  Created by Alexander on 8/20/20.
//  Copyright © 2020 Alexander. All rights reserved.
//

import UIKit

class VideoItemView: UIView, GenericCellSubview {
    let label = UILabel()

    required init() {
        super.init(frame: .zero)
        self.setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        let view = UIView()
        view.backgroundColor = UIColor.red
        view.layer.cornerRadius = 8
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false

        view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true

        self.addSubview(self.label)
        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
}


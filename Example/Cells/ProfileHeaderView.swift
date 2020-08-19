//
//  ProfileHeaderView.swift
//  Example
//
//  Created by Alexander on 8/20/20.
//  Copyright © 2020 Alexander. All rights reserved.
//

import UIKit
import Combine

class ProfileHeaderView: UIView, GenericCellSubview {
    let label = UILabel()
    let switcher = UISwitch()

    var tabSwitched = CurrentValueSubject<Bool, Never>(false)

    required init() {
        super.init(frame: .zero)
        self.setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        self.addSubview(self.label)
        self.label.numberOfLines = 0
        self.label.textAlignment = .center
        self.label.translatesAutoresizingMaskIntoConstraints = false

         self.label.topAnchor.constraint(
            equalTo: self.topAnchor,
            constant: 12
         ).isActive = true
        self.label.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        self.label.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true

        self.addSubview(self.switcher)
        self.switcher.translatesAutoresizingMaskIntoConstraints = false

        self.switcher.topAnchor.constraint(
            equalTo: self.label.bottomAnchor,
            constant: 12
         ).isActive = true
        self.switcher.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        let bottom = self.switcher.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        bottom.priority = .defaultHigh
        bottom.isActive = true

        self.switcher.addTarget(
            self,
            action: #selector(self.switchValueChanged),
            for: .valueChanged
        )
        self.tabSwitched.send(self.switcher.isOn)
    }

    @objc
    func switchValueChanged() {
        self.tabSwitched.send(self.switcher.isOn)
    }
}

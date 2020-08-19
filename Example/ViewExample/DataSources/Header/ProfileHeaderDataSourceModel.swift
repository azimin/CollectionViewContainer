//
//  ProfileHeaderDataSourceModel.swift
//  Example
//
//  Created by Alexander on 8/20/20.
//  Copyright © 2020 Alexander. All rights reserved.
//

import Foundation
import Combine

class ProfileHeaderDataSourceModel {
    var usernameUpdated = CurrentValueSubject<String?, Never>(nil)
    var tabChanged = CurrentValueSubject<Bool, Never>(false)

    private let service: ProfileService

    init(service: ProfileService) {
        self.service = service
        self.service.getUserInfo { [weak self] (name) in
            self?.usernameUpdated.send(name)
        }
    }
}

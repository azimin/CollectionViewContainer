//
//  ProfileFollowersDataSourceModel.swift
//  Example
//
//  Created by Alexander on 8/20/20.
//  Copyright © 2020 Alexander. All rights reserved.
//

import Foundation
import Combine

class ProfileFollowersDataSourceModel {
    var usersUpdated = CurrentValueSubject<[String], Never>([])

    private let service: ProfileService

    init(service: ProfileService) {
        self.service = service
        self.usersUpdated.send(self.service.getFollowers())
    }
}


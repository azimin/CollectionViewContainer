//
//  ProfileService.swift
//  Example
//
//  Created by Alexander on 8/20/20.
//  Copyright © 2020 Alexander. All rights reserved.
//

import Foundation

class ProfileService {
    func getUserInfo(completion: @escaping (String?) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completion("iOS Crew")
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            completion("iOS Crew 2\nThis is two line")
        }
    }

    func getVideos() -> [String] {
        return ["One", "Two", "Three", "Four", "Five"]
    }

    func getFollowers() -> [String] {
        return ["First", "Second", "Third"]
    }
}

//
//  ProfileViewModel.swift
//  Example
//
//  Created by Alexander on 8/20/20.
//  Copyright © 2020 Alexander. All rights reserved.
//

import Foundation
import Combine

class ProfileViewModel {
    var container: CollectionViewContainer?
    var cancellable = Set<AnyCancellable>()

    init(profileService: ProfileService) {
        let headerViewModel = ProfileHeaderDataSourceModel(
            service: profileService
        )
        let headerDataSource = ProfileHeaderDataSource(
            viewModel: headerViewModel
        )

        let videosViewModel = ProfileVideosDataSourceModel(
            service: profileService
        )
        let videosDataSource = ProfileVideosDataSource(
            viewModel: videosViewModel
        )

        let followersViewModel = ProfileFollowersDataSourceModel(
            service: profileService
        )
        let followersDataSource = ProfileFollowersDataSource(
            viewModel: followersViewModel
        )

        headerViewModel.tabChanged.removeDuplicates().sink { [weak self] (isOn) in
            videosDataSource.isEnabled = !isOn
            followersDataSource.isEnabled = isOn
            self?.container?.reload(shouldReloadCollection: true)
        }.store(in: &cancellable)

        self.container = CollectionViewContainer(
            dataSources: [headerDataSource, videosDataSource, followersDataSource]
        )
    }
}

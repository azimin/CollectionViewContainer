//
//  ProfileHeaderDataSource.swift
//  Example
//
//  Created by Alexander on 8/20/20.
//  Copyright © 2020 Alexander. All rights reserved.
//

import UIKit
import Combine

class ProfileHeaderDataSource: CollectionViewDataSource {
    var delegate: CollectionViewDataSourceContainerDelegate?

    var isEnabled: Bool = true

    private let viewModel: ProfileHeaderDataSourceModel

    private var cancellable = Set<AnyCancellable>()

    init(viewModel: ProfileHeaderDataSourceModel) {
        self.viewModel = viewModel

        self.viewModel.usernameUpdated.sink { [weak self] (name) in
            self?.reloadCurrentSectionIfLoaded()
        }.store(in: &cancellable)
    }

    var cellsForRegistration: [AppCollectionViewCell.Type]? {
        return [GenericCollectionViewCell<ProfileHeaderView>.self]
    }

    var numberOfSections: Int {
        return 1
    }

    func numberOfItems(inSection section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithType(
            GenericCollectionViewCell<ProfileHeaderView>.self,
            indexPath: indexPath
        )
        self.viewModel.usernameUpdated.sink { [weak cell] (name) in
            cell?.customSubview.label.text = name
        }.store(in: &cell.cancellable)

        cell.customSubview.tabSwitched.sink { [weak self] (flag) in
            self?.viewModel.tabChanged.send(flag)
        }.store(in: &cell.cancellable)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) { }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let templateView = ProfileHeaderView()
        self.viewModel.usernameUpdated.sink { (name) in
            templateView.label.text = name
        }.cancel()

        templateView.setNeedsLayout()
        templateView.layoutIfNeeded()

        let size = templateView.systemLayoutSizeFitting(
            CGSize(
                width: collectionView.frame.width,
                height: CGFloat.greatestFiniteMagnitude
            )
        )

        return CGSize(width: collectionView.frame.width, height: size.height)
    }
}

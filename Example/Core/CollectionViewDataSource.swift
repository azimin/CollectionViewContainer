//
//  CollectionViewDataSource.swift
//  Example
//
//  Created by Alexander on 8/19/20.
//  Copyright © 2020 Alexander. All rights reserved.
//

import UIKit

protocol CollectionViewDataSourceContainerDelegate: AnyObject {
    func startSection(forDataSource dataSource: CollectionViewDataSource) -> Int
    func getCollectionView() -> UICollectionView?
    func getContainer() -> CollectionViewContainer
}

protocol CollectionViewDataSource: class {
    var delegate: CollectionViewDataSourceContainerDelegate? { get set }

    var isEnabled: Bool { get }

    var cellsForRegistration: [AppCollectionViewCell.Type]? { get }
    var headersForRegistration: [AppCollectionReusableView.Type]? { get }

    var numberOfSections: Int { get }

    func numberOfItems(inSection section: Int) -> Int

    func getSection() -> Int?

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)

    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath)

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        referenceSizeForHeaderInSection section: Int
    ) -> CGSize

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets


    func scrollViewDidScroll(_ scrollView: UIScrollView)
}

extension CollectionViewDataSource {
    var headersForRegistration: [AppCollectionReusableView.Type]? {
        return []
    }

    var collectionView: UICollectionView {
        guard let collectionView = self.delegate?.getCollectionView() else {
            assertionFailure("No collection view")
            return UICollectionView(
                frame: .zero,
                collectionViewLayout: UICollectionViewFlowLayout()
            )
        }
        return collectionView
    }

    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {}

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        return .zero
    }

    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        return UICollectionReusableView()
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        referenceSizeForHeaderInSection section: Int
    ) -> CGSize {
        return .zero
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        return .zero
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        return .zero
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }

    func getSection() -> Int? {
        guard let startSection = self.delegate?.startSection(forDataSource: self) else {
            assertionFailure("No start section")
            return nil
        }

        return startSection
    }

    func reloadCurrentSectionIfLoaded() {
        guard self.isEnabled else {
            return
        }

        if let startSection = self.delegate?.startSection(forDataSource: self), let collectionView = self.delegate?.getCollectionView() {
            var reloadArray: [Int] = []
            for section in 0..<self.numberOfSections {
                reloadArray.append(section + startSection)
            }
            collectionView.reloadSections(IndexSet(reloadArray))
        }
    }
}

//
//  CollectionViewController.swift
//  Example
//
//  Created by Alexander on 8/19/20.
//  Copyright © 2020 Alexander. All rights reserved.
//

import UIKit

protocol CollectionViewHolderProtocol {
    var collectionView: UICollectionView { get }
}

class CollectionViewController<ViewType: CollectionViewHolderProtocol>: UIViewController,
    UICollectionViewDataSource,
    UICollectionViewDelegate,
    UICollectionViewDelegateFlowLayout,
    ViewHolder {
    typealias ViewType = ViewType
    let container: CollectionViewContainer

    init(container: CollectionViewContainer) {
        self.container = container

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.container.internalCollectionView = self.rootView.collectionView

        self.rootView.collectionView.dataSource = self
        self.rootView.collectionView.delegate = self
        self.rootView.collectionView.backgroundColor = UIColor.clear

        guard self.rootView.collectionView.collectionViewLayout is UICollectionViewFlowLayout else {
            assertionFailure("Wrong layout")
            return
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.rootView.collectionView.refreshControl?.endRefreshing()
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        self.container.numberOfSections
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.container.numberOfItems(inSection: section)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return self.container.collectionView(collectionView, cellForItemAt: indexPath)
    }

    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.container.collectionView(collectionView, didEndDisplaying: cell, forItemAt: indexPath)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        return self.container.collectionView(collectionView, viewForSupplementaryElementOfKind: kind, at: indexPath)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        referenceSizeForHeaderInSection section: Int
    ) -> CGSize {
        return self.container.collectionView(collectionView, layout: collectionViewLayout, referenceSizeForHeaderInSection: section)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.container.collectionView(collectionView, didSelectItemAt: indexPath)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.container.collectionView(collectionView, layout: collectionViewLayout, sizeForItemAt: indexPath)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        self.container.collectionView(collectionView, layout: collectionViewLayout, minimumLineSpacingForSectionAt: section)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        self.container.collectionView(collectionView, layout: collectionViewLayout, minimumInteritemSpacingForSectionAt: section)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        return self.container.collectionView(collectionView, layout: collectionViewLayout, insetForSectionAt: section)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.container.scrollViewDidScroll(scrollView)
    }
}


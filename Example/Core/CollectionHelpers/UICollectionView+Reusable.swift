//
//  UICollectionView+Reusable.swift
//  Example
//
//  Created by Alexander on 8/19/20.
//  Copyright © 2020 Alexander. All rights reserved.
//

import UIKit

extension UICollectionView {
    public func registerReusableCellWithNib<T: AppCollectionViewCell>(_ cellType: T.Type) {
        register(cellType.nib, forCellWithReuseIdentifier: cellType.reuseIdentifier)
    }

    public func registerReusableCellWithClass<T: AppCollectionViewCell>(_ cellType: T.Type) {
        register(cellType, forCellWithReuseIdentifier: cellType.reuseIdentifier)
    }

    public func registerAnonimusReusableCellWithClass(_ anonimusCellType: AppCollectionViewCell.Type) {
        register(anonimusCellType, forCellWithReuseIdentifier: anonimusCellType.reuseIdentifier)
    }

    public func dequeueReusableCellWithType<T: AppCollectionViewCell>(_ viewType: T.Type, indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: viewType.reuseIdentifier, for: indexPath) as! T
    }

    public func registerHeaderViewWithClass<T: AppCollectionReusableView>(_ viewType: T.Type) {
        self.register(
            viewType,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: viewType.reuseIdentifier
        )
    }

    public func registerAnonimusHeaderViewWithClass(_ anonimusHeaderType: AppCollectionReusableView.Type) {
        self.register(
            anonimusHeaderType,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: anonimusHeaderType.reuseIdentifier
        )
    }

    public func dequeueHeaderViewWithClass<T: AppCollectionReusableView>(_ viewType: T.Type, forIndexPath indexPath: IndexPath) -> T {
        return self.dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: viewType.reuseIdentifier,
            for: indexPath
        ) as! T
    }
}


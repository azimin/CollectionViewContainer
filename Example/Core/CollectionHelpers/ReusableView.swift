//
//  ReusableView.swift
//  Example
//
//  Created by Alexander on 8/19/20.
//  Copyright © 2020 Alexander. All rights reserved.
//

import UIKit

public protocol ReusableView {
    static var reuseIdentifier: String { get }
    static var nib: UINib { get }
    static var bundle: Bundle? { get }
}

extension ReusableView {
    public static var reuseIdentifier: String {
        if let component = String(describing: self).split(separator: ".").last {
            return String(component)
        } else {
            return ""
        }
    }

    public static var nib: UINib {
        return UINib(nibName: reuseIdentifier, bundle: bundle)
    }

    public static var bundle: Bundle? {
        return nil
    }
}

public typealias AppCollectionViewCell = UICollectionViewCell & ReusableView
public typealias AppCollectionReusableView = UICollectionReusableView & ReusableView

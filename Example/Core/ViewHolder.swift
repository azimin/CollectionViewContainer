//
//  ViewHolder.swift
//  Example
//
//  Created by Alexander on 8/19/20.
//  Copyright © 2020 Alexander. All rights reserved.
//

import UIKit

protocol ViewHolder {
    associatedtype ViewType

    var rootView: ViewType { get }
}

extension ViewHolder where Self: UIViewController {
    var rootView: ViewType {
        guard let view = self.view as? ViewType else {
            fatalError("View type (\(type(of: self.view))) does not match with ViewType (\(ViewType.self))")
        }
        return view
    }
}

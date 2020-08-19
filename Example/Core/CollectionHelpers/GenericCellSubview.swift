//
//  GenericCellSubview.swift
//  Example
//
//  Created by Alexander on 8/20/20.
//  Copyright © 2020 Alexander. All rights reserved.
//

import Foundation

public protocol GenericCellSubview {
    init()

    func setSelected(_ selected: Bool, animated: Bool)
    func setHighlighted(_ highlighted: Bool, animated: Bool)
}

extension GenericCellSubview {
    public func setSelected(_ selected: Bool, animated: Bool) {}
    public func setHighlighted(_ highlighted: Bool, animated: Bool) {}
}

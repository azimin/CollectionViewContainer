//
//  GenericCollectionViewCell.swift
//  Example
//
//  Created by Alexander on 8/20/20.
//  Copyright © 2020 Alexander. All rights reserved.
//

import UIKit
import Combine

public final class GenericCollectionViewCell<T: UIView>: UICollectionViewCell, ReusableView where T: GenericCellSubview {
    public let customSubview = T()
    public weak var reusableComponent: ReusableComponent?

    var cancellable = Set<AnyCancellable>()

    override public func prepareForReuse() {
        super.prepareForReuse()
        self.cancellable.forEach({ $0.cancel() })
        self.reusableComponent?.reuse()

        if let reuseView = self.customSubview as? ReusableComponent {
            reuseView.reuse()
        }
    }

    public init() {
        super.init(frame: .zero)
        self.setup()
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setup()
    }

    private func setup() {
        self.contentView.addSubview(self.customSubview)
        self.customSubview.translatesAutoresizingMaskIntoConstraints = false
        self.customSubview.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.customSubview.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.customSubview.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.customSubview.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        self.customSubview.setSelected(self.isSelected, animated: false)
    }

    override public var isSelected: Bool {
        didSet {
            self.customSubview.setSelected(self.isSelected, animated: false)
        }
    }

    override public func systemLayoutSizeFitting(_ targetSize: CGSize) -> CGSize {
        return self.customSubview.systemLayoutSizeFitting(targetSize)
    }
}


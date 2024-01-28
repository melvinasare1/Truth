//
//  TruthStackView.swift
//  Truth
//
//  Created by Melvin Asare on 13/01/2024.
//

import UIKit
import SkeletonView

class TruthStackView: UIStackView {
    
    public func configure(distribution: UIStackView.Distribution, axis: NSLayoutConstraint.Axis, spacing: CGFloat? = 0) {
        self.axis = axis
        self.spacing = spacing!
        self.distribution = distribution
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.isSkeletonable = true

    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

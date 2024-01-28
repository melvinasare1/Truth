//
//  TruthLabel.swift
//  Truth
//
//  Created by Melvin Asare on 12/01/2024.
//

import UIKit
import SkeletonView

class TruthLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("Component: TruthLabel")
    }

    func configureTitleSize(fontSize: CGFloat, weight: UIFont.Weight) {
        self.font = .systemFont(ofSize: fontSize, weight: weight)
    }

    func configureTitleColor(color: UIColor) {
        self.textColor = color
    }

    func configureText(textAlignment: NSTextAlignment, titleText: String?) {
        self.textAlignment = textAlignment
        self.text = titleText
     }
}

extension TruthLabel {
    func setup() {
        isSkeletonable = true
        minimumScaleFactor = 0.9
        numberOfLines = 0
        textColor = .darkGray
        adjustsFontSizeToFitWidth = true
        translatesAutoresizingMaskIntoConstraints = false
    }
}

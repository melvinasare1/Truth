//
//  TitleViewCell.swift
//  Truth
//
//  Created by Melvin Asare on 20/01/2024.
//

import UIKit

class TitleViewCell: UICollectionViewCell {
    private let title: TruthLabel = {
       let label = TruthLabel()
        label.configureTitleSize(fontSize: 30, weight: .heavy)
        label.configureText(textAlignment: .left, titleText: "Apple News")
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(title)
        
        title.topAnchor.constraint(equalTo: topAnchor).isActive = true
        title.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        title.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        title.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

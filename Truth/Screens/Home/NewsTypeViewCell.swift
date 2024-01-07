//
//  NewsTypeCell.swift
//  Truth
//
//  Created by Melvin Asare on 07/01/2024.
//

import UIKit

class NewsTypeViewCell: UICollectionViewCell {
    private let newsTypeLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        label.text = "Text"
        label.font = UIFont(name: "Arial", size: 12)
        label.font = UIFont(name: "Arial", size: 8)
        label.textAlignment = .center
        return label
    }()
    
    private func configureLabel() {
        newsTypeLabel.backgroundColor = .lightGray
        newsTypeLabel.layer.cornerRadius = 8
        newsTypeLabel.layer.borderWidth = 2
        newsTypeLabel.layer.borderColor = UIColor.black.cgColor
    }
    
    public func configureNewsType(type: String) {
        newsTypeLabel.text = type
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(newsTypeLabel)
        configureLabel()
        
        newsTypeLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        newsTypeLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        newsTypeLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        newsTypeLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

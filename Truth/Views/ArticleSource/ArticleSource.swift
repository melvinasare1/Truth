//
//  Source.swift
//  Truth
//
//  Created by Melvin Asare on 24/12/2023.
//

import UIKit

class ArticleSource: UIView {
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Base"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()

    public func setArticleSource(source: String?) {
        self.nameLabel.text = source
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(nameLabel)
        
        nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//
//  AuthorDetails.swift
//  Truth
//
//  Created by Melvin Asare on 23/12/2023.
//

import UIKit

class AuthorDetails: UIView {
        
    private let authorNameLabel: TruthLabel = {
        let label = TruthLabel()
        label.configureTitleSize(fontSize: 10, weight: .regular)
        return label
    }()
    
    private let publishedDateLabel: TruthLabel = {
        let label = TruthLabel()
        label.configureTitleSize(fontSize: 10, weight: .regular)
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    public func setAuthorDetails(name: String, publishedDate: String) {
        self.authorNameLabel.configureText(textAlignment: .natural, titleText: name)
        self.publishedDateLabel.configureText(textAlignment: .natural, titleText: publishedDate)
    }
    
    public func isFullArticle(_ isFullArticle: Bool) {
        if isFullArticle {
            stackView.addArrangedSubview(authorNameLabel)
            stackView.addArrangedSubview(publishedDateLabel)
            
            addSubview(stackView)
            
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 6).isActive = true
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -6).isActive = true
        } else {
            addSubview(authorNameLabel)
            authorNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
            authorNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  AuthorDetails.swift
//  Truth
//
//  Created by Melvin Asare on 23/12/2023.
//

import UIKit

class AuthorDetails: UIView {
        
    private let authorName: UILabel = {
        let name = UILabel()
        name.font = UIFont(name: "Arial", size: 10)
        name.text = "Melvin Asare"
        name.translatesAutoresizingMaskIntoConstraints = false
        name.textColor = .black
        return name
    }()
    
    private let publishedDate: UILabel = {
        let date = UILabel()
        date.text = "Tuesday 18th December 2021"
        date.font = UIFont(name: "Arial", size: 10)
        date.translatesAutoresizingMaskIntoConstraints = false
        date.textColor = .black
        return date
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    public func setAuthorDetails(name: String, publishedDate: String) {
        self.authorName.text = name
        self.publishedDate.text = publishedDate
    }
    
    public func isFullArticle(_ isFullArticle: Bool) {
        if isFullArticle {
            stackView.addArrangedSubview(authorName)
            stackView.addArrangedSubview(publishedDate)
            
            addSubview(stackView)
            
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 6).isActive = true
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -6).isActive = true
        } else {
            addSubview(authorName)
            authorName.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
            authorName.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
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

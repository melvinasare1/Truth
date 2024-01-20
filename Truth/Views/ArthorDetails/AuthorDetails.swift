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
    
    private let stackView: TruthStackView = {
        let stackView = TruthStackView()
        stackView.configure(distribution: .equalSpacing, axis: .horizontal, spacing: 0)
        return stackView
    }()
    
    public func convertDate(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: date)!
        
        return "\(date)"
    }
    
    public func setAuthorDetails(name: String, publishedDate: String) {
        self.authorNameLabel.configureText(textAlignment: .natural, titleText: name)
        self.publishedDateLabel.configureText(textAlignment: .natural, titleText: convertDate(date: publishedDate))
        print(publishedDate)
    }
    
    public func isFullArticle(_ isFullArticle: Bool) {
        if isFullArticle {
            stackView.addArrangedSubview(authorNameLabel)
            stackView.addArrangedSubview(publishedDateLabel)
            
            addSubview(stackView)
            
            stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
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

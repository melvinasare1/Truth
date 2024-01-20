//
//  NewsArticle.swift
//  Truth
//
//  Created by Melvin Asare on 23/12/2023.
//

import UIKit

class ArticleHorizontalSlider: UIView {
    
    private let articleImage = TruthImageView(frame: .zero)
    private let articleTitle: TruthLabel = {
        let label = TruthLabel()
        label.configureTitleColor(color: .white)
        label.configureTitleSize(fontSize: 16, weight: .bold)
        label.numberOfLines = 2
        return label
    }()
        
    private let authorSource: ArticleSource = {
        let source = ArticleSource()
        return source
    }()
    
    public func setArticleDetails(title: String, image: String?, source: String?) {
        self.articleTitle.configureText(textAlignment: .natural, titleText: title)
        self.articleImage.setImage(image: image)
        self.authorSource.setArticleSource(source: source)
    }
    
    private func setConstraints() {
        articleImage.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        articleImage.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        articleImage.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        articleImage.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        articleTitle.bottomAnchor.constraint(equalTo: articleImage.bottomAnchor, constant: -12).isActive = true
        articleTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        articleTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        
        authorSource.bottomAnchor.constraint(equalTo: articleTitle.topAnchor, constant: -12).isActive = true
        authorSource.leadingAnchor.constraint(equalTo: articleTitle.leadingAnchor).isActive = true
        authorSource.trailingAnchor.constraint(equalTo: articleTitle.trailingAnchor).isActive = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(articleImage)
        addSubview(articleTitle)
        addSubview(authorSource)
                
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

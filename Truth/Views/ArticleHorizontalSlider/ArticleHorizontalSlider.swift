//
//  NewsArticle.swift
//  Truth
//
//  Created by Melvin Asare on 23/12/2023.
//

import UIKit

class ArticleHorizontalSlider: UIView {
    private let articleTitle: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = .boldSystemFont(ofSize: 16)
        text.numberOfLines = 2
        text.textColor = .white
        return text
    }()
        
    private let articleImage: UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private func imageStyles() {
        articleImage.backgroundColor = .red
        articleImage.layer.cornerRadius = 8
        articleImage.contentMode = .scaleAspectFill
        articleImage.layer.masksToBounds = true
    }
    
    private let authorSource: ArticleSource = {
        let source = ArticleSource()
        return source
    }()
    
    public func setArticleDetails(title: String, image: String?, source: String?) {
        self.articleTitle.text = title
        self.articleImage.image = nil
        self.authorSource.setArticleSource(source: source)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(articleImage)
        addSubview(articleTitle)
        addSubview(authorSource)
                
        imageStyles()

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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

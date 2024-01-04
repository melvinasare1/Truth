//
//  ArticleVerticleSlider.swift
//  Truth
//
//  Created by Melvin Asare on 31/12/2023.
//

import UIKit

class ArticleVerticleSlider: UIView {
    private let articleTitle: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = .black
        text.numberOfLines = 3
        text.font = UIFont.boldSystemFont(ofSize: 22)
        return text
    }()
        
    private let articleImage: UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let authorDetails: AuthorDetails = {
       let details = AuthorDetails()
        return details
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private func imageStyles() {
        articleImage.backgroundColor = .red
        articleImage.layer.cornerRadius = 8
        articleImage.contentMode = .scaleAspectFill
        articleImage.layer.masksToBounds = true
    }
    
    public func configureTitleSize(size: CGFloat, bold: Bool, weight: UIFont.Weight? = .regular) {
        if bold {
            articleTitle.font = UIFont.boldSystemFont(ofSize: size)
        } else {
            articleTitle.font = UIFont.systemFont(ofSize: size, weight: weight!)
        }
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
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        addSubview(articleImage)

        stackView.addArrangedSubview(authorDetails)
        stackView.addArrangedSubview(articleTitle)
        stackView.addArrangedSubview(authorSource)
   
        imageStyles()
        authorDetails.isFullArticle(false)

        articleImage.topAnchor.constraint(equalTo: topAnchor).isActive = true
        articleImage.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        articleImage.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        articleImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6).isActive = true
        
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 24).isActive = true
        stackView.leadingAnchor.constraint(equalTo: articleImage.trailingAnchor, constant: 8).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

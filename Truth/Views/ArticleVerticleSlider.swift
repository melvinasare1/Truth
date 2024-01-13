//
//  ArticleVerticleSlider.swift
//  Truth
//
//  Created by Melvin Asare on 31/12/2023.
//

import UIKit

class ArticleVerticleSlider: UIView {
    private let articleTitle: TruthLabel = {
        let text = TruthLabel()
        text.numberOfLines = 3
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
            articleTitle.configureTitleSize(fontSize: size, weight: .bold)
        } else {
            articleTitle.configureTitleSize(fontSize: size, weight: weight!)
        }
    }
    
    private let authorSource: ArticleSource = {
        let source = ArticleSource()
        return source
    }()
    
    public func setArticleDetails(title: String, image: String?, source: String?) {
        self.articleTitle.configureText(textAlignment: .left, titleText: title)
        self.articleImage.image = nil
        self.authorSource.setArticleSource(source: source)
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews()
   
        imageStyles()
        authorDetails.isFullArticle(false)

        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ArticleVerticleSlider {
    
    private func addSubviews() {
        addSubview(stackView)
        addSubview(articleImage)
        
        stackView.addArrangedSubview(authorDetails)
        stackView.addArrangedSubview(articleTitle)
        stackView.addArrangedSubview(authorSource)
    }
    
    private func setConstraints() {
        articleImage.topAnchor.constraint(equalTo: topAnchor).isActive = true
        articleImage.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        articleImage.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        articleImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6).isActive = true
        
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 24).isActive = true
        stackView.leadingAnchor.constraint(equalTo: articleImage.trailingAnchor, constant: 8).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24).isActive = true
    }
}

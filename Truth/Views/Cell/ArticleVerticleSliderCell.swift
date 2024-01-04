//
//  ArticleVerticleSlider.swift
//  Truth
//
//  Created by Melvin Asare on 31/12/2023.
//

import UIKit

class ArticleVerticleSliderCell: UICollectionViewCell {
    private let article: ArticleVerticleSlider = {
       let view = ArticleVerticleSlider()
        return view
    }()
    
    public func configureArticle(title: String, image: String?, source: String) {
        article.setArticleDetails(title: title, image: image, source: source)
    }
    
    public func configureArticleSize(size: CGFloat, bold: Bool) {
        article.configureTitleSize(size: size, bold: bold)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(article)
        
        article.topAnchor.constraint(equalTo: topAnchor).isActive = true
        article.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 6).isActive = true
        article.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        article.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


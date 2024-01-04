//
//  ArticleHorizontalSliderViewCell.swift
//  Truth
//
//  Created by Melvin Asare on 30/12/2023.
//

import UIKit

class ArticleHorizontalSliderCell: UICollectionViewCell {
    private let article: ArticleHorizontalSlider = {
       let view = ArticleHorizontalSlider()
        return view
    }()
    
    public func configureArticle(title: String, image: String?, source: String) {
        article.setArticleDetails(title: title, image: image, source: source)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(article)
        
        article.topAnchor.constraint(equalTo: topAnchor).isActive = true
        article.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        article.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        article.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

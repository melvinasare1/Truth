//
//  NewsArticleViewModel.swift
//  Truth
//
//  Created by Melvin Asare on 07/01/2024.
//

import UIKit

class NewsArticleViewModel {
    public var content: String
    public var image: String
    public var authorName: String
    public var publishedDate: String
    public var url: URL
    
    init(content: String, image: String, authorName: String, date: String, url: URL) {
        self.content = content
        self.image = image
        self.authorName = authorName
        self.publishedDate = date
        self.url = url
    }
}

//
//  Articles.swift
//  Truth
//
//  Created by Melvin Asare on 22/12/2023.
//

import Foundation

struct Articles: Codable {
    let title: String
    let author: String?
    let source: Source?
    let publishedAt: String?
    let description: String?
    let urlToImage: URL?
    let url: URL
    let content: String?
}

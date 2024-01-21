//
//  News.swift
//  Truth
//
//  Created by Melvin Asare on 22/12/2023.
//

import Foundation

struct News: Codable {
    let status: String?
    let totalResults: Int
    let articles: [Article]
}

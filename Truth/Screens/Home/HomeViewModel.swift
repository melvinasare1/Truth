//
//  HomeViewModel.swift
//  Truth
//
//  Created by Melvin Asare on 31/12/2023.
//

import Foundation
import Combine

class HomeViewModel {
    @Published public var techCrunchNews: News?
    @Published public var appleNews: News?

    private var newsTypes = ["Beyond","Taste", "Hello", "Time"]
    
    public func news(for indexPath: IndexPath, articles: [Article]?) -> Article? {
        return articles?.object(at: indexPath.row)
    }
    
    public func fetchTechCrunchArticles() {
        Network.shared.fetchNewsApi(url: .techCrunch) { [weak self] news in
            guard let self = self else { return }
            do {
                self.techCrunchNews = try news.get()
            } catch {
                print(error)
            }
        }
    }
    
    public func fetchAppleArticles() {
        Network.shared.fetchNewsApi(url: .apple) { [weak self] news in
            guard let self = self else { return }
            do {
                print(news)
                self.appleNews = try news.get()
            } catch {
                print(error)
            }
        }
    }
    
    init() {
        fetchAppleArticles()
        fetchTechCrunchArticles()
    }
}

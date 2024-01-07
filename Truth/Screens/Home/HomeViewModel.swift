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
    @Published public var usHeadlineNews: News?
    @Published public var teslaNews: News?
    @Published public var wallStreetNews: News?
    @Published public var popularNews: News?

    private var newsTypes = ["Beyond","Taste", "Hello", "Time"]
    
    public func news(for indexPath: IndexPath, articles: [Articles]?) -> Articles? {
        return articles?.object(at: indexPath.row)
    }
    
    public func type(for indexPath: IndexPath) -> String? {
        return newsTypes.object(at: indexPath.row)
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
    
    public func fetchTeslaArticles() {
        Network.shared.fetchNewsApi(url: .tesla) { news in
            print(news)
        }
    }
    
    public func fetchAppleArticles() {
        Network.shared.fetchNewsApi(url: .apple) { news in
            print(news)
        }
    }
    
    public func fetchHeadlinesArticles() {
        Network.shared.fetchNewsApi(url: .us) { news in
            print(news)
        }
    }
 
    public func fetchWallStreetArticles() {
        Network.shared.fetchNewsApi(url: .wallStreet) { news in
            print(news)
        }
    }
    
    public func fetchPopularArticles() {}
    
    
    init() {
//        fetchAppleArticles()
//        fetchTeslaArticles()
//        fetchHeadlinesArticles()
        fetchTechCrunchArticles()
//        fetchWallStreetArticles()
    }
}

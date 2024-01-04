//
//  HomeViewModel.swift
//  Truth
//
//  Created by Melvin Asare on 31/12/2023.
//

import Foundation

class HomeViewModel {
    public var techCrunchNews: News?
    public var appleNews: News?
    public var usHeadlineNews: News?
    public var teslaNews: News?
    public var wallStreetNews: News?
    public var popularNews: News?

    private var newsTypes = ["Beyond","Taste", "Hello", "Time"]
    
    public func news(for indexPath: IndexPath, type: News) -> Articles? {
        return type.articles?.object(at: indexPath.row)
    }
    
    public func type(for indexPath: IndexPath) -> String? {
        return newsTypes.object(at: indexPath.row)
    }
    
    public func fetchTechCrunchArticles() {
        Network.shared.fetchNewsApi(url: .techCrunch) { news in
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
}

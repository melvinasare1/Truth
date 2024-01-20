//
//  Network.swift
//  Truth
//
//  Created by Melvin Asare on 22/12/2023.
//

import Foundation

class Network {
    
    enum DataError: Error {
        case invalidData
        case invalidResponse
        case message(_ error: Error?)
    }
    
    let apiKey = "b6cfba22f60740d5aa9d08cc0956a9e1"
 
    enum NewsApi: String {
        case apple = "https://newsapi.org/v2/everything?q=apple&from=2023-12-21&to=2023-12-21&sortBy=popularity&apiKey=b6cfba22f60740d5aa9d08cc0956a9e1"
        case tesla = "https://newsapi.org/v2/everything?q=tesla&from=2023-11-22&sortBy=publishedAt&apiKey=b6cfba22f60740d5aa9d08cc0956a9e1"
        case us = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=b6cfba22f60740d5aa9d08cc0956a9e1"
        case techCrunch = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=b6cfba22f60740d5aa9d08cc0956a9e1"
        case wallStreet = "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=b6cfba22f60740d5aa9d08cc0956a9e1"
    }
    
    static let shared = Network()
    
    public func fetchNewsApi(url: NewsApi, completion: @escaping (Result <News, DataError>) -> Void) {
            URLSession.shared.dataTask(with: URL(string: "\(url.rawValue)")!) { data, response, error in
            guard let data else {
                completion(.failure(.invalidData))
                return
            }
            
                print(response, data)
            guard let response = response as? HTTPURLResponse, 200 ... 299  ~= response.statusCode else {
                completion(.failure(.invalidResponse))
                return
            }
            
            do {
                let news = try JSONDecoder().decode(News.self, from: data)
                completion(.success(news))
                
                print(news)
            }
            catch {
                completion(.failure(.message(error)))
            }
        }.resume()
    }
}

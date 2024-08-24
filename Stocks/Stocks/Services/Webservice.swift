//
//  Webservice.swift
//  Stocks
//
//  Created by Róbert Šumšala Jr. on 21/08/2024.
//

import Foundation


enum NetworkError: Error {
    case invalidServerResponse
}



class Webservice {
    
    func fetchStocks() async throws -> [Stock] {
        
        let(data, response) = try await URLSession.shared.data(from: Constants.URLs.allStocks)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.invalidServerResponse
        }
        
        let stocks = try JSONDecoder().decode([Stock].self, from: data)
        
        return stocks
        
    }
    
    func fetchArticlesBy(stock: Stock) async throws -> [Article] {
        
        let (data, response) = try await URLSession.shared.data(from: Constants.URLs.articlesBy(stock: stock))
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.invalidServerResponse
        }
        
        let articleResponse = try JSONDecoder().decode(ArticleResponse.self, from: data)
        
        return articleResponse.articles
        
    }
    
    
    func fetchBusinessArticles() async throws -> [Article] {
        
        let (data, response) = try await URLSession.shared.data(from: Constants.URLs.bussinesArticles)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.invalidServerResponse
        }
        
        let articleResponse = try JSONDecoder().decode(ArticleResponse.self, from: data)
        
        return articleResponse.articles
    }
    
}

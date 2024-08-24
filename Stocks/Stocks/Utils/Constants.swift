//
//  Constants.swift
//  Stocks
//
//  Created by Róbert Šumšala Jr. on 21/08/2024.
//

import Foundation

struct Constants {
    
    static let apiKey = "d19e630767854085b01ded9fb3f3e1fd"
    
    struct URLs {
        static let allStocks = URL(string: "https://island-bramble.glitch.me/latest-stocks")!
        static let bussinesArticles = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=\(apiKey)")!
        
        static func articlesBy(stock: Stock) -> URL {
            
            return URL(string: "https://newsapi.org/v2/everything?q=\(stock.description)&sortBy=publishedAt&apiKey=\(apiKey)")!
            
        }
    }
    
}

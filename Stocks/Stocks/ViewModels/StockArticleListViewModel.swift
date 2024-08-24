//
//  StockArticleListViewModel.swift
//  Stocks
//
//  Created by Róbert Šumšala Jr. on 21/08/2024.
//

import Foundation

@MainActor
class StockArticleListViewModel: ObservableObject {
    
    @Published var stockArticles: [StockArticleViewModel] = []
    
    func fetchArticles() async {
        
        // var stockArticles: [StockArticleViewModel] = []
        
        do {
            let articles = try await Webservice().fetchBusinessArticles()
            let stockArticleVM = StockArticleViewModel(articlesModel: articles)
            self.stockArticles.append(stockArticleVM)
        } catch {
            print(error)
        }
        
    }
    
}

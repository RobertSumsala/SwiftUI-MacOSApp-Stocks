//
//  StockArticleViewModel.swift
//  Stocks
//
//  Created by Róbert Šumšala Jr. on 21/08/2024.
//

import Foundation

struct StockArticleViewModel: Identifiable {
    
    let id = UUID()
    
    private let stockModel: Stock?
    private let articlesModel: [Article]
    
    init(stockModel: Stock? = nil, articlesModel: [Article]) {
        self.stockModel = stockModel
        self.articlesModel = articlesModel
    }
    
    var stock: StockViewModel? {
        guard let stockModel = stockModel else {return nil}
        return StockViewModel(stock: stockModel)
    }
    
    var articles: [ArticleViewModel] {
        articlesModel.map(ArticleViewModel.init)
    }
    
}

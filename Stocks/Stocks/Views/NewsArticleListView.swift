//
//  NewsArticleListView.swift
//  Stocks
//
//  Created by Róbert Šumšala Jr. on 21/08/2024.
//

import SwiftUI

struct NewsArticleListView: View {
    
    @EnvironmentObject private var routeState: RouteState
    let stockArticles: [StockArticleViewModel]
    
    var body: some View {
        ForEach(stockArticles) { stockArticle in
            
            ArticlesGridView(articles: stockArticle.articles) { selectedArticle in
                guard let articleUrl = selectedArticle.url else { return }
                routeState.push(.businessArticles)
                routeState.route = .articleDetail(articleUrl)
            }
            
        }
    }
}

#Preview {
    NewsArticleListView(stockArticles: [])
}

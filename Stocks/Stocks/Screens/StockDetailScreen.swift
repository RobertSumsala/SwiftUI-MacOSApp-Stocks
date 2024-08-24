//
//  StockDetailScreen.swift
//  Stocks
//
//  Created by Róbert Šumšala Jr. on 22/08/2024.
//

import SwiftUI

struct StockDetailScreen: View {
    
    @EnvironmentObject private var routeSate: RouteState
    let stock: StockViewModel
    @StateObject private var vm = StockDetailViewModel()
    
    
    var body: some View {
        ScrollView {
            VStack {
                NewsArticleHeaderView(symbol: stock.symbol)
                
                ArticlesGridView(articles: vm.articles) { selectedArticle in
                    guard let articleUrl = selectedArticle.url else { return }
                    routeSate.push(.stockDetail(stock))
                    routeSate.route = .articleDetail(articleUrl)
                }
                
            }.task(id: stock) {
                await vm.fetchArticlesByStock(stock: stock)
            }
        }
    }
}

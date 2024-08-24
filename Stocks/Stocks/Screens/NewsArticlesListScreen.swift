//
//  NewsArticlesListScreen.swift
//  Stocks
//
//  Created by Róbert Šumšala Jr. on 21/08/2024.
//

import SwiftUI

struct NewsArticlesListScreen: View {
    
    @StateObject private var vm = StockArticleListViewModel()
    
    var body: some View {
        ScrollView {
            Text("Top Stories in US")
                .fontWeight(.bold)
                .font(.system(size: 40))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            NewsArticleListView(stockArticles: vm.stockArticles)
        }.task {
            await vm.fetchArticles()
        }
    }
}

#Preview {
    NewsArticlesListScreen()
}

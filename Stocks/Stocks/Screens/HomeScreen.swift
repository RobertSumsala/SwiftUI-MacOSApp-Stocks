//
//  HomeScreen.swift
//  Stocks
//
//  Created by Róbert Šumšala Jr. on 21/08/2024.
//

import SwiftUI

struct HomeScreen: View {
    
    @EnvironmentObject private var routeState: RouteState
    
    var body: some View {
        NavigationView{
            SideBar()
                .frame(minWidth: 250, maxWidth: 350)
            
            switch routeState.route {
                case .businessArticles:
                    NewsArticlesListScreen()
                case .stockDetail(let stock):
                    StockDetailScreen(stock: stock)
                case .articleDetail(let articleUrl):
                    WebViewScreen(url: articleUrl)
            }
        }
    }
}

#Preview {
    HomeScreen()
}

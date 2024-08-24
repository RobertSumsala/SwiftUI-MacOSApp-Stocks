//
//  ArticlesGridView.swift
//  Stocks
//
//  Created by Róbert Šumšala Jr. on 21/08/2024.
//

import SwiftUI

struct ArticlesGridView: View {
    
    @EnvironmentObject private var appState: AppState
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    let articles: [ArticleViewModel]
    let onSelected: (ArticleViewModel) -> Void
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(articles) { article in
                ArticleCellView(article: article) { selectedArticle in
                    onSelected(selectedArticle)
                }
            }
        }
    }
}



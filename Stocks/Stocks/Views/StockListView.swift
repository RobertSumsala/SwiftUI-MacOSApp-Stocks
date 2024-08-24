//
//  StockListView.swift
//  Stocks
//
//  Created by Róbert Šumšala Jr. on 21/08/2024.
//

import SwiftUI

struct StockListView: View {
    
    @EnvironmentObject private var routeSate: RouteState
    let stocks: [StockViewModel]
    
    var body: some View {
        
        List {
            
            BusinessHeaderView() {
                routeSate.route = .businessArticles
            }
            
            ForEach(stocks) { stock in
                StockCellView(stock: stock) { selectedStock in
                    routeSate.route = .stockDetail(selectedStock)
                }
            }
            
            Divider()
            Text("The provided Stock data are fake. They serve only for display puposes")
                .font(.system(size: 5.5))
                .opacity(0.3)
                .padding(.vertical, 1)
            
        }
        
    }
}

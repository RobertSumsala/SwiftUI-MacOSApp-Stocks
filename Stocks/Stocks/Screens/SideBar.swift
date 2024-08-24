//
//  SideBar.swift
//  Stocks
//
//  Created by Róbert Šumšala Jr. on 21/08/2024.
//

import SwiftUI

struct SideBar: View {
    
    @EnvironmentObject var stockState: StocksState
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            StockListScreen(vm: StockListViewModel(stocksState: stockState))
            
        }
        
    }
}

#Preview {
    SideBar()
}

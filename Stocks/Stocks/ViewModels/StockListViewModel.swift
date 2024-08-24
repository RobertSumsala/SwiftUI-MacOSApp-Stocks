//
//  StockListViewModel.swift
//  Stocks
//
//  Created by Róbert Šumšala Jr. on 21/08/2024.
//

import Foundation

@MainActor
class StockListViewModel: ObservableObject {
    
    var stocksState: StocksState
    
    init(stocksState: StocksState) {
        self.stocksState = stocksState
    }
    
    var stocks: [StockViewModel] {
        stocksState.stocks
    }
    
    
    func getStocks() async {
        
        do {
            let stocks = try await Webservice().fetchStocks()
            stocksState.stocks = stocks.map(StockViewModel.init)
        } catch {
            print(error)
        }
        
    }
    
}


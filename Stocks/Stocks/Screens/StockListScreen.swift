//
//  StockListScreen.swift
//  Stocks
//
//  Created by Róbert Šumšala Jr. on 21/08/2024.
//

import SwiftUI

struct StockListScreen: View {
    
    let timer = Timer.publish(every: 5.0, on: .main, in: .common).autoconnect()
    
    @StateObject var vm: StockListViewModel
    @State private var search: String = ""
    
    init(vm: StockListViewModel) {
        self._vm = StateObject(wrappedValue: vm)
    }
    
    var stocks: [StockViewModel] {
        if !search.isEmpty {
            return vm.stocks.filter { $0.symbol.starts(with: search.uppercased())}
        } else {
            return vm.stocks
        }
    }
    
    var body: some View {
        
        VStack {
            StockListView(stocks: stocks)
                .searchable(text: $search, placement: .sidebar)
        }.task {
            await vm.getStocks()
        }
        .onReceive(timer) { _ in
            Task {
                await vm.getStocks()
            }
        }
        
    }
}


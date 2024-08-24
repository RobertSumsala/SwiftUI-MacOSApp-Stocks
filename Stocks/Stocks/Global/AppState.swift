//
//  AppState.swift
//  Stocks
//
//  Created by Róbert Šumšala Jr. on 21/08/2024.
//

import Foundation

class AppState: ObservableObject{
    var stocksState: StocksState
    var routeState: RouteState
    
    init(stocksState: StocksState = StocksState(), routeState: RouteState = RouteState()) {
        self.stocksState = stocksState
        self.routeState = routeState
    }
}

class StocksState: ObservableObject {
    @Published var stocks: [StockViewModel] = []
    
    func stockBySymbol(_ symbol: String) -> StockViewModel? {
        
        guard let stock = (stocks.first { $0.symbol == symbol }) else {
            fatalError("")
        }
        
        return stock
        
    }
}

class RouteState: ObservableObject {
    var routes: [Route] = []
    @Published var route: Route = .businessArticles
    
    func push(_ route: Route) {
        routes.append(route)
        self.route = route
    }
    
    func pop() -> Route? {
        return routes.popLast()
    }
}

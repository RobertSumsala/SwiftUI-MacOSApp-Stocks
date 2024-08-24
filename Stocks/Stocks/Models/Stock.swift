//
//  Stock.swift
//  Stocks
//
//  Created by Róbert Šumšala Jr. on 21/08/2024.
//

import Foundation

struct Stock: Decodable {
    
    let symbol: String
    let description: String
    let price: Double
    let change: String
    
}

extension Stock {
    
    static func fromVM(_ vm: StockViewModel) -> Stock {
        Stock(symbol: vm.symbol, description: vm.name, price: vm.price, change: vm.change)
    }
    
}

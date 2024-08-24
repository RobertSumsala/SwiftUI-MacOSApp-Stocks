//
//  StocksApp.swift
//  Stocks
//
//  Created by Róbert Šumšala Jr. on 21/08/2024.
//

import SwiftUI

@main
struct StocksApp: App {
    
    let appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            HomeScreen()
                .frame(minWidth: 1280, minHeight: 850)
                .environmentObject(appState)
                .environmentObject(appState.stocksState)
                .environmentObject(appState.routeState)
        }
    }
}

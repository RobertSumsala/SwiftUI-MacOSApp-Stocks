//
//  WebViewScreen.swift
//  Stocks
//
//  Created by Róbert Šumšala Jr. on 22/08/2024.
//

import SwiftUI

struct WebViewScreen: View {
    
    @EnvironmentObject private var routeState: RouteState
    let url: URL
    
    var body: some View {
        
        VStack {
            WebView(url: url)
                .toolbar {
                    ToolbarItem(placement: .navigation) {
                        Button("Back") {
                            if let route = routeState.pop() {
                                routeState.route = route
                            }
                        }
                    }
                }
        }
        
    }
}



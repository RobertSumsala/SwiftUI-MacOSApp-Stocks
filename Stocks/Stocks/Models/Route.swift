//
//  Route.swift
//  Stocks
//
//  Created by Róbert Šumšala Jr. on 22/08/2024.
//

import Foundation

enum Route {
    case businessArticles
    case stockDetail(StockViewModel)
    case articleDetail(URL)
}

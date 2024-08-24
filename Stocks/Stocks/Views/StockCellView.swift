//
//  StockCellView.swift
//  Stocks
//
//  Created by Róbert Šumšala Jr. on 21/08/2024.
//

import SwiftUI

struct StockCellView: View {
    
    let stock: StockViewModel
    let onSelected: (StockViewModel) -> Void
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text(stock.symbol)
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                Text(stock.name)
                    .opacity(0.4)
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 2) {
                Text("\(stock.price, specifier: "%.2f")")
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                
                Button {
                    // action
                } label: {
                    Text(stock.change)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }.frame(maxWidth: 60)
                    .background(changeColor(stock.change))
                    .clipShape(RoundedRectangle(cornerRadius: 6, style: .continuous))
            }
        }.contentShape(Rectangle())
        .onTapGesture {
            onSelected(stock)
        }
        
    }
}

//
//  BusinessHeaderView.swift
//  Stocks
//
//  Created by Róbert Šumšala Jr. on 21/08/2024.
//

import SwiftUI

struct BusinessHeaderView: View {
    
    let onSelected: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Business News")
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("From News")
                .font(.caption2)
                .opacity(0.4)
        }.padding()
            .frame(maxWidth: .infinity)
            .background(Color(red: 0.363, green: 0.354, blue: 0.383))
            .clipShape(RoundedRectangle(cornerRadius: 6))
            .onTapGesture {
                onSelected()
            }
    }
}



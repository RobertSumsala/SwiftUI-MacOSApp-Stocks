//
//  View+Extensions.swift
//  Stocks
//
//  Created by Róbert Šumšala Jr. on 21/08/2024.
//

import Foundation
import SwiftUI

extension View {
    
    func changeColor(_ change: String) -> Color {
        
        guard let value = Double(change) else {
            return .green
        }
        
        return value < 0 ? .red : Color(red: 0.186, green: 0.421, blue: 0.259)
        
    }
    
}

//
//  PriceView.swift
//  int-bonprix
//
//  Created by Karem Gohar on 12.07.24.
//

import SwiftUI

struct PriceView: View {
    
    let price: Price
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5, content: {
            Text("\(String(format: "%.2f", price.value)) \(price.currency)")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("inkl. MwSt., zzgl. Versandkosten")
                .font(.caption)
                .foregroundColor(.gray)
        })
    }
}

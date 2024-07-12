//
//  VariantsView.swift
//  int-bonprix
//
//  Created by Karem Gohar on 12.07.24.
//

import SwiftUI

struct VariantsView: View {
    
    let variants: [Variant]
    @Binding var selectedVariant: Variant?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20, content:  {
            Text("Farbe")
                .font(.headline)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(variants) { variant in
                        Button(action: {
                            selectedVariant = variant
                        }) {
                            Text(variant.color)
                                .padding()
                                .background(selectedVariant == variant ? Color.black : Color.white)
                                .foregroundColor(selectedVariant == variant ? .white : .black)
                                .cornerRadius(5)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.black, lineWidth: 2)
                                )
                        }
                    }
                }
            }
        })
    }
    
}

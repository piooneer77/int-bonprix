//
//  AddToBascketView.swift
//  int-bonprix
//
//  Created by Karem Gohar on 12.07.24.
//

import SwiftUI

struct AddToBascketView: View {
    
    @Binding var selectedVariant: Variant?
        
    var body: some View {
        Button(action: {
            // TODO: Add to bascket logic
        }) {
            Text((selectedVariant?.isAvailable != false) ? "In die Einkaufstasche" : "Nicht verfügbar")
                .font(.title2)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background((selectedVariant?.isAvailable != false) ? Color.black : Color.gray)
                .cornerRadius(8)
        }
    }
}

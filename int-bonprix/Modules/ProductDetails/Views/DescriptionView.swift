//
//  DescriptionView.swift
//  int-bonprix
//
//  Created by Karem Gohar on 12.07.24.
//

import SwiftUI

struct DescriptionView: View {
    
    let description: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5, content:  {
            Text("Beschreibung")
                .font(.headline)
            
            Text(description)
                .font(.body)
        })
    }
    
}

//
//  ProductImageView.swift
//  int-bonprix
//
//  Created by Karem Gohar on 12.07.24.
//

import SwiftUI

struct ProductImageView: View {
    
    @ObservedObject var viewModel: ProductDetailsViewModel
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(uiImage: viewModel.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 500)
            
            Button(action: {
                viewModel.toggleFavourite()
            }) {
                Image(systemName: viewModel.isFavourite ? "heart.fill" : "heart")
                    .foregroundColor(viewModel.isFavourite ? .black : .white)
                    .padding()
                    .background(Color.black.opacity(0.2))
                    .clipShape(Circle())
            }
        }
    }
}

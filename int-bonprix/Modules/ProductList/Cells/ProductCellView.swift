//
//  ProductCellView.swift
//  int-bonprix
//
//  Created by Halawany on 10.07.24.
//

import Combine
import SwiftUI

struct ProductCellView: View {
    
    @EnvironmentObject var router: Router
    @ObservedObject var viewModel: ProductCellViewModel
    
    var body: some View {
        VStack(alignment: .leading, content: {
            Image(uiImage: viewModel.image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 175)
            Text(viewModel.product.title)
                .font(.headline)
            Text("\(String(format: "%.2f", viewModel.product.price.value)) \(viewModel.product.price.currency)")
                .font(.subheadline)
                .foregroundColor(.secondary)
        })
        .onTapGesture {
            router.navigateTo(.productDetails(productId: viewModel.product.id))
        }
        .padding()
        .background(Color(UIColor.white))
        .cornerRadius(8)
        .shadow(radius: 4)
    }
}

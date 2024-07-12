//
//  ProductDetailsView.swift
//  int-bonprix
//
//  Created by Karem Gohar on 11.07.24.
//

import SwiftUI

struct ProductDetailsView: View {
    
    @EnvironmentObject var router: Router
    @ObservedObject var viewModel: ProductDetailsViewModel
    
    var body: some View {
        VStack {
            if let product = viewModel.product {
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        
                        ProductImageView(viewModel: viewModel)
                        
                        if let price = viewModel.product?.price {
                            PriceView(price: price)
                        }
                        
                        if let variants = viewModel.product?.variants {
                            VariantsView(variants: variants, selectedVariant: $viewModel.selectedVariant)
                        }
                        
                        DescriptionView(description: product.description)
                        
                        Spacer()
                    }
                }
                .padding()
                
                AddToBascketView(selectedVariant: $viewModel.selectedVariant)
                    .padding()
                
            } else {
                ProgressView()
                    .onAppear {
                        viewModel.fetchProductDetails()
                    }
            }
        }
    }
    
    private var backButton: some View {
        Button(action: {
            router.popToRoot()
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(.black)
        }
    }
    
}

//struct ProductDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        let viewModel = ProductDetailsViewModel(productId: 906855,
//                                                productService: ProductService.shared,
//                                                imageService: ImageService.shared)
//        ProductDetailsView(viewModel: viewModel)
//    }
//}

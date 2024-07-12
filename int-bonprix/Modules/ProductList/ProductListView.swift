//
//  ProductListView.swift
//  int-bonprix
//
//  Created by Halawany on 10.07.24.
//

import Combine
import SwiftUI

struct ProductListView: View {
    
    @ObservedObject private var viewModel: ProductListViewModel
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    init(viewModel: ProductListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView {
            if viewModel.isLoading {
                ProgressView()
            } else {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.products) { product in
                        createCellView(product)
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Produktübersicht")
        .onAppear {
            viewModel.fetchProductList()
        }
    }
    
    private func createCellView(_ product: Product) -> ProductCellView {
        ProductCellView(viewModel: ProductCellViewModel(product: product,
                                                        imageService: viewModel.imageService))
    }
    
}

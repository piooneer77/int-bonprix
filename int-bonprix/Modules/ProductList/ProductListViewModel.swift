//
//  ProductListViewModel.swift
//  int-bonprix
//
//  Created by Halawany on 10.07.24.
//

import Foundation
import Combine

final class ProductListViewModel: ObservableObject {
    
    @Published var products: [Product] = []
    @Published var isLoading: Bool = false
    
    private let productService: ProductServiceProtocol
    let imageService: ImageServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(productService: ProductServiceProtocol, imageService: ImageServiceProtocol) {
        self.productService = productService
        self.imageService = imageService
    }
    
    func fetchProductList() {
        isLoading = true
        productService.getProductList()
            .receive(on: RunLoop.main)
            .sink { [weak self] completion in
                guard let self else { return }
                self.isLoading = false
                if case .failure(let error) = completion {
                    print("Error fetching products: \(error)")
                }
            } receiveValue: { [weak self] products in
                guard let self else { return }
                self.products = products
            }
            .store(in: &cancellables)
    }
    
}

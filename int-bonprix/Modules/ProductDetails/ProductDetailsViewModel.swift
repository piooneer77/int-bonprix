//
//  ProductDetailsViewModel.swift
//  int-bonprix
//
//  Created by Karem Gohar on 12.07.24.
//

import Combine
import SwiftUI

final class ProductDetailsViewModel: ObservableObject {
    
    @Published var product: Product?
    @Published var isLoading: Bool = false
    @Published var isFavourite: Bool = false
    @Published var image: UIImage = UIImage(systemName: "photo")!
    @Published var selectedVariant: Variant? {
        didSet {
            if let variant = selectedVariant {
                fetchImage(urlString: variant.imageURL)
            }
        }
    }
    
    private let productId: Int
    private let productService: ProductServiceProtocol
    private let imageService: ImageServiceProtocol
    private let favouriteService: FavouriteServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(productId: Int,
         productService: ProductServiceProtocol,
         imageService: ImageServiceProtocol,
         favouriteService: FavouriteServiceProtocol) {
        self.productService = productService
        self.imageService = imageService
        self.productId = productId
        self.favouriteService = favouriteService
        self.isFavourite = favouriteService.getFavouriteStatus(for: productId)
    }
    
    func fetchProductDetails() {
        isLoading = true
        productService.getProductDetails(productId: productId)
            .receive(on: RunLoop.main)
            .sink { [weak self] completion in
                guard let self else { return }
                self.isLoading = false
                if case .failure(let error) = completion {
                    print("Error fetching product details: \(error)")
                }
            } receiveValue: { [weak self] product in
                guard let self else { return }
                self.product = product
                self.fetchImage(urlString: product.imageURL)
            }
            .store(in: &cancellables)
    }
    
    func toggleFavourite() {
        isFavourite.toggle()
        favouriteService.saveFavouriteStatus(for: productId, isFavourite: isFavourite)
    }
    
    private func fetchImage(urlString: String) {
        imageService.fetchImage(urlString: urlString)
            .receive(on: RunLoop.main)
            .sink { completion in
                if case .failure(let error) = completion {
                    print("Error fetching image: \(error)")
                }
            } receiveValue: { [weak self] image in
                guard let self, let image else { return }
                self.image = image
            }
            .store(in: &cancellables)
    }
    
}

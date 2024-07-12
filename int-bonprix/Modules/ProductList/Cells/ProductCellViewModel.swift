//
//  ProductCellViewModel.swift
//  int-bonprix
//
//  Created by Halawany on 10.07.24.
//

import Combine
import UIKit

final class ProductCellViewModel: ObservableObject {
    
    @Published var product: Product
    @Published var image: UIImage = UIImage(systemName: "photo")!
    private let imageService: ImageServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(product: Product, imageService: ImageServiceProtocol) {
        self.product = product
        self.imageService = imageService
        fetchData()
    }
    
    func fetchData() {
        imageService.fetchImage(urlString: product.imageURL)
            .receive(on: RunLoop.main)
            .sink { completion in
                if case .failure(let error) = completion {
                    print("Error fetching image: \(error)")
                }
            } receiveValue: { [weak self] image in
                guard let self = self, let image = image else { return }
                self.image = image
            }
            .store(in: &cancellables)
    }
    
}

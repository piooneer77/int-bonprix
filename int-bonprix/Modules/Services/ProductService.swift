//
//  ProductService.swift
//  int-bonprix
//
//  Created by Halawany on 10.07.24.
//

import Foundation
import Combine

final class ProductService: ProductServiceProtocol {
    
    static let shared = ProductService()
    
    private init () { }
    
    func getProductList() -> AnyPublisher<[Product], Error> {
        
        // TODO: replace the Mock data from json with actual network call
        // return NetworkService.shared.publish(endpoint: .getAllProducts)
        
        guard let path = Bundle.main.path(forResource: "MockProducts", ofType: "json") else {
            return Fail(error: NSError(domain: "File not found", code: 404, userInfo: nil))
                .eraseToAnyPublisher()
        }
        return Just(path)
            .tryMap { path -> Data in
                let url = URL(fileURLWithPath: path)
                return try Data(contentsOf: url)
            }
            .decode(type: [Product].self, decoder: JSONDecoder())
            .mapError { error -> Error in
                return NSError(domain: "Data decoding error", code: 500, userInfo: [NSLocalizedDescriptionKey: error.localizedDescription])
            }
            .eraseToAnyPublisher()
    }
    
    func getProductDetails(productId: Int) -> AnyPublisher<Product, Error> {
        
        // TODO: replace the Mock data from json with actual network call
        // return NetworkService.shared.publish(endpoint: .getProductDetails(productId: productId))
        
        guard let path = Bundle.main.path(forResource: "MockProducts", ofType: "json") else {
            return Fail(error: NSError(domain: "File not found", code: 404, userInfo: nil))
                .eraseToAnyPublisher()
        }
        return Just(path)
            .tryMap { path -> Data in
                let url = URL(fileURLWithPath: path)
                return try Data(contentsOf: url)
            }
            .decode(type: [Product].self, decoder: JSONDecoder())
            .tryMap { products -> Product in
                guard let product = products.first(where: { $0.id == productId }) else {
                    throw NSError(domain: "Product not found", code: 404, userInfo: nil)
                }
                return product
            }
            .mapError { error -> Error in
                return NSError(domain: "Data decoding error", code: 500, userInfo: [NSLocalizedDescriptionKey: error.localizedDescription])
            }
            .eraseToAnyPublisher()
    }
    
}

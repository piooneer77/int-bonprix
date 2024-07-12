//
//  ProductServiceProtocol.swift
//  int-bonprix
//
//  Created by Halawany on 10.07.24.
//

import Combine

protocol ProductServiceProtocol {
    func getProductList() -> AnyPublisher<[Product], Error>
    func getProductDetails(productId: Int) -> AnyPublisher<Product, Error>
}

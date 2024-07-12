//
//  ProductListMockService.swift
//  int-bonprixTests
//
//  Created by Halawany on 10.07.24.
//

import Foundation
import Combine

final class ProductListMockService: ProductListServiceProtocol {
    func getProductList(endPoint: APIEndpoint) -> AnyPublisher<[Product], Error> {
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
}

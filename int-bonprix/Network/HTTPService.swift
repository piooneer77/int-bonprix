//
//  HTTPService.swift
//  int-bonprix
//
//  Created by Halawany on 10.07.24.
//

import Foundation
import Combine

protocol HTTPService {
    func publish<T: Decodable>(endpoint: APIEndpoint) -> AnyPublisher<T, Error>
}

extension HTTPService {
    func publish<T: Decodable>(endpoint: APIEndpoint) -> AnyPublisher<T, Error> {
        return URLSession.shared.dataTaskPublisher(for: endpoint.url)
            .catch { Fail(error: $0).eraseToAnyPublisher()}
            .map({ $0.data })
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

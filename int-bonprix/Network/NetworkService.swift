//
//  NetworkService.swift
//  int-bonprix
//
//  Created by Halawany on 10.07.24.
//

import Foundation
import Combine

class NetworkService: HTTPService {
    static let shared = NetworkService()
    
    private init() { }
    
    func publish<T>(endpoint: APIEndpoint) -> AnyPublisher<T, Error> where T : Decodable {
        return URLSession.shared.dataTaskPublisher(for: endpoint.url)
            .catch { Fail(error: $0).eraseToAnyPublisher()}
            .map({ $0.data })
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

//
//  ImageService.swift
//  int-bonprix
//
//  Created by Karem Gohar on 11.07.24.
//

import Foundation
import Combine
import UIKit

protocol ImageServiceProtocol {
    func fetchImage(urlString: String) -> AnyPublisher<UIImage?, Never>
}

final class ImageService: ImageServiceProtocol {
    
    static let shared = ImageService()
    private let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func fetchImage(urlString: String) -> AnyPublisher<UIImage?, Never> {
        guard let url = URL(string: urlString) else {
            return Just(nil).eraseToAnyPublisher()
        }
        
        if let cachedImage = cache.object(forKey: url.absoluteString as NSString) {
            return Just(cachedImage).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { data, _ in UIImage(data: data) }
            .receive(on: DispatchQueue.main) // Update UI on main thread
            .catch { _ in Just(nil) }
            .handleEvents(receiveOutput: { [weak self] image in
                guard let self = self, let image = image else { return }
                self.cache.setObject(image, forKey: url.absoluteString as NSString)
            })
            .eraseToAnyPublisher()
    }
}

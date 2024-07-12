//
//  FavouriteService.swift
//  int-bonprix
//
//  Created by Karem Gohar on 12.07.24.
//

import SwiftUI
import Combine

protocol FavouriteServiceProtocol {
    func saveFavouriteStatus(for productId: Int, isFavourite: Bool)
    func getFavouriteStatus(for productId: Int) -> Bool
}

final class FavouriteService: FavouriteServiceProtocol {
    
    static let shared = FavouriteService()
    private let favouritesKey = "favouriteProducts"
    
    private init () { }
    
    func saveFavouriteStatus(for productId: Int, isFavourite: Bool) {
        UserDefaults.standard.setValue(isFavourite, forKey: String(productId))
    }
    
    func getFavouriteStatus(for productId: Int) -> Bool {
        let favourites = UserDefaults.standard.dictionary(forKey: String(productId)) as? [Int: Bool] ?? [:]
        return favourites[productId] ?? false
    }
}

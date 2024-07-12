//
//  Product.swift
//  int-bonprix
//
//  Created by Halawany on 10.07.24.
//

struct Product: Codable, Identifiable {
    let id: Int
    let title: String
    let price: Price
    let imageURL: String
    let description: String
    let isAvailable: Bool
    let variants: [Variant]?

    enum CodingKeys: String, CodingKey {
        case id, title, price
        case imageURL = "imageUrl"
        case description, isAvailable, variants
    }
}

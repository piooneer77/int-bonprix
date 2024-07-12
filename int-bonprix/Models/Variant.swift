//
//  Variant.swift
//  int-bonprix
//
//  Created by Halawany on 10.07.24.
//

struct Variant: Codable, Identifiable, Equatable {
    let id: Int
    let color: String
    let imageURL: String
    let isAvailable: Bool

    enum CodingKeys: String, CodingKey {
        case id, color
        case imageURL = "imageUrl"
        case isAvailable
    }
}

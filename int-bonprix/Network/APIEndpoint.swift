//
//  APIEndpoint.swift
//  int-bonprix
//
//  Created by Halawany on 10.07.24.
//


import Foundation

enum HTTPMethod: String {
    case GET
    case POST
}

enum APIEndpoint {
    
    case getAllProducts
    case getProductDetails(productId: Int)
    
    var domain: String {
        return "https://api.bonprix.de"
    }
    
    var url: URL {
        switch self {
        case .getAllProducts:
            return URL(string: "\(domain)/kategorie")!
        case .getProductDetails(let productId):
            return URL(string: "\(domain)/produkt/\(productId)")!
        }
    }
    
    var method: HTTPMethod {
        return .GET
    }
    
    var headers: [String: String]? { return nil }
    
    var queryForCall: [URLQueryItem]? { return nil }
    
    var parameters: [String: Any]? { return nil }
    
    func body() throws -> Data? { return nil }
    
}

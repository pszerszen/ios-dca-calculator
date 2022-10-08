//
//  Response.swift
//  ios-dca-calculator
//
//  Created by Piotr Szerszeń on 08/10/2022.
//

import Foundation

struct SearchResultResponse: Decodable {

    let items: [SearchResult]
    
    enum CodingKeys: String, CodingKey {
        case items = "bestMatches"
    }
}

struct SearchResult: Decodable {

    let symbol: String
    let name: String
    let type: String
    let currency: String
    
    enum CodingKeys: String, CodingKey {
        case symbol = "1. symbol"
        case name = "2. name"
        case type = "3. type"
        case currency = "8. currency"
    }
}

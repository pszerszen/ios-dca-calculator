//
//  ApiService.swift
//  ios-dca-calculator
//
//  Created by Piotr Szerszeń on 08/10/2022.
//

import Foundation
import Combine

struct ApiService {

    private let API_KEYS = ["X5IF5LVKRU0XGVJG", "BNKMFIYE8XBT3H4S", "MXDG4Y0IIAMUMUZ5"]
    private var API_KEY: String {
        return API_KEYS.randomElement()!
    }
    
    func fetchSymbolsPublisher(keywords: String) -> AnyPublisher<SearchResultResponse, Error> {
        let urlString = "https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=\(keywords)&apikey=\(API_KEY)"
        
        let url = URL(string: urlString)!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map({ $0.data })
            .decode(type: SearchResultResponse.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
}

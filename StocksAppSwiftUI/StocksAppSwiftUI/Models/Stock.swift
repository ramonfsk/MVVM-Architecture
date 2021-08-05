//
//  Stock.swift
//  StocksAppSwiftUI
//
//  Created by Ramon Ferreira on 24/05/21.
//

import Foundation

struct Stock: Decodable {
    let symbol: String?
    let description: String?
    let price: Double?
    let change: String?
}

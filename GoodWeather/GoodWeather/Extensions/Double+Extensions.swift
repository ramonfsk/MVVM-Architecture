//
//  Double+Extensions.swift
//  GoodWeather
//
//  Created by Ramon Ferreira on 02/08/21.
//

import Foundation

extension Double {
    
    func formatAsDegree() -> String {
        return String(format: "%.0f°", self)
    }
}

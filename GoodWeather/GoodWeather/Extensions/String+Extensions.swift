//
//  String+Extensions.swift
//  GoodWeather
//
//  Created by Ramon Ferreira on 02/08/21.
//

import Foundation

extension String {
    
    func escaped() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlUserAllowed) ?? self
    }
}

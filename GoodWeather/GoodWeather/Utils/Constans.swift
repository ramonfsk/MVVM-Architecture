//
//  Constans.swift
//  GoodWeather
//
//  Created by Ramon Ferreira on 02/08/21.
//

import Foundation

struct Constans {
    
    static let apiUserKey = "edcb4d8703efae3daf356196558e6be0"
    
    struct Urls {
        
        static func urlForWeatherByCity(city: String) -> URL {
            
            let userDefaults = UserDefaults.standard
            let unit = (userDefaults.value(forKey: "unit") as? String) ?? "imperial"
            
            return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city.escaped())&appid=\(Constans.apiUserKey)&units=\(unit)")!
        }
    }
}

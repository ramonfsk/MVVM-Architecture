//
//  WeatherResponse.swift
//  GoodWeather
//
//  Created by Ramon Ferreira on 02/08/21.
//

import Foundation

struct WeatherResponse: Decodable {
    let name: String
    let main: Weather
}

struct Weather: Decodable {
    let temp: Double
    let humidity: Double
}

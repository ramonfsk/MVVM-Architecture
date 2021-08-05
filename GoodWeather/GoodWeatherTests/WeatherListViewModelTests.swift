//
//  WeatherListViewModelTests.swift
//  GoodWeatherTests
//
//  Created by Ramon Ferreira on 05/08/21.
//

import XCTest
@testable import GoodWeather

class WeatherListViewModelTests: XCTestCase {

    private var weatherListViewModel: WeatherListViewModel!
    
    override func setUp() {
        super.setUp()
        
        self.weatherListViewModel = WeatherListViewModel()
        // make WeatherViewModels to test
    }
    
    func test_should_be_able_to_convert_to_celsius_successfully() {
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
}

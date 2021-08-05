//
//  WeatherDetailsViewController.swift
//  GoodWeather
//
//  Created by Ramon Ferreira on 03/08/21.
//

import Foundation
import UIKit

class WeatherDetailsViewController: UIViewController {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var currrentTemperatureLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    
    var weatherViewModel: WeatherViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewModelBindings()
    }
    
    private func setupViewModelBindings() {
        if let weatherViewModel = self.weatherViewModel {
            weatherViewModel.name.bind { self.cityNameLabel.text = $0 }
            weatherViewModel.currentTemperature.temperature.bind { self.currrentTemperatureLabel.text = $0.formatAsDegree() }
            weatherViewModel.currentTemperature.temperatureMax.bind { self.maxTempLabel.text = $0.formatAsDegree() }
            weatherViewModel.currentTemperature.temperatureMin.bind { self.minTempLabel.text = $0.formatAsDegree() }
        }
        
        // change de value after few seconds
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//            self.weatherViewModel?.name.value = "Boston"
//        }
    }
}

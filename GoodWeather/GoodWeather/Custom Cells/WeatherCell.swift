//
//  WeatherCell.swift
//  GoodWeather
//
//  Created by Ramon Ferreira on 02/08/21.
//

import Foundation
import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    func configure(_ viewModel: WeatherViewModel) {
        self.cityNameLabel.text = viewModel.name.value
        self.temperatureLabel.text = "\(viewModel.currentTemperature.temperature.value.formatAsDegree())"
    }
}

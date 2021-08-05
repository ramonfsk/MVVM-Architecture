//
//  WeatherDataSource.swift
//  GoodWeather
//
//  Created by Ramon Ferreira on 04/08/21.
//

import Foundation
import UIKit

class WeatherDataSource: NSObject, UITableViewDataSource {
    
    let cellIdentifier: String = "WeatherCell"
    private var weatherListViewModel: WeatherListViewModel
    
    init(_ weatherListViewModel: WeatherListViewModel) {
        self.weatherListViewModel = weatherListViewModel
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weatherListViewModel.weatherViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as? WeatherCell else {
            fatalError("\(cellIdentifier) not found")
        }
        
        let weatherViewModel = self.weatherListViewModel.modelAt(indexPath.row)
        
        cell.cityNameLabel.text = weatherViewModel.name.value
        cell.temperatureLabel.text = weatherViewModel.currentTemperature.temperature.value.formatAsDegree()
        
        return cell
    }
}

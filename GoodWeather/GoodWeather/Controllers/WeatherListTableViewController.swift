//
//  WeatherListTableViewController.swift
//  GoodWeather
//
//  Created by Ramon Ferreira on 02/08/21.
//

import Foundation
import UIKit

class WeatherListTableViewController: UITableViewController {
    
    private var weatherListViewModel = WeatherListViewModel()
    private var dataSource: TableViewDataSource<WeatherCell, WeatherViewModel>!
    private var lastUnitSelection: Unit!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.dataSource = TableViewDataSource(cellIndentifier: "WeatherCell", items: self.weatherListViewModel.weatherViewModels) { cell, viewModel in
            cell.cityNameLabel.text = viewModel.name.value
            cell.temperatureLabel.text = viewModel.currentTemperature.temperature.value.formatAsDegree()
        }
        self.tableView.dataSource = self.dataSource
        
        let userDefaults = UserDefaults.standard
        if let value = userDefaults.value(forKey: "unit") as? String {
            self.lastUnitSelection = Unit(rawValue: value)!
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddWeatherCityViewController" {
            prepareSegueForAddWeatherCityViewController(segue: segue)
        } else if segue.identifier == "SettingsTableViewController" {
            prepareSegueForSettingsTableViewController(segue: segue)
        } else if segue.identifier == "WeatherDetailsViewController" {
            prepareSegueForWeatherDetailsViewController(segue: segue)
        }
    }
    
    func prepareSegueForAddWeatherCityViewController(segue: UIStoryboardSegue) {
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("NavigationController not found")
        }
        
        guard let addWeatherCityViewController = nav.viewControllers.first as? AddWeatherCityViewController else {
            fatalError("AddWeatherCityController not found")
        }
        
        addWeatherCityViewController.delegate = self
    }
    
    func prepareSegueForSettingsTableViewController(segue: UIStoryboardSegue) {
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("NavigationController not found")
        }
        
        guard let settingsTableViewController = nav.viewControllers.first as? SettingsTableViewController else {
            fatalError("SettingsTableController not found")
        }
        
        settingsTableViewController.delegate = self
    }
    
    func prepareSegueForWeatherDetailsViewController(segue: UIStoryboardSegue) {
        guard let weatherDetailsViewController = segue.destination as? WeatherDetailsViewController,
              let indexPath = self.tableView.indexPathForSelectedRow else {
                return
        }
        
        let weatherViewModel = self.weatherListViewModel.modelAt(indexPath.row)

        weatherDetailsViewController.weatherViewModel = weatherViewModel
    }
}

extension WeatherListTableViewController: AddWeatherDelegate {
    func addWeatherDidSave(viewModel: WeatherViewModel) {
        weatherListViewModel.addWeatherViewModel(viewModel)
        self.dataSource.updateItems(self.weatherListViewModel.weatherViewModels)
        self.tableView.reloadData()
    }
}

extension WeatherListTableViewController: SettingsDelegate {
    func settingsDone(viewModel: SettingsViewModel) {
        self.weatherListViewModel.updateUnit(to: viewModel.selectedUnit)
        self.tableView.reloadData()
    }
}

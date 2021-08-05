//
//  AddWeatherCityViewController.swift
//  GoodWeather
//
//  Created by Ramon Ferreira on 02/08/21.
//

import Foundation
import UIKit

protocol AddWeatherDelegate: AnyObject {
    func addWeatherDidSave(viewModel: WeatherViewModel)
}

class AddWeatherCityViewController: UIViewController {
    
    private var addCityViewModel = AddCityViewModel()
    
    @IBOutlet weak var cityNameTextField: BindingTextField! {
        didSet {
            cityNameTextField.bind { self.addCityViewModel.city = $0 }
        }
    }
    
    @IBOutlet weak var stateTextField: BindingTextField! {
        didSet {
            stateTextField.bind { self.addCityViewModel.state = $0 }
        }
    }
    
    @IBOutlet weak var zipCodeTextField: BindingTextField! {
        didSet {
            zipCodeTextField.bind { self.addCityViewModel.zipCode = $0 }
        }
    }
    
    weak var delegate: AddWeatherDelegate?
    
    @IBAction func saveCityButtonPressed() {
        print(self.addCityViewModel)
        
        if let city = cityNameTextField.text {
            let weatherURL = Constans.Urls.urlForWeatherByCity(city: city)
            
            let weatherResource = Resource<WeatherViewModel>(url: weatherURL) { data in
                let weatherViewModel = try? JSONDecoder().decode(WeatherViewModel.self, from: data)
                return weatherViewModel
            }
            
            WebService().load(resource: weatherResource) { [weak self] result in
                if let weatherViewModel = result {
                    if let delegate = self?.delegate {
                        delegate.addWeatherDidSave(viewModel: weatherViewModel)
                        self?.dismiss(animated: true)
                    }
                }
            }
        }
    }
    
    @IBAction func close() {
        self.dismiss(animated: true)
    }
}

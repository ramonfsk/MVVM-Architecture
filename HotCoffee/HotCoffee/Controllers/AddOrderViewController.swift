//
//  AddOrderNewViewController.swift
//  HotCoffee
//
//  Created by Ramon Ferreira on 23/04/21.
//

import Foundation
import UIKit

protocol AddCoffeeOrderDelegate {
    func addCoffeeOrderViewControllerDidSave(order: Order, controller: UIViewController)
    func addCoffeeOrderViewControllerDidClose(controller: UIViewController)
}

class AddOrderController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    private var vm = AddCoffeeOrderViewModel()
    private var coffeeSizesSegmentedControl: UISegmentedControl!
    
    var delegate: AddCoffeeOrderDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
//        self.tableView.delegate = self
//        self.tableView.dataSource = self
    }
    
    private func setupUI() {
        self.coffeeSizesSegmentedControl = UISegmentedControl(items: self.vm.sizes)
        self.coffeeSizesSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.coffeeSizesSegmentedControl)
        
        self.coffeeSizesSegmentedControl.topAnchor.constraint(equalTo: self.tableView.bottomAnchor, constant: 20).isActive = true
        self.coffeeSizesSegmentedControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.vm.types.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoffeeTypeTableView", for: indexPath)
        cell.textLabel?.text = self.vm.types[indexPath.row]
        
        return cell
    }
    
    @IBAction func close() {
        if let delegate = self.delegate {
            delegate.addCoffeeOrderViewControllerDidClose(controller: self)
        }
    }
    
    @IBAction func save() {
        let name = self.nameTextField.text
        let email = self.emailTextField.text
        let selectedSize = self.coffeeSizesSegmentedControl.titleForSegment(at: self.coffeeSizesSegmentedControl.selectedSegmentIndex)
        guard let indexPath = self.tableView.indexPathForSelectedRow else {
            fatalError("Error in selected coffee!")
        }
        
        self.vm.name = name
        self.vm.email = email
        self.vm.selectedType = self.vm.types[indexPath.row]
        self.vm.selectedSize = selectedSize
        
        Webservice().load(resource: Order.create(vm: self.vm)) { result in
            switch result {
            case .success(let order):
                if let order = order, let delegate = self.delegate {
                    DispatchQueue.main.async {
                        delegate.addCoffeeOrderViewControllerDidSave(order: order, controller: self)
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

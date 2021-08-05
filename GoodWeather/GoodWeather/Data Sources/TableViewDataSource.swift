//
//  TableViewDataSource.swift
//  GoodWeather
//
//  Created by Ramon Ferreira on 05/08/21.
//

import Foundation
import UIKit

class TableViewDataSource<CellType, ViewModel>: NSObject, UITableViewDataSource where CellType: UITableViewCell {

    let cellIdentifier: String
    var items: [ViewModel]
    let configureCell: (CellType, ViewModel) -> ()
    
    init(cellIndentifier: String, items: [ViewModel], configureCell: @escaping (CellType, ViewModel) -> ()) {
        self.cellIdentifier = cellIndentifier
        self.items = items
        self.configureCell = configureCell
    }
    
    func updateItems(_ items: [ViewModel]) {
        self.items = items
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as? CellType else {
            fatalError("Cell with identifier \(self.cellIdentifier) not found")
        }
        
        let viewModel = self.items[indexPath.row]
        self.configureCell(cell, viewModel)
        
        return cell
    }
}

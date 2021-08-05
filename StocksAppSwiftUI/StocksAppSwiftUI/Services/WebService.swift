//
//  WebService.swift
//  StocksAppSwiftUI
//
//  Created by Ramon Ferreira on 24/05/21.
//

import Foundation

class WebService {
    
    func getTopNews(completion: @escaping (([Article]?) -> Void)) {
        guard let url = URL(string: "https://island-bramble.glitch.me/top-news") else {
            fatalError("URL ir not correct")
        }
    
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let articles = try? JSONDecoder().decode([Article].self, from: data)
            
            DispatchQueue.main.async {
                completion(articles)
            }
        }.resume()
    }
    
    func getStocks(completion: @escaping (([Stock]?) -> Void)) {
        guard let url = URL(string: "https://island-bramble.glitch.me/stocks") else {
            fatalError("URL ir not correct")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let stocks = try? JSONDecoder().decode([Stock].self, from: data)
            
            DispatchQueue.main.async {
                completion(stocks)
            }
        }.resume()
    }
}

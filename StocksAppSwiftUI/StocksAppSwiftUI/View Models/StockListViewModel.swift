//
//  StockListViewModel.swift
//  StocksAppSwiftUI
//
//  Created by Ramon Ferreira on 24/05/21.
//

import Foundation
import SwiftUI

class StockListViewModel: ObservableObject {
    
    @Published var dragOffset: CGSize = CGSize(width: 0, height: 650)
    @Published var searchTerm: String = ""
    @Published var stocks: [StockViewModel] = [StockViewModel]()
    @Published var news: [NewsArticleViewModel] = [NewsArticleViewModel]()
    
    func load() {
        fetchNews()
        fetchStocks()
    }
    
    private func fetchNews() {
        WebService().getTopNews { news in
            if let news = news {
                self.news = news.map(NewsArticleViewModel.init)
            }
        }
    }
    
    private func fetchStocks() {
        WebService().getStocks { stocks in
            if let stocks = stocks {
                self.stocks = stocks.map(StockViewModel.init)
            }
        }
    }
}

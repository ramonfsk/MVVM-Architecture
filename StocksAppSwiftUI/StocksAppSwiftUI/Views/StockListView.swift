//
//  StockListView.swift
//  StocksAppSwiftUI
//
//  Created by Ramon Ferreira on 24/05/21.
//

import SwiftUI

struct StockListView: View {
    
    let stocks: [StockViewModel]
    
    var body: some View {
        List(self.stocks, id: \.symbol) { stock in
            StockCellView(stock: stock)
        }
    }
}

struct StockCellView: View {
    
    let stock: StockViewModel
    
    var body: some View {
        return HStack {
            VStack(alignment: .leading) {
                Text(stock.symbol)
                    .font(.custom("Arial", size: 22))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color.white)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                Text(stock.description)
                    .font(.custom("Arial", size: 18))
                    .foregroundColor(Color.gray)
            }
            
            Spacer()
            
            VStack {
                Text("\(stock.price)")
                    .font(.custom("Arial", size: 22))
                    .foregroundColor(Color.white)
                Button(stock.change) {}
                    .frame(width: 75)
                    .padding(5)
                    .background(Color.red)
                    .foregroundColor(Color.white)
                    .cornerRadius(6)
            }
        }
    }
}

struct StockListView_Previews: PreviewProvider {
    static var previews: some View {
        let stock = Stock(symbol: "", description: "", price: 0.0, change: "")
        return StockListView(stocks: [StockViewModel(stock: stock)])
    }
}

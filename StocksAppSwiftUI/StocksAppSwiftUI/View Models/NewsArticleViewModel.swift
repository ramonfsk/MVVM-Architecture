//
//  NewsArticleViewModel.swift
//  StocksAppSwiftUI
//
//  Created by Ramon Ferreira on 24/05/21.
//

import Foundation

struct NewsArticleViewModel {
    
    let article: Article
    
    var title: String {
        return self.article.title ?? ""
    }
    
    var imageURL: String {
        return self.article.imageURL ?? ""
    }
    
    var publication: String {
        return self.article.publication?.uppercased() ?? ""
    }
}

//
//  Article.swift
//  GoodNews
//
//  Created by Ramon Ferreira on 21/04/21.
//

import Foundation

struct ArticleList: Codable {
    let articles: [Article]?
}

struct Article: Codable {
    let title: String?
    let description: String?
}

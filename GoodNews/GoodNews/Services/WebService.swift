//
//  WebService.swift
//  GoodNews
//
//  Created by Ramon Ferreira on 21/04/21.
//

import Foundation

class WebService {
    
    func getArticles(url: URL, completion: @escaping ([Article]?) -> ()) {
        URLSession.shared.dataTask(with: url) { (jsonData, response, error) in
            if let error = error {
                print(error)
                completion(nil)
            } else if let jsonData = jsonData {
                let articleList = try? JSONDecoder().decode(ArticleList.self, from: jsonData)
                if let articleList = articleList {
                    completion(articleList.articles)
                }
            }
        }.resume()
    }
}

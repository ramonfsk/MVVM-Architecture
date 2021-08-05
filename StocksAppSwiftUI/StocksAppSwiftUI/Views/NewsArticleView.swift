//
//  NewsArticleView.swift
//  StocksAppSwiftUI
//
//  Created by Ramon Ferreira on 24/05/21.
//

import SwiftUI
import URLImage

struct NewsArticleView: View {
    
    let newsArticles: [NewsArticleViewModel]
    let onDragBegin: (DragGesture.Value) -> Void
    let onDragEnd: (DragGesture.Value) -> Void

    var body: some View {
        let screenSize = UIScreen.main.bounds.size
        
        return VStack(alignment: .leading) {
            HStack {
            VStack(alignment: .leading) {
                Text("Top News")
                    .font(.largeTitle)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color.white)
                    .padding(2)
                
                Text("From News")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
                    .padding(2)
            }
            }.padding().contentShape(Rectangle())
            .gesture(DragGesture()
            .onChanged(self.onDragBegin)
            .onEnded(self.onDragEnd))
                ScrollView {
                    VStack {
                        ForEach(self.newsArticles, id: \.title) { article in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(article.publication)
                                        .font(.custom("Arial", size: 22))
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.white)
                                    Text(article.title)
                                        .font(.custom("Arial", size: 22))
                                        .foregroundColor(Color.white)
                                }
                            }
                            
                            Spacer()
                            
                            URLImage(URL(string: article.imageURL)!) { image in
                                image
                                    .resizable()
                                    .frame(width: 100, height: 100)
                            }
                        }
                    }.frame(minWidth: .infinity)
                }
        }.frame(width: screenSize.width, height: screenSize.height)
        .background(Color(red: 27/255, green: 28/255, blue: 30/255))
        .cornerRadius(20)
    }
}

struct NewsArticleView_Previews: PreviewProvider {
    static var previews: some View {
        let article = Article(title: "The Bull Market is Charging into 2020", imageURL: "https://image.cnbcfm.com/api/v1/image/106551745-1590491340609gettyimages-1215156224.jpeg?v=1617898534&w=678&h=381", publication: "THE WALL STREET JOURNAL")
        return NewsArticleView(newsArticles: [NewsArticleViewModel(article: article)], onDragBegin: { _ in }, onDragEnd: { _ in })
    }
}

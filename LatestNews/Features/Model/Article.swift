//
//  Article.swift
//  LatestNews
//
//  Created by Arslan Kaan AYDIN on 25.03.2022.
//

import Foundation


struct ArticleList: Decodable{
    let articles: [Article]
}

struct Article: Decodable {
    let title: String?
    let description: String?
}
